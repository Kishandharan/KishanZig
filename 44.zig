const std = @import("std");
const assert = std.testing.expect;
const import1 = @import("42.zig");

test "MoodAssertion" {
    try assert(import1.mood1 == .Happy);
}
