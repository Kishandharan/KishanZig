const std = @import("std");

pub fn main() !void{
	const c:u8 = 'C';

	if(c == 'A'){
		std.debug.print("You have chosen path A", .{});
	}else if(c == 'B'){
		std.debug.print("You have chosen path B", .{});
	}else if(c == 'C'){
		std.debug.print("You have chosen path C", .{});
	}else{
		std.debug.print("You have chosen an IMPOSSIBLE path", .{});
	}
}