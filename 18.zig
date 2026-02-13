const std = @import("std");

pub fn main() !void{
    var arena = std.heap.ArenaAllocator.init(std.heap.smp_allocator);
    defer arena.deinit();
    const allocator = arena.allocator();

    var numbers1 = try allocator.alloc(i32, 2);
    var numbers2 = try allocator.alloc(i32, 3);
    var numbers3 = try allocator.alloc(i32, 4);

    numbers1[0] = 1;
    numbers1[1] = 2;

    numbers2[0] = 1;
    numbers2[1] = 2;
    numbers2[2] = 3;

    numbers3[0] = 1;
    numbers3[1] = 2;
    numbers3[2] = 3;
    numbers3[3] = 4;

    std.debug.print("{any}\n", .{numbers1});
    std.debug.print("{any}\n", .{numbers2});
    std.debug.print("{any}\n", .{numbers3});
}
