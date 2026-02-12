const std = @import("std");

const Bird = struct{
	color:[]const u8,
	maxAlt:i32,
	canFly:bool,
	flying:bool = false,

	pub fn togglefly(self: *Bird, alt:i32) error{unflyable, unreachableAlt}!void{
		if(self.*.canFly == true){
			if(self.*.maxAlt >= alt){
				if(self.*.flying == false){self.*.flying = true;}
				else{self.*.flying = false;}
			}else{
				return error.unreachableAlt;
			}
		}else{
			return error.unflyable;
		}
	}	
};

pub fn main() !void{
	var bird1:Bird = .{
		.color = "green",
		.maxAlt = 2000,
		.canFly = true
	};

	var bird2:Bird = .{
		.color = "black",
		.maxAlt = 200,
		.canFly = false		
	};

	_ = try bird1.togglefly(2000);
	std.debug.print("Bird1: {s} {d} {any} {any}\n\n", .{
		bird1.color, 
		bird1.maxAlt, 
		bird1.canFly,
		bird1.flying
	}); // This will say "Bird1: green 2000 true true"

	_ = try bird2.togglefly(200); // This will throw unflyable error at runtime and crashes
}