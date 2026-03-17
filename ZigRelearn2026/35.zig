const std = @import("std");

pub fn main() !void {
    const i: comptime_int = 0;

    const result: i32 = block1: {
        break :block1 i + 1;
    };

    std.debug.print("Result: {}", .{result});
}
