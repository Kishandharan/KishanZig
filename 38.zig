const std = @import("std");
const print = std.debug.print;

fn alloc100IntBytes(allocator: std.mem.Allocator) error{OutOfMemory}![]i32{
	if(allocator.alloc(i32, 100)) |val|{
		return val;
	}else |err|{
		return err;
	}

}

pub fn main() !void{
	const PL = std.heap.page_allocator;
	const bytes: []i32 = alloc100IntBytes(PL) catch |err|{
		print("Error: {any}", .{err});
		return;
	};

	for(0..bytes.len)|i|{
		bytes[i] = 0;
	}

	print("Look at this masterpiece: {any}", .{bytes});
 }