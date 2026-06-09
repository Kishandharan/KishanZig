const std = @import("std");
const print = std.debug.print;

fn faulty(val: i32) !void {
    if (val > 20) {
        return error.insaneHIGHVALUE;
    }

    if (val < 3) {
        return error.insaneLOWVALUE;
    }
}

pub fn main() !void {
    // This will make the code panic at runtime
    // try faulty(199);

    // This will print the message without any error details
    //faulty(199) catch {
    //    print("We've got an error in town!!!", .{});
    //};

    // This prints the message WITH the error name
    //faulty(199) catch |err| {
    //    print("We've got an error in town!!!\n", .{});
    //    print("{any}", .{err});
    //};

    faulty(2) catch |err| switch (err) {
        error.insaneHIGHVALUE => print("We have fed them a value too high!!", .{}),
        else => print("We have fed them a value too low!!", .{}),
    };
}
