const std = @import("std");

pub fn main() !void {
    const stockPrices: [10]i32 = [10]i32{ 0, 2, 4, 5, 2, 10, 6, 1, 4, 5 };
    const stockPricesLen: usize = stockPrices.len;
    var buyDay: i32 = undefined;
    var sellDay: i32 = undefined;
    var min: i32 = 0;
    var max: i32 = 0;

    var stdout_buff: [1000]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buff);
    var stdout_interface = &stdout_writer.interface;

    // Find minimum value in stockPrices
    for (0..stockPricesLen) |i| {
        if (stockPrices[i] > min) {
            continue;
        }
        min = stockPrices[i];
        buyDay = @intCast(i + 1);
    }

    // Find maximum value in stockPrices
    for (0..stockPricesLen) |i| {
        if (stockPrices[i] < max) {
            continue;
        }
        max = stockPrices[i];
        sellDay = @intCast(i + 1);
    }

    try stdout_interface.print("Buy stock on {}\n", .{buyDay});
    try stdout_interface.print("Sell stock on {}\n", .{sellDay});
    try stdout_interface.flush();
}
