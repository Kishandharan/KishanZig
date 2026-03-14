const std = @import("std");

pub fn main() !void {
    const pageAllocator: std.mem.Allocator = std.heap.page_allocator;
    var child1 = std.process.Child.init(&[_][]const u8{"yazi"}, pageAllocator);
    std.process.Child.spawn(&child1) catch {
        std.debug.print("Someting went wrong. Error", .{});
    };
    _ = try std.process.Child.wait(&child1);
}
