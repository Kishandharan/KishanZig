const std = @import("std");

pub fn main() !void{
	const val1:i32 = 19;

	//_ = switch(true){
	//val1>=10 and val1<20 => std.debug.print("Value is between (inclusive) 10 and 20", .{}),
	//else => std.debug.print("Value is something else", .{})
	//};
	// Untidy but working way. Prints Value is something else

	_ = switch(val1){
		10...20 => std.debug.print("value is between 10 and 20", .{}),
		else => std.debug.print("Value is something else", .{})
	};
	// Much tidier way
}