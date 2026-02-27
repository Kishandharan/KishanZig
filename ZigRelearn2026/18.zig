// Bit shift operators
const std = @import("std");

pub fn main() !void {
    const num1: u8 = 4; // 00000100
    const num2: u8 = num1 >> 2; // 00000001
    // const num2: u8 = num1 << 2; Results in 8

    std.debug.print("{}", .{num2});
}
