const std = @import("std");

pub fn main() !void{
    for(0..100)|i|{
        if(i%2==0){
            std.debug.print("Divisible by 2, {d}\n", .{i});
        }else{
            std.debug.print("{d}\n", .{i});
        }
    }
}
