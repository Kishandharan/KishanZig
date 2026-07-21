const std = @import("std");

pub fn main() !void {
    const num1: u8 = 255;
    const num2: u16 = @as(u16, num1);
    const num3: u32 = @intCast(num2);

    std.debug.print("{d} {any}\n", .{ num1, @TypeOf(num1) });
    std.debug.print("{d} {any}\n", .{ num2, @TypeOf(num2) });
    std.debug.print("{d} {any}\n", .{ num3, @TypeOf(num3) });
}
