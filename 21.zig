const std = @import("std");

pub fn main() !void{
	comptime var var1:i8 = 10;
	const runtimevar1 = 10;
	var1+=runtimevar1;

}