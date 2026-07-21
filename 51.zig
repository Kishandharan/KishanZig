const std = @import("std");

pub fn square(val: anytype) @TypeOf(val) {
    return val * val;
}

pub fn main() !void {
    const num1: i32 = 10;
    const num2: u32 = 10;
    const num3: u100 = 10;

    std.debug.print("{d} {any}\n", .{ square(num1), @TypeOf(square(num1)) });
    std.debug.print("{d} {any}\n", .{ square(num2), @TypeOf(square(num2)) });
    std.debug.print("{d} {any}\n", .{ square(num3), @TypeOf(square(num3)) });
}
