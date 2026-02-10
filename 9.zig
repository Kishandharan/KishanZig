const std = @import("std");

pub fn main() !void{
    var small:u5 = 30;
    small += 30;
    std.debug.print("{d}", .{small});
}
