const std = @import("std");

pub fn main() !void {
    var arr1: [100000]i32 = undefined;

    for (0..arr1.len) |i| {
        arr1[i] = @intCast(i + 1);
    }
}
