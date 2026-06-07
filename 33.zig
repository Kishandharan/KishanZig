const std = @import("std");
const print = std.debug.print;

const NumberValues = enum { VeryBig, Big, Medium, Small, VerySmall };

const Number = union(NumberValues) { VeryBig: u100, Big: u70, Medium: u39, Small: u10, VerySmall: u2 };

pub fn main() !void {
    const union1: Number = .{ .VeryBig = 10 };
    switch (union1) {
        .VeryBig => |num| print("Very Big Value: {d}", .{num}),
        .Big => |num| print("Big Value: {d}", .{num}),
        .Medium => |num| print("Medium Value: {d}", .{num}),
        .Small => |num| print("Small Value: {d}", .{num}),
        .VerySmall => |num| print("Very Small Value: {d}", .{num}),
    }
}
