const std = @import("std");

pub fn main() !void {
    var buff: [10000]u8 = undefined;
    var arr1: [100000]i32 = undefined;

    var stdout_w = std.fs.File.stdout().writer(&buff);
    const stdout_i = &stdout_w.interface;

    for (0..arr1.len) |i| {
        arr1[i] = @intCast(i + 1);
    }

    try stdout_i.print("{any}", .{arr1});
    try stdout_i.flush();
}
