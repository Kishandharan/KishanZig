const std = @import("std");

pub fn add(comptime T:type, num1:T, num2:T)T{
	return num1+num2;
}

pub fn main() !void{
	std.debug.print("{}", .{add(i32, 1, 2)});
}