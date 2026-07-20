const std = @import("std");

pub fn main() !void {
    std.debug.print("This is normal release (debug by default)", .{});
}
