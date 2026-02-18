const std = @import("std");

pub fn main() !void{
	var buf1:[1024]u8 = undefined;
	var reader = std.fs.File.stdin().reader(&buf1);
	const inp1:?[]u8 = try reader.interface.takeDelimiter('\n');
	const inp2:[]const u8 = inp1 orelse "1";
	const intinp3:i32 = try std.fmt.parseInt(i32, inp2[0..inp2.len-1], 10);

	std.debug.print("{d}\n", .{intinp3});
	std.debug.print("{any}", .{@TypeOf(intinp3)});
}