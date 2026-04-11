const std = @import("std");

pub fn maybeNull(val1: i32) ?i32 {
    if (val1 > 0) {
        return val1 * val1;
    }
    return null;
}

pub fn main() !void {
    const val1: ?i32 = maybeNull(0);
    std.debug.print("{any}", .{val1});
}
