const std = @import("std");

pub fn main() !void {
    const num1: u4 = 15; // 1111
    const num2: u3 = @truncate(num1);
    std.debug.print("{}", .{num2});
}
