const std = @import("std");

pub fn main() !void{
	var arr1:[5]u32 = [5]u32{1,2,3,4,5};
	var mip1:[*]u32 = &arr1;

	std.debug.print("{any}\n", .{mip1[0]});
	mip1 += 1;
	std.debug.print("{any}\n", .{mip1[1]});
	mip1 -= 1;
	std.debug.print("{any}", .{mip1[1]});
}