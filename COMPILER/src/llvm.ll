@_.str_int = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@_.str_float = private unnamed_addr constant [7 x i8] c"%.08f\0A\00", align 1
@_.str_string = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@_.false = private unnamed_addr constant [7 x i8] c"false\0A\00", align 1
@_.true = private unnamed_addr constant [6 x i8] c"true\0A\00", align 1
@_.new_line = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@program.args = global i8** null
declare i32 @atoi(i8*)
declare i32 @printf(i8*, ...)
define i32 @main(i32 %local_.nargs, i8** %local_.args) {
store i8** %local_.args, i8*** @program.args
%1 = fadd double 1.0e1, 0.0
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @_.str_float, i64 0, i64 0), double %1)
ret i32 0
}
