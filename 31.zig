const std = @import("std");

const Tag = enum { small, large };

const Num = union(Tag) { small: i2, large: i4 };

pub fn main() !void {
    var union1: Num = .{ .large = 5 }; // .small can't handle numbers above 4, while large can
    union1.large = 2;
    std.debug.print("{d}", .{union1.large});
}
