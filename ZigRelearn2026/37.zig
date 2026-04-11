const std = @import("std");

pub fn main() !void {
    var buff1: [1000]u8 = undefined;
    var buff2: [10000]u8 = undefined;

    var stdi1 = std.fs.File.stdin().reader(&buff1);
    var stdo1 = std.fs.File.stdout().writer(&buff2);

    const stdi_intr1 = &stdi1.interface;
    const stdo_intr1 = &stdo1.interface;

    const line1 = try stdi_intr1.takeDelimiterExclusive('\n');
    const line2 = try stdi_intr1.takeDelimiterExclusive('\n');

    const stt1 = try std.fmt.parseInt(i32, line1[0 .. line1.len - 1], 10);
    const end1 = try std.fmt.parseInt(i32, line2[0 .. line2.len - 1], 10);

    for (@intCast(stt1)..@intCast(end1 + 1)) |i| {
        for (1..11) |j| {
            try stdo_intr1.print("{} * {} = {}\n", .{ i, j, i * j });
        }
        try stdo_intr1.print("", .{});
    }

    try stdo_intr1.flush();
}
