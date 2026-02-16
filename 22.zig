const std = @import("std");

pub fn main() !void{
	comptime var var1:u32 = 10;
	var1+=1;
	std.debug.print("{d}", .{var1});
}