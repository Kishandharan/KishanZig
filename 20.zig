const std = @import("std");

pub fn typePrinter(T: type) void{
	const tester:T = undefined;
	std.debug.print("{any}", .{@TypeOf(tester)});
}

pub fn main() !void{
	typePrinter(u8);
}