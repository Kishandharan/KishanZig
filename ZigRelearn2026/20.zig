const std = @import("std");

pub fn main() !void {
    var arr1: [3]u8 = [3]u8{ 'a', 'b', 'c' };
    var mip1: [*]u8 = &arr1;

    mip1 += 1;
    std.debug.print("{}\n", .{mip1[0]});

    mip1 -= 1;
    std.debug.print("{}\n", .{mip1[1]});
}
