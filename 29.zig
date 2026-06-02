const std = @import("std");

pub fn main() !void {
    for (1..11) |i| {
        for (1..11) |j| {
            std.debug.print("{d}*{d} = {d}\n", .{ i, j, i * j });
        }
        std.debug.print("\n", .{});
    }
}
