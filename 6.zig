const std = @import("std");

pub fn main() !void{
    outer: for(0..4)|i|{
        for(0..3)|_|{
            if(i == 3){
                break :outer;
            }
            std.debug.print("{d}\n", .{i});
        }
        std.debug.print("\n", .{});
    }
}
