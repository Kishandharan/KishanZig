const std = @import("std");

pub fn main() !void {

    // Comptime Logic
    @setEvalBranchQuota(100300);
    comptime var arr1: [100000]i32 = undefined;
    comptime {
        for (0..arr1.len) |i| {
            arr1[i] = @intCast(i + 1);
        }
    }
}
