const std = @import("std");

pub fn allocHundred(comptime T: type, allocator: std.mem.Allocator) ![]T {
    const slice: []T = try allocator.alloc(T, 100);
    return slice;
}

pub fn main() !void {
    const allocator: std.mem.Allocator = std.heap.page_allocator;
    const slice: []u8 = try allocHundred(u8, allocator);

    for (0..100) |i| {
        slice[i] = 'a';
    }

    std.debug.print("{s}", .{slice});
}
