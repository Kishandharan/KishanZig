const std = @import("std");

pub fn main() !void{
	const arr1 = [5]i32{1,2,3,4,5};

	// 12345
	for(0..arr1.len) |i|{
		std.debug.print("{}", .{arr1[i]});
	}
	std.debug.print("\n", .{});

	// 12345
	for(arr1) |i|{
		std.debug.print("{}", .{i});
	}
	std.debug.print("\n", .{});

	// 1021324354
	for(arr1,0..) |i, index| {
		std.debug.print("{}{}", .{i, index});
	}
	std.debug.print("\n", .{});
}