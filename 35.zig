const std = @import("std");
const print = std.debug.print;

pub fn main() !void {
    const arr1: [5]i32 = .{ 1, 2, 3, 4, 5 };

    for (0..arr1.len) |i| {
        print("{d}", .{arr1[i]});
    }

    print("\n", .{});

    for (arr1) |i| {
        print("{d}", .{i});
    }

    print("\n", .{});

    var j: i32 = 0;
    while (j < 5) : (j += 1) {
        print("{d}", .{arr1[@intCast(j)]});
    }
}
