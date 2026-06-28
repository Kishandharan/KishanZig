const std = @import("std");
const pageAllocator = std.heap.page_allocator;
const print = std.debug.print;

const Gender = enum { Male, Female };

const Person = struct { name: []const u8, age: i32, gender: Gender };

pub fn main() !void {
    const heapPerson: *Person = try pageAllocator.create(Person);
    heapPerson.* = .{ .name = "Kishan", .age = 12, .gender = .Male };

    print("\n--- Person Details---\n", .{});
    print("Name: {s}\n", .{heapPerson.*.name});
    print("Age: {d}\n", .{heapPerson.*.age});
    print("Gender: {any}\n", .{heapPerson.*.gender});
}
