const std = @import("std");

pub fn main() !void{
	var buffer1:[500]u8 = undefined; // Dont need this much buffer size. But using just for example 
	var fba1 = std.heap.FixedBufferAllocator.init(&buffer1);
	const fba_allocator1 = fba1.allocator();
	var list1:std.ArrayList(i32) = try .initCapacity(fba_allocator1,2);
	defer list1.deinit(fba_allocator1);		

	try list1.append(fba_allocator1, 1);
	try list1.append(fba_allocator1, 1);
	try list1.append(fba_allocator1, 1);
	try list1.append(fba_allocator1, 1);

	std.debug.print("{any}\n", .{list1.items});
	std.debug.print("{any}\n", .{list1.items.len});
}