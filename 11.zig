const std = @import("std");

const LimitError = error {
	OverLimitError,
	UnderLimitError	
};

fn rangeChecker(start1: i32, end1: i32, num1: i32, graceful:bool) LimitError!i32{
	if(num1 < start1){
		if(graceful){
			return start1;
		}else{
			return LimitError.UnderLimitError;
		}
	}else if(num1 > end1){
		if(graceful){
			return end1;
		}else{
			return LimitError.OverLimitError;
		}
	}else{
		return num1;
	}
}

pub fn main() !void{
	const result1:i32 = rangeChecker(10, 20, 30, true) catch 0; // 20
	const result2:i32 = rangeChecker(10, 20, 30, false) catch 0; // LimitError.OverLimitError

	std.debug.print("{d}\n", .{result1});
	std.debug.print("{d}\n", .{result2});
}