const std = @import("std");

pub fn main() !void {
    var buffer1: [1000]u8 = undefined;
    var buffer2: [1000]u8 = undefined;

    var stdin_r = std.fs.File.stdin().reader(&buffer1);
    const stdin_i = &stdin_r.interface;

    var stdout_w = std.fs.File.stdout().writer(&buffer2);
    const stdout_i = &stdout_w.interface;

    const line: []u8 = try stdin_i.takeDelimiterExclusive('\n');
    try stdout_i.print("You entered: {s}", .{line});
    try stdout_i.flush();
}
