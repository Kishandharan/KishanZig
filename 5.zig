const std = @import("std");

pub fn main() !void{
    var i:i32=0;
    while(i<10):(i+=1){
        if(i==2){
            continue;
        }
        std.debug.print("{d}\n", .{i+1});
    }
}
