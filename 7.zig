const std = @import("std");

pub fn main() !void{
    // This won't work because unsigned vars cannot have negative numbers
    // const num1:i32 = -100;
    // const num2:u32 = num1;
    // std.debug.print(num2);

    // This will work
    // const num1:i32 = 100;
    // const num2:u32 = num1;

    // This will also work, usize=u32 on 32bit machines and u64 on 64 bit machines
    const num1:i32 = 100;
    const num2:usize = @intCast(num1);

    std.debug.print("Original Var and Type: {d} {any}\n", .{num1, @TypeOf(num1)});
    std.debug.print("Casted Var and Type: {d} {any}\n", .{num2, @TypeOf(num2)});

}
