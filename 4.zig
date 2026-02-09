const std = @import("std");

pub fn main() !void{
    for(0..100) |i|{
        if(i%3 == 0){
            std.debug.print("fizz", .{});
        }
        if((i%3 == 0) and (i%5 == 0)){
            std.debug.print("fizzbuzz", .{});
        }
        if(i%5 == 0){
            std.debug.print("buzz", .{});
        }
    }
}
