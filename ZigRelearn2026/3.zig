const std = @import("std");

const FavType = union(enum){
	int:i32,
	float:f32
};

pub fn main() !void{
	const ft1:FavType = .{.int = 10};
	std.debug.print("{}", .{ft1.int});
}