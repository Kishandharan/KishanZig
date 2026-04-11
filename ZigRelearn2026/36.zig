const std = @import("std");

pub fn main() !void {
    var buff1: [1000]u8 = undefined;
    var buff2: [1000]u8 = undefined;
    var stdout_w = std.fs.File.stdout().writer(&buff1);
    var stdin_r = std.fs.File.stdin().reader(&buff2);
    const stdout_i = &stdout_w.interface;
    const stdin_i = &stdin_r.interface;
    var i: u32 = undefined;

    const line = try stdin_i.takeDelimiterExclusive('\n');
    i = try std.fmt.parseInt(u32, line[0 .. line.len - 1], 10);

    for (0..i + 1) |y| {
        try stdout_i.print("{}\n", .{y});
    }

    try stdout_i.flush();
}
