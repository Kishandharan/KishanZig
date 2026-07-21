const std = @import("std");

fn check(comptime val: anytype) void {
    const tp1 = @TypeOf(val);
    const tp2 = @typeInfo(tp1);
    if (tp2 == .int) {
        std.debug.print("This thing is an int\n");
        return;
    }

    std.debug.print("It is NOT an INT\n", .{});
    return; // Actually not needed, but there for consistency
}

pub fn main() !void {
    check("Bellow");
    check(10);
}
