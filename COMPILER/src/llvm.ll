@.str_int = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str_float = private unnamed_addr constant [8 x i8] c"%.08lf\0A\00", align 1
@.str_string = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@._false = private unnamed_addr constant [7 x i8] c"false\0A\00", align 1
@._true = private unnamed_addr constant [6 x i8] c"true\0A\00", align 1
@.new_line = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@program.args = global i8** null
declare i32 @atoi(i8*)
declare i32 @printf(i8*, ...)
@.a = global double 0.0
@.b = global double 0.0
@.c = global double 0.0
define i32 @main(i32 %local_nargs, i8** %local_args) {
store i8** %local_args, i8*** @program.args
%1 = fadd double 0.00000000, 0.0
%2 = fadd double 0.00000000, 0.0
%3 = fsub double %1, %2
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str_float, i64 0, i64 0), double %3)
ret i32 0
}
