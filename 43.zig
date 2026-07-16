const std = @import("std");
const import1 = @import("42.zig");

pub fn main() !void {
    switch (import1.os1) {
        .Windows => std.debug.print("He likes Windows.", .{}),
        .MacOS => std.debug.print("He likes MacOS.", .{}),
        .Linux => std.debug.print("He likes Linux.", .{}),
        .Other => std.debug.print("He likes a very mysterious OS.", .{}),
    }
}
