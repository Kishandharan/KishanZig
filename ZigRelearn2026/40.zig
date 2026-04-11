// Custom implementation of a simple linked list

const std = @import("std");
const Node = struct { value: i32, next: ?*Node };

pub fn main() !void {
    var node1: Node = .{ .value = 10, .next = null };
    var node2: Node = .{ .value = 11, .next = null };

    node1.next = &node2;
    node2.next = null;

    std.debug.print("{any}\n", .{node1.value});
    std.debug.print("{any}\n", .{node1.next.?.value});
}
