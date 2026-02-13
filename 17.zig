const std = @import("std");

pub fn main() !void{
    var buffer:[5]u8 = undefined;
    var fba = std.heap.FixedBufferAllocator.init(&buffer);
    const fba_allocator = fba.allocator();

    var bytes1 = try fba_allocator.alloc(u8, 3);
    defer fba_allocator.free(bytes1);
    bytes1[0] = 'H';
    bytes1[1] = 'E';
    bytes1[2] = 'L';

    var bytes2 = try fba_allocator.alloc(u8, 2);
    defer fba_allocator.free(bytes2);
    bytes2[0] = 'H';
    bytes2[1] = 'E';

    std.debug.print("{s}\n", .{bytes1});
    std.debug.print("{s}\n", .{bytes2});
}
