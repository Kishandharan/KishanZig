const std = @import("std");
const win = @cImport({
    @cInclude("windows.h");
});

const ExerciseType = enum {
    bench_press,
    squat,
    deadlift,
    overhead_press,
    barbell_row,
    pull_up,
    push_up,
    custom,
};

const Exercise = struct {
    name: []const u8,
    exercise_type: ExerciseType,
    sets: u8,
    reps: u8,
    weight_kg: f32,
};

const Workout = struct {
    date: []const u8,
    exercises: []Exercise,
};

const GymTracker = struct {
    allocator: std.mem.Allocator,
    workouts: std.ArrayList(Workout),

    pub fn init(allocator: std.mem.Allocator) GymTracker {
        return GymTracker{
            .allocator = allocator,
            .workouts = .empty,
        };
    }

    pub fn deinit(self: *GymTracker) void {
        // Free internal allocations
        for (self.workouts.items) |w| {
            for (w.exercises) |ex| {
                self.allocator.free(ex.name);
            }
            self.allocator.free(w.date);
            self.allocator.free(w.exercises);
        }
        self.workouts.deinit(self.allocator);
    }

    fn cloneSlice(self: *GymTracker, s: []const u8) ![]u8 {
        const buf = try self.allocator.alloc(u8, s.len);
        std.mem.copyForwards(u8, buf, s);
        return buf;
    }

    pub fn addWorkout(self: *GymTracker, date: []const u8, src_exercises: []const Exercise) !void {
        var exercises_copy = try self.allocator.alloc(Exercise, src_exercises.len);
        for (src_exercises, 0..) |ex, i| {
            exercises_copy[i] = .{
                .name = try self.cloneSlice(ex.name),
                .exercise_type = ex.exercise_type,
                .sets = ex.sets,
                .reps = ex.reps,
                .weight_kg = ex.weight_kg,
            };
        }

        const date_copy = try self.cloneSlice(date);

        try self.workouts.append(self.allocator, .{
            .date = date_copy,
            .exercises = exercises_copy,
        });
    }

    pub fn listWorkouts(self: *GymTracker, writer: anytype) !void {
        if (self.workouts.items.len == 0) {
            try writer.print("No workouts logged yet.\n", .{});
            return;
        }

        for (self.workouts.items, 0..) |w, wi| {
            try writer.print("Workout {d} - {s}\n", .{ wi + 1, w.date });
            for (w.exercises, 0..) |ex, ei| {
                try writer.print(
                    "  {d}. {s}: {d} sets x {d} reps @ {d:.1} kg\n",
                    .{ ei + 1, ex.name, ex.sets, ex.reps, ex.weight_kg },
                );
            }
            try writer.writeByte('\n');
        }
    }

    pub fn summary(self: *GymTracker, writer: anytype) !void {
        if (self.workouts.items.len == 0) {
            try writer.print("No data to summarize.\n", .{});
            return;
        }

        const total_sessions: usize = self.workouts.items.len;
        var total_exercises: usize = 0;
        var total_volume: f64 = 0; // sum(sets * reps * weight)

        for (self.workouts.items) |w| {
            total_exercises += w.exercises.len;
            for (w.exercises) |ex| {
                const sets_f = @as(f64, @floatFromInt(ex.sets));
                const reps_f = @as(f64, @floatFromInt(ex.reps));
                const weight_f = @as(f64, ex.weight_kg);
                total_volume += sets_f * reps_f * weight_f;
            }
        }

        const avg_exercises = @as(f64, @floatFromInt(total_exercises)) / @as(f64, @floatFromInt(total_sessions));

        try writer.print("=== Summary ===\n", .{});
        try writer.print("Sessions:       {d}\n", .{total_sessions});
        try writer.print("Total exercises:{d}\n", .{total_exercises});
        try writer.print("Avg per session:{d:.2}\n", .{avg_exercises});
        try writer.print("Total volume:   {d:.1} kg\n", .{total_volume});
    }
};

// ----------------- GUI Helpers & State -----------------

var g_tracker: *GymTracker = undefined;
var g_allocator: std.mem.Allocator = undefined;
var g_hList: ?win.HWND = null;
var g_hBtnAdd: ?win.HWND = null;
var g_hBtnSummary: ?win.HWND = null;
var g_hBtnExit: ?win.HWND = null;

