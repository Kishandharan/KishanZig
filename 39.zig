// Andhaman Prisoner Problem
const std = @import("std");
const PageAllocator = std.heap.page_allocator;
const CellState = enum { Open, Closed };

pub fn main() !void {
    const cells: []CellState = PageAllocator.alloc(CellState, 10) catch {
        unreachable;
    };

    for (0..cells.len) |i| {
        cells[i] = .Closed;
    }

    std.debug.print("{}", .{cells[0]});
}
