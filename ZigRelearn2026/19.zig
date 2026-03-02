// Andaman Prisoner
const std = @import("std");

const DoorState = enum { Open, Closed };

pub fn main() !void {
    var prisons: [10]DoorState = undefined;
    var i: usize = undefined;

    // Initializing all doors
    i = 0;
    while (i < prisons.len) : (i += 1) {
        prisons[i] = .Closed;
    }
    std.debug.print("{any}\n", .{prisons});

    // Round 1: Opening all doors
    i = 0;
    while (i < prisons.len) : (i += 1) {
        prisons[i] = .Open;
    }
    std.debug.print("{any}\n", .{prisons});

    // Round 2: Closes every alternate door
    i = 1;
    while (i < prisons.len) : (i += 2) {
        prisons[i] = .Closed;
    }
    std.debug.print("{any}\n", .{prisons});

    // Round 3: If every third door, if open closes, if closed opens
    i = 2;
    while (i < prisons.len) : (i += 3) {
        if (prisons[i] == .Closed) {
            prisons[i] = .Open;
        } else {
            prisons[i] = .Closed;
        }
    }
    std.debug.print("{any}\n", .{prisons});

    // Round 4: Same logic as round 3, except for each 4rd door
    i = 3;
    while (i < prisons.len) : (i += 4) {
        if (prisons[i] == .Closed) {
            prisons[i] = .Open;
        } else {
            prisons[i] = .Closed;
        }
    }
    std.debug.print("{any}\n", .{prisons});

    // Round 5: Same logic as round 4, but except for each 5th door
    i = 4;
    while (i < prisons.len) : (i += 5) {
        if (prisons[i] == .Closed) {
            prisons[i] = .Open;
        } else {
            prisons[i] = .Closed;
        }
    }
    std.debug.print("{any}\n", .{prisons});

    // Round 6
    i = 5;
    while (i < prisons.len) : (i += 6) {
        if (prisons[i] == .Closed) {
            prisons[i] = .Open;
        } else {
            prisons[i] = .Closed;
        }
    }
    std.debug.print("{any}\n", .{prisons});
}
