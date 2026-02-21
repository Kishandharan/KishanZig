const std = @import("std");

const NumOpers = struct{
	num1:i32,
	num2:i32,
	fn add(self: NumOpers) i32{
		return self.num1 + self.num2;
	}
	fn sub(self: NumOpers) i32{
		return self.num1 - self.num2;
	}
};

pub fn main() !void{
	const numOpers1:NumOpers = .{.num1 = 1, .num2 = 2};
	std.debug.print("{} {}", .{numOpers1.add(), numOpers1.sub()});
}