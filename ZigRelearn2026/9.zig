const std = @import("std");

//fn errorThrower()error{err, err2}!void{
//return error.err2;
//} 
//Can do this way OR

const CustomErrors = error{
	err,
	err2
};

fn errorThrower() CustomErrors!void{
	return CustomErrors.err2;
}

pub fn main()!void{
	// try errorThrower();
	// This crashes the program in runtime

	//errorThrower() catch std.debug.print("We have got an error to handle bro!", .{});
	// This prints that text on runtime

	//if(errorThrower()) |result|{
	//std.debug.print("No error! {any}", .{result});
	//}else |err|{
	//std.debug.print("Error!{any}", .{err});
	//}
	//This prints "Error!error.err"

	//errorThrower() catch |err| switch(err){
	//error.err => std.debug.print("Oops! We have got a reconized error!", .{}),
	//error.err2 => std.debug.print("Oops! We have got a reconized error2!", .{})
	//};
	//This runs the second prong

	errorThrower() catch |err|{
		std.debug.print("Error!!!!: {any}", .{err});
	};
}