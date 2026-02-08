const std = @import("std");
const util = @import("2.zig");

pub fn main() !void{
    std.debug.print("{any}", .{util.add(10, 20)});
}
