const std = @import("std");

pub fn main() !void{
	var i:i32 = 1;
	var y:i32 = 1;


	while(i<=10){
		std.debug.print("{}", .{i});
		i+=1;
	}
	std.debug.print("\n", .{});

	while(y<=10):(y+=1){
		std.debug.print("{}", .{y});
	}
	std.debug.print("\n", .{});
}