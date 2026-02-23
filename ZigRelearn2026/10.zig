const std = @import("std");

pub fn main() !void{
	const num1:?i32 = null;
	//_ = num1.?; // Crashes at runtime

	//if(num1 != null){
	//std.debug.print("Value: {}", .{num1.?});
	//}else{
	//std.debug.print("Value is null", .{});
	//}
	// This will print "Value is null"

	//if(num1) |value|{
	//std.debug.print("Value is: {}", .{value});
	//}else{
	//std.debug.print("Value is null", .{});
	//}

	std.debug.print("Value: {}", .{num1 orelse 0});
	//Simplest possible.
	//Prints Value: 0
}