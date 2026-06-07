const std = @import("std");
const print = std.debug.print;

pub fn main() !void {
    const bool1: bool = true;
    const bool2: bool = false;

    if (bool1 and bool2) {
        print("They both are loyal to me!! I love them so much", .{});
        return;
    }

    print("Neither of them or loyal to me, OR only one of them are loyal...I am so sad", .{});
}
