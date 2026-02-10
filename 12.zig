// Unions
const std = @import("std");

const Integer = union (enum){
	extraSmall:u5,
	small:u8,
	medium:u16,
	large:u32,
	extraLarge:u64,
};

pub fn main() !void{
	//const union1 = Integer{.extraSmall=40};
	var union1 = Integer{.small=40};
	union1.small = 255;
	std.debug.print("{d}", .{union1.small});
}