const CLASS_NAME: [12:0]u16 = .{ 'Z', 'i', 'g', 'G', 'y', 'm', 'T', 'r', 'a', 'c', 'k', 0 };
const TITLE_MAIN: [16:0]u16 = .{ 'Z', 'i', 'g', ' ', 'G', 'y', 'm', ' ', 'T', 'r', 'a', 'c', 'k', 'e', 'r', 0 };
const WC_BUTTON: [7:0]u16 = .{ 'B', 'U', 'T', 'T', 'O', 'N', 0 };
const WC_LISTBOX: [8:0]u16 = .{ 'L', 'I', 'S', 'T', 'B', 'O', 'X', 0 };

fn asciiToWide(buf: []u16, text: []const u8) [*:0]u16 {
    const max_chars = if (text.len < buf.len - 1) text.len else buf.len - 1;
    var i: usize = 0;
    while (i < max_chars) : (i += 1) {
        buf[i] = @intCast(text[i]);
    }
    buf[max_chars] = 0;
    return @ptrCast(&buf[0]);
}

fn makeSummaryString(tracker: *GymTracker, allocator: std.mem.Allocator) ![]u8 {
    if (tracker.workouts.items.len == 0) {
        const msg = "No data to summarize.\n";
        const buf = try allocator.alloc(u8, msg.len);
        std.mem.copyForwards(u8, buf, msg);
        return buf;
    }

    var total_exercises: usize = 0;
    var total_volume: f64 = 0;

    for (tracker.workouts.items) |w| {
        total_exercises += w.exercises.len;
        for (w.exercises) |ex| {
            const sets_f = @as(f64, @floatFromInt(ex.sets));
            const reps_f = @as(f64, @floatFromInt(ex.reps));
            const weight_f = @as(f64, ex.weight_kg);
            total_volume += sets_f * reps_f * weight_f;
        }
    }

    const total_sessions: usize = tracker.workouts.items.len;
    const avg_exercises = @as(f64, @floatFromInt(total_exercises)) / @as(f64, @floatFromInt(total_sessions));

    var list: std.ArrayList(u8) = .empty;
    defer list.deinit(allocator);

    try list.appendSlice(allocator, "=== Summary ===\n");
    try std.fmt.format(list.writer(allocator), "Sessions:       {d}\n", .{total_sessions});
    try std.fmt.format(list.writer(allocator), "Total exercises:{d}\n", .{total_exercises});
    try std.fmt.format(list.writer(allocator), "Avg per session:{d:.2}\n", .{avg_exercises});
    try std.fmt.format(list.writer(allocator), "Total volume:   {d:.1} kg\n", .{total_volume});

    return try list.toOwnedSlice(allocator);
}

fn addWorkoutToListBox(w: Workout) void {
    const hList = g_hList orelse return;

    var tmp: [128]u8 = undefined;
    const text = std.fmt.bufPrint(&tmp, "{s} - {d} exercises", .{ w.date, w.exercises.len }) catch return;

    var wbuf: [128]u16 = undefined;
    const wptr = asciiToWide(&wbuf, text);

    _ = win.SendMessageW(
        hList,
        win.LB_ADDSTRING,
        0,
        @as(c_longlong, @intCast(@intFromPtr(wptr))),
    );
}

fn showSummary(hwnd: win.HWND) void {
    const text_bytes = makeSummaryString(g_tracker, g_allocator) catch return;
    defer g_allocator.free(text_bytes);

    var wbuf: [512]u16 = undefined;
    const wtext = asciiToWide(&wbuf, text_bytes);

    _ = win.MessageBoxW(hwnd, wtext, &TITLE_MAIN, win.MB_OK);
}

