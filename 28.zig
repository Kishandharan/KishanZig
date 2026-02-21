const std = @import("std");

pub fn main() !void{
    var buf1:[1024]u8 = undefined;
    var fba1 = std.heap.FixedBufferAllocator.init(&buf1);
    const allocator1 = fba1.allocator();    
    var list1:std.ArrayList(u8) = try .initCapacity(allocator1, 0);
    defer list1.deinit(allocator1);

    try list1.append(allocator1, 1);
    try list1.append(allocator1, 1);
    try list1.append(allocator1, 1);
    try list1.append(allocator1, 1);

    std.debug.print("{any}", .{list1.items});
}
