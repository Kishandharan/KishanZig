const std = @import("std");
const pageAllocator = std.heap.page_allocator;

pub fn main() !void {
    var process = try std.ChildProcess.init(pageAllocator);
    defer process.deinit();

    try process.setArgv([_][]const u8{"dir"});
    process.spawn();

    const status: i32 = process.wait();

    std.debug.print("{}", .{status});
}
