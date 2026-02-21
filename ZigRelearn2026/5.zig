const std = @import("std");

pub fn main() !void{
	const c:u8 = 'C';

	std.debug.print("{s}", .{
		switch(c){
			'A' => "Chose A",
			'B' => "Chose B",
			else => "Chose somthing OTHER than A and B"
		}
	});
}