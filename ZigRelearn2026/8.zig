const std = @import("std");

fn max(num1:i32, limit:i32)!i32{
	const cond:bool = num1 <= limit;
	return switch(cond){
		true => num1,
		false => std.debug.print("Hello", .{}),
	};
}


pub fn main() !void{
	var i = 10;
	i = 20;
	_ = try max(i, i);
}