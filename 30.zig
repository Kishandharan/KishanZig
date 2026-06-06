const std = @import("std");

pub fn main() !void {
    var buff1: [1024]u8 = undefined;
    var out1 = std.fs.File.stdout().writer(&buff1);
    const out2 = &out1.interface;

    try out2.print("hello world", .{});
    try out2.flush();
}
