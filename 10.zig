const std = @import("std");

pub fn main() !void {
    // +% triggers addition even if we it will overflow...
    // We can say it is overflow forced addition
    // Ignoring it in this scenario causes an error

    const num1: u8 = 255;
    const num2: u32 = num1 +% 100;

    std.debug.print("{d}", .{num2});
}
