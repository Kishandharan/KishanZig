const std = @import("std");

pub fn main() !void{
	const var1:?i32 = null;
	std.debug.print("{any}", .{var1});
}