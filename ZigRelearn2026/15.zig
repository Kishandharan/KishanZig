const std = @import("std");

test "test1"{
	const x:i32 = 10;
	const y:i32 = 20;
	try std.testing.expect(y > x);
}
test "test2"{
	const x:i32 = 10;
	const y:i32 = 20;
	try std.testing.expect(x > y);
}
