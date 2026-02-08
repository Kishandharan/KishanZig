var std = @import("std");

pub fn main() !void{
    for(0..100) |i|{
        if(i%3 == true){
            std.debug.print("fizz", .{});
        }
        if((i%3 == true) and (i%5 == true){
            std.debug.print("fizzbuzz", .{});
        }
        if(i%5 == true){
            std.debug.print("buzz", .{});
        }
    }
}
