const std = @import("std");

pub fn main() !void {
    var input_buff: [1024]u8 = undefined;
    var reader1 = std.fs.File.stdin().reader(&input_buff);
    var reader2 = &reader1.interface;
    _ = try reader2.takeDelimiterExclusive('\n');
}
