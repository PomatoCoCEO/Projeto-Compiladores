@.str_int = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str_float = private unnamed_addr constant [7 x i8] c"%.08f\0A\00", align 1
@.str_string = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.false = private unnamed_addr constant [7 x i8] c"false\0A\00", align 1
@.true = private unnamed_addr constant [6 x i8] c"true\0A\00", align 1
@.new_line = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@program.args = global i8** null
declare i32 @atoi(i8*)
declare i32 @printf(i8*, ...)
@.arg = global i32 0
define i32 @func.factorial(i32 %ar.n) {
%arg.n = alloca i32
store i32 %ar.n, i32* %arg.n
%1 = load i32, i32* %arg.n
%2 = add i32 0, 0
%3 = icmp eq i32 %1, %2
br i1 %3, label %then_0, label %else_0
then_0:
%4 = add i32 1, 0
ret i32 %4
br label %end_if_0
else_0:
br label %end_if_0
end_if_0:
%6 = load i32, i32* %arg.n
%7 = load i32, i32* %arg.n
%8 = add i32 1, 0
%9 = sub i32 %7, %8
%10 = call i32 @func.factorial(i32 %9)
%11 = mul i32 %6, %10
ret i32 %11
ret i32 0
}
define i32 @func.factorial2(i32 %ar.n) {
%arg.n = alloca i32
store i32 %ar.n, i32* %arg.n
%i = alloca i32
%ans = alloca i32
%1 = add i32 1, 0
store i32 %1, i32* %i
%2 = add i32 1, 0
store i32 %2, i32* %ans
br label %cond_for_0
cond_for_0:
%3 = load i32, i32* %i
%4 = load i32, i32* %arg.n
%5 = icmp sle i32 %3, %4
br i1 %5, label %for_body_0, label %for_end_0
for_body_0:
%6 = load i32, i32* %ans
%7 = load i32, i32* %i
%8 = mul i32 %6, %7
store i32 %8, i32* %ans
%9 = load i32, i32* %i
%10 = add i32 1, 0
%11 = add i32 %9, %10
store i32 %11, i32* %i
br label %cond_for_0
for_end_0:
%12 = load i32, i32* %ans
ret i32 %12
ret i32 0
}
define void @main(i32 %local_nargs, i8** %local_args) {
store i8** %local_args, i8*** @program.args
%argument = alloca i32
%1 = load i32, i32* %argument
%2 = add i32 1, 0
%3 = load i8**, i8*** @program.args
%4 = getelementptr i8*, i8** %3, i32 1
%5 = load i8*, i8** %4
%6 = call i32 @atoi(i8* %5)
store i32 %6, i32* %argument
%7 = load i32, i32* %argument
%8 = call i32 @func.factorial(i32 %7)
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str_int, i64 0, i64 0), i32 %8)
%10 = load i32, i32* %argument
%11 = call i32 @func.factorial2(i32 %10)
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str_int, i64 0, i64 0), i32 %11)
ret void
}
