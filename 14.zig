const std = @import("std");

const Cord_3d = struct{
	x:u32 = 0,
	y:u32 = 0,
	z:u32 = 0,
	fn shoutCord(self: *Cord_3d) void{
		self.x = 100;
		std.debug.print("{d} {d} {d}!!!", .{self.x, self.y, self.z});
	}
};

pub fn main() !void{
	var cord1 = Cord_3d{.x=10, .y=10, .z=10};
	cord1.shoutCord();
	std.debug.print("\n{d} {d} {d}", .{cord1.x, cord1.y, cord1.z});
}