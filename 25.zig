const std = @import("std");

pub fn mayReturnNull() ?i32{
	return 100;
}

pub fn main() !void{
	const var1:?i32 = mayReturnNull();
	std.debug.print("{any}", .{var1});
}