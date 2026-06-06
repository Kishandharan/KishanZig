const std = @import("std");

const Level = enum { Novice, Beginner, Intermediate, Advanced, Pro };

const Weight = enum { Lightweight, Middleweight, Heavyweight };

const Kickboxer = struct {
    level: Level,
    weight: Weight,
    age: u16,
    name: []const u8,

    fn printDetails(self: Kickboxer) void {
        std.debug.print("\n---Kickboxer Stats---\nName: {s}\nAge: {d}\nLevel: {any}\nWeight: {any}\n", .{ self.name, self.age, self.level, self.weight });
    }
};

pub fn main() !void {
    const kb1: Kickboxer = .{ .level = Level.Pro, .weight = Weight.Heavyweight, .age = 46, .name = "Edson Baroza" };

    kb1.printDetails();
}
