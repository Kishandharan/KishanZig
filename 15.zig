const std = @import("std");

pub fn main() !void{
	const allocator = std.heap.smp_allocator;
	var bytes = try allocator.alloc(u8, 5);
	bytes[0] = 'H';
	bytes[1] = 'e';
	bytes[2] = 'l';
	bytes[3] = 'l';
	bytes[4] = 'o';
	std.debug.print("{s}", .{bytes});
	allocator.free(bytes);
}