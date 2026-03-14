const std = @import("std");

pub fn main() !void {
    var stdout_buff: [1000]u8 = undefined;
    var file_buff: [100]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buff);
    const stdout_interface = &stdout_writer.interface;
    const file1 = try std.fs.cwd().createFile("file_created_using_Zig.txt", .{ .read = true });
    defer file1.close();
    file1.writeAll("Hello file") catch |err| {
        try stdout_interface.print("Error: {any}", .{err});
    };
    file1.seekTo(0) catch |err| {
        try stdout_interface.print("Error: {any}", .{err});
    };
    _ = try file1.readAll(&file_buff);
    try stdout_interface.print("File content: {s}", .{file_buff[0..]});
    try stdout_interface.flush();
}
