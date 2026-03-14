const std = @import("std");
const pageAllocator = std.heap.page_allocator;

pub fn main() !void {
    const contents = try std.fs.cwd().readFileAlloc(pageAllocator, "test1.txt", 3000 * 1024);

    std.debug.print("{any}\n", .{@TypeOf(contents)});
    std.debug.print("{s}\n", .{contents});
}

// So low level! I love it.
