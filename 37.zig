const std = @import("std");
const print = std.debug.print;
var num1: i32 = 8;

fn divide(x: f32, y: f32) ?f32 {
    if (x > 0 and y > 0) {
        return x / y;
    }

    return null;
}

fn nullEndingSequence() ?i32 {
    if (num1 == 0) {
        return null;
    }

    num1 -= 1;
    return num1;
}

pub fn main() !void {
    const result: ?f32 = divide(0, 0);

    // This will print "null"
    //print("{any}", .{result});

    // This will panic at runtime
    //print("{any}", .{result.?})

    // This will print "Value is null"
    //if (result != null) {
    //    print("Non-null value: {any}", .{result});
    //} else {
    //    print("Value is null", .{});
    //}

    // A "syntactic-sugarish" way of doing the same thing
    //if (result) |val| {
    //    print("Non-null value: {any}", .{val});
    //} else {
    //    print("Null value", .{});
    //}

    // An even more "syntactic-sugarish" way of doing the same thing
    print("{any}\n", .{result orelse 0});

    // Prints from 7 all the way to 1
    while (nullEndingSequence()) |_| {
        print("{d}", .{num1});
    }
}
