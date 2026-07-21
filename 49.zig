const std = @import("std");

pub fn main() !void {
    const num1: u2 = 1;
    const num2: u2 = num1 << 1;
    std.debug.print("{d}\n", .{num2});

    const num3: u3 = 2;
    const num4: u3 = num3 >> 1;
    std.debug.print("{d}\n", .{num4});
}
