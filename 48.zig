const std = @import("std");

pub fn main() !void {
    const num1: u3 = 6;

    // This is supposed to be 2, if my calculations are correct.
    const num2: u2 = @truncate(num1);

    std.debug.print("\ntruncate({d}) = {d}\n", .{ num1, num2 });
}
