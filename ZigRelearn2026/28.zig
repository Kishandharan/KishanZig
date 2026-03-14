const std = @import("std");

pub fn main() !void {
    var buff: [1024]u8 = undefined;
    var stdout_w = std.fs.File.stdout().writer(&buff);
    const stdout_i = &stdout_w.interface;
    const var1 = comptime ".";

    try stdout_i.print("Hello, this is the production way of printing {s}", .{var1});
    try stdout_i.flush();
}
