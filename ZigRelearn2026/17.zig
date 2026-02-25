const std = @import("std");

pub fn main() !void {
    var num1: i8 = -128;
    num1 = num1 -% 1; // -% or +% allows doing overflows
    std.debug.print("{}", .{num1});
}