fn MainWndProc(hwnd: win.HWND, msg: win.UINT, wParam: win.WPARAM, lParam: win.LPARAM) callconv(.winapi) win.LRESULT {
    switch (msg) {
        win.WM_CREATE => {
            const hInstance = win.GetModuleHandleW(null);

            const hList = win.CreateWindowExW(
                0,
                &WC_LISTBOX,
                null,
                win.WS_CHILD | win.WS_VISIBLE | win.LBS_NOTIFY | win.WS_BORDER | win.WS_VSCROLL,
                10,
                10,
                360,
                200,
                hwnd,
                null,
                hInstance,
                null,
            );
            g_hList = hList;

            // Add Workout button
            const txt_add: [12:0]u16 = .{ 'A', 'd', 'd', ' ', 'W', 'o', 'r', 'k', 'o', 'u', 't', 0 };
            const hBtnAdd = win.CreateWindowExW(
                0,
                &WC_BUTTON,
                &txt_add,
                win.WS_CHILD | win.WS_VISIBLE | win.BS_PUSHBUTTON,
                10,
                220,
                100,
                30,
                hwnd,
                null,
                hInstance,
                null,
            );
            g_hBtnAdd = hBtnAdd;

            // Summary button
            const txt_sum: [8:0]u16 = .{ 'S', 'u', 'm', 'm', 'a', 'r', 'y', 0 };
            const hBtnSummary = win.CreateWindowExW(
                0,
                &WC_BUTTON,
                &txt_sum,
                win.WS_CHILD | win.WS_VISIBLE | win.BS_PUSHBUTTON,
                120,
                220,
                100,
                30,
                hwnd,
                null,
                hInstance,
                null,
            );
            g_hBtnSummary = hBtnSummary;

            // Exit button
            const txt_exit: [5:0]u16 = .{ 'E', 'x', 'i', 't', 0 };
            const hBtnExit = win.CreateWindowExW(
                0,
                &WC_BUTTON,
                &txt_exit,
                win.WS_CHILD | win.WS_VISIBLE | win.BS_PUSHBUTTON,
                230,
                220,
                100,
                30,
                hwnd,
                null,
                hInstance,
                null,
            );
            g_hBtnExit = hBtnExit;

            return 0;
        },
        win.WM_COMMAND => {
            const hwndCtlInt: usize = @intCast(lParam);

            if (g_hBtnAdd) |btn_add| {
                if (hwndCtlInt == @intFromPtr(btn_add)) {
                    const ex = Exercise{
                        .name = "Bench Press",
                        .exercise_type = .bench_press,
                        .sets = 3,
                        .reps = 8,
                        .weight_kg = 60.0,
                    };
                    g_tracker.addWorkout("2026-03-10", &[_]Exercise{ex}) catch return 0;
                    const last = g_tracker.workouts.items[g_tracker.workouts.items.len - 1];
                    addWorkoutToListBox(last);
                    return 0;
                }
            }

            if (g_hBtnSummary) |btn_sum| {
                if (hwndCtlInt == @intFromPtr(btn_sum)) {
                    showSummary(hwnd);
                    return 0;
                }
            }

            if (g_hBtnExit) |btn_exit| {
                if (hwndCtlInt == @intFromPtr(btn_exit)) {
                    _ = win.DestroyWindow(hwnd);
                    return 0;
                }
            }

            return 0;
        },
        win.WM_DESTROY => {
            win.PostQuitMessage(0);
            return 0;
        },
        else => return win.DefWindowProcW(hwnd, msg, wParam, lParam),
    }
}

// Main GUI entry point (no CLI)
pub fn main() !void {
    const gpa = std.heap.page_allocator;
    var tracker = GymTracker.init(gpa);
    defer tracker.deinit();

    g_tracker = &tracker;
    g_allocator = gpa;

    var wc: win.WNDCLASSW = .{
        .style = win.CS_HREDRAW | win.CS_VREDRAW,
        .lpfnWndProc = MainWndProc,
        .cbClsExtra = 0,
        .cbWndExtra = 0,
        .hInstance = win.GetModuleHandleW(null),
        .hIcon = null,
        .hCursor = null,
        .hbrBackground = win.GetSysColorBrush(win.COLOR_WINDOW),
        .lpszMenuName = null,
        .lpszClassName = &CLASS_NAME,
    };

    if (win.RegisterClassW(&wc) == 0) return error.Unexpected;

    const hwnd = win.CreateWindowExW(
        0,
        &CLASS_NAME,
        &TITLE_MAIN,
        win.WS_OVERLAPPEDWINDOW | win.WS_VISIBLE,
        win.CW_USEDEFAULT,
        win.CW_USEDEFAULT,
        420,
        320,
        null,
        null,
        wc.hInstance,
        null,
    );
    if (hwnd == null) return error.Unexpected;

    var msg: win.MSG = undefined;
    while (win.GetMessageW(&msg, null, 0, 0) > 0) {
        _ = win.TranslateMessage(&msg);
        _ = win.DispatchMessageW(&msg);
    }
}

