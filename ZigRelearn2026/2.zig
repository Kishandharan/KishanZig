const std = @import("std");

const Color = enum{
	Red,
	Green,
	Blue,
	fn describe(color: Color) u8{
		return switch(color){
			.Red => 'R',
			.Green => 'G',
			.Blue => 'B'
		};
	}
};

pub fn main() !void{
	std.debug.print("{}", .{Color.Red.describe()});
}