const std = @import("std");

pub fn main() !void{
    // This will not work
    const num1:u64 = 100000000;
    const num2:u8 = @truncate(num1);

    std.debug.print("{d}", .{num2});
}

