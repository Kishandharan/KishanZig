const std = @import("std");

pub fn main() !void{
	std.debug.assert(1 > 2); 
	// Assertion is basically like an if condition, 
	// except that if the condition results in false, it will panic at runtime
}