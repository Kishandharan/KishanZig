// Enums
const std = @import("std");

const Enum1 = enum(u32){
	num1 = 10,
	num2 = 100,
	num3 = 1000,
	num4 = 10000,
	fn describe(self: Enum1)[]const u8{
		return switch (self) {
		    .num1 => "Small",
		    .num2 => "Medium",
		    .num3 => "Large",
		    .num4 => "Very Large"
		};
	}
};

pub fn main() !void{
	const val1: Enum1 = .num1;
	std.debug.print("{s}", .{val1.describe()});
}