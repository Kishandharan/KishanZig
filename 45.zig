const std = @import("std");

pub fn main() !void {
    var num1: u8 = 255;
    var num2: u8 = 0;

    num1 +%= 1;
    num2 -%= 1;

    std.debug.print("{d}", .{num1}); // Will result in 0
    std.debug.print("{d}", .{num2}); // Will result in 255
}
