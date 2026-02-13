const std = @import("std");

pub fn main() !void{
	comptime var i:i32 = 10;

	i += 100;
	std.debug.print("{d}",.{i});
}