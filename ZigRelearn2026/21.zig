const std = @import("std");

pub fn main() !void {
    var buff: [5000]u8 = undefined;
    var reader1 = std.fs.File.stdin().reader(&buff);
    var reader2 = &reader1.interface;
    const line: []u8 = try reader2.takeDelimiterExclusive('\n');

    std.debug.print("You entered {s}", .{line});
}
