const std = @import("std");

pub fn main() !void {
    var buffer: [1024]u8 = undefined;
    const file = std.fs.File.cwd().openFile("test.txt", .{});

    _ = try file.readAll(&buffer);
    std.debug.print("{s}", .{buffer[0..]});
}
