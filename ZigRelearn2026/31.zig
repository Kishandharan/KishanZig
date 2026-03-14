const std = @import("std");

pub fn main() !void {

    // Comptime Logic
    @setEvalBranchQuota(100300);
    comptime var arr1: [100000]i32 = undefined;
    comptime {
        for (0..arr1.len) |i| {
            arr1[i] = @intCast(i + 1);
        }
    }

    // Runtime Logic
    var buff: [10000]u8 = undefined;
    var stdout_w = std.fs.File.stdout().writer(&buff);
    const stdout_i = &stdout_w.interface;

    try stdout_i.print("{any}", .{arr1});
    try stdout_i.flush();
}
