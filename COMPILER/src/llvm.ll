@_.str_int = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@_.str_float = private unnamed_addr constant [8 x i8] c"%.08lf\0A\00", align 1
@_.str_string = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@_.false = private unnamed_addr constant [7 x i8] c"false\0A\00", align 1
@_.true = private unnamed_addr constant [6 x i8] c"true\0A\00", align 1
@_.new_line = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@program.args = global i8** null
declare i32 @atoi(i8*)
declare i32 @printf(i8*, ...)
define i32 @main(i32 %local_.nargs, i8** %local_.args) {
store i8** %local_.args, i8*** @program.args
%local.a = alloca i1
store i1 0, i1* %local.a
%local.b = alloca i1
store i1 0, i1* %local.b
%local.c = alloca i1
store i1 0, i1* %local.c
%1 = add i32 1, 0
%2 = add i32 1, 0
%3 = icmp eq i32 %1, %2
store i1 %3, i1* %local.a
%4 = add i32 1, 0
%5 = add i32 1, 0
%6 = icmp eq i32 %4, %5
store i1 %6, i1* %local.b
%7 = add i32 1, 0
%8 = add i32 1, 0
%9 = icmp ne i32 %7, %8
store i1 %9, i1* %local.c
%10 = load i1, i1* %local.a
%11 = sub i1 1, %10
%12 = load i1, i1* %local.b
%13 = sub i1 1, %12
%14 = or i1 %11, %13
%15 = load i1, i1* %local.c
%16 = sub i1 1, %15
%17 = or i1 %14, %16
br i1 %17, label %then_0, label %else_0
then_0:
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @_.true, i64 0, i64 0))
br label %if_end_0
else_0:
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @_.false, i64 0, i64 0))
br label %if_end_0
if_end_0:
%20 = load i1, i1* %local.a
%21 = sub i1 1, %20
br i1 %21, label %then_1, label %else_1
then_1:
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @_.true, i64 0, i64 0))
br label %if_end_1
else_1:
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @_.false, i64 0, i64 0))
br label %if_end_1
if_end_1:
%24 = load i1, i1* %local.b
%25 = sub i1 1, %24
br i1 %25, label %then_2, label %else_2
then_2:
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @_.true, i64 0, i64 0))
br label %if_end_2
else_2:
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @_.false, i64 0, i64 0))
br label %if_end_2
if_end_2:
%28 = load i1, i1* %local.b
%29 = sub i1 1, %28
%30 = load i1, i1* %local.a
%31 = sub i1 1, %30
%32 = or i1 %29, %31
br i1 %32, label %then_3, label %else_3
then_3:
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @_.true, i64 0, i64 0))
br label %if_end_3
else_3:
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @_.false, i64 0, i64 0))
br label %if_end_3
if_end_3:
%35 = load i1, i1* %local.a
%36 = sub i1 1, %35
%37 = load i1, i1* %local.b
%38 = sub i1 1, %37
%39 = or i1 %36, %38
%40 = load i1, i1* %local.c
%41 = sub i1 1, %40
%42 = or i1 %39, %41
%43 = add i32 1, 0
%44 = add i32 1, 0
%45 = icmp eq i32 %43, %44
%46 = and i1 %42, %45
br i1 %46, label %then_4, label %else_4
then_4:
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @_.true, i64 0, i64 0))
br label %if_end_4
else_4:
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @_.false, i64 0, i64 0))
br label %if_end_4
if_end_4:
%49 = load i1, i1* %local.a
%50 = sub i1 1, %49
%51 = load i1, i1* %local.b
%52 = sub i1 1, %51
%53 = or i1 %50, %52
%54 = load i1, i1* %local.c
%55 = sub i1 1, %54
%56 = or i1 %53, %55
%57 = add i32 1, 0
%58 = add i32 1, 0
%59 = icmp eq i32 %57, %58
%60 = and i1 %56, %59
%61 = load i1, i1* %local.b
%62 = sub i1 1, %61
%63 = load i1, i1* %local.a
%64 = sub i1 1, %63
%65 = or i1 %62, %64
%66 = and i1 %60, %65
br i1 %66, label %then_5, label %else_5
then_5:
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @_.true, i64 0, i64 0))
br label %if_end_5
else_5:
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @_.false, i64 0, i64 0))
br label %if_end_5
if_end_5:
%69 = load i1, i1* %local.a
%70 = sub i1 1, %69
%71 = load i1, i1* %local.b
%72 = sub i1 1, %71
%73 = or i1 %70, %72
%74 = load i1, i1* %local.c
%75 = sub i1 1, %74
%76 = or i1 %73, %75
%77 = add i32 1, 0
%78 = add i32 1, 0
%79 = icmp eq i32 %77, %78
%80 = and i1 %76, %79
%81 = load i1, i1* %local.b
%82 = sub i1 1, %81
%83 = load i1, i1* %local.a
%84 = sub i1 1, %83
%85 = or i1 %82, %84
%86 = and i1 %80, %85
%87 = sub i1 1, %86
br i1 %87, label %then_6, label %else_6
then_6:
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @_.true, i64 0, i64 0))
br label %if_end_6
else_6:
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @_.false, i64 0, i64 0))
br label %if_end_6
if_end_6:
ret i32 0
}
