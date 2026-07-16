const std = @import("std");

fn math(T: type, x: T, y: T) ?T {
    if (y != 0) {
        return x / y;
    } else {
        return null;
    }
}

pub fn main() !void {
    const div1: ?i32 = comptime math(i32, 100, 0);
    if (div1) |val| {
        std.debug.print("{d}", .{val});
    } else {
        std.debug.print("Zero devision not allowed bro..", .{});
    }
}
