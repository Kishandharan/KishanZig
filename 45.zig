const std = @import("std");

pub fn main() !void {
    var tippingNumber: u8 = 255;
    tippingNumber +%= 10;

    std.debug.print("{d}", .{tippingNumber});
}
