@.str_int = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str_float = private unnamed_addr constant [7 x i8] c"%.08f\0A\00", align 1
@.str_string = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.false = private unnamed_addr constant [7 x i8] c"false\0A\00", align 1
@.true = private unnamed_addr constant [6 x i8] c"true\0A\00", align 1
@.new_line = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@program.args = global i8** null
declare i32 @atoi(i8*)
declare i32 @printf(i8*, ...)
define i32 @main(i32 %local_nargs, i8** %local_args) {
store i8** %local_args, i8*** @program.args
%1 = fadd double 41747955.98667000, 0.0000000001
%2 = fsub double 0.00000000001, %1
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2)
%4 = fadd double 1927724787.86179996, 0.0000000001
%5 = fsub double 0.00000000001, %4
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %5)
%7 = fadd double 908969831.38282001, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %7)
%9 = fadd double 301321269.23061001, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %9)
%11 = fadd double 433983859.32305002, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %11)
%13 = fadd double 283922626.62541002, 0.0000000001
%14 = fsub double 0.00000000001, %13
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %14)
%16 = fadd double 1979228066.76220012, 0.0000000001
%17 = fsub double 0.00000000001, %16
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %17)
%19 = fadd double 114115201.62791000, 0.0000000001
%20 = fsub double 0.00000000001, %19
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %20)
%22 = fadd double 1069505523.24049997, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %22)
%24 = fadd double 120736880.21070001, 0.0000000001
%25 = fsub double 0.00000000001, %24
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %25)
%27 = fadd double 1770270477.83369994, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %27)
%29 = fadd double 168586118.17544001, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %29)
%31 = fadd double 348211689.09922999, 0.0000000001
%32 = fsub double 0.00000000001, %31
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %32)
%34 = fadd double 8006040.49785640, 0.0000000001
%35 = fsub double 0.00000000001, %34
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %35)
%37 = fadd double 1188332157.60879993, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %37)
%39 = fadd double 364307539.88546002, 0.0000000001
%40 = fsub double 0.00000000001, %39
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %40)
%42 = fadd double 1219702512.25259995, 0.0000000001
%43 = fsub double 0.00000000001, %42
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %43)
%45 = fadd double 519725676.14032000, 0.0000000001
%46 = fsub double 0.00000000001, %45
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %46)
%48 = fadd double 185619214.38959000, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %48)
%50 = fadd double 20500638.51153200, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %50)
%52 = fadd double 59839923.25078000, 0.0000000001
%53 = fsub double 0.00000000001, %52
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %53)
%55 = fadd double 1749857590.30200005, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %55)
%57 = fadd double 1246537333.93580008, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %57)
%59 = fadd double 1682381156.98979998, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %59)
%61 = fadd double 2132422617.60240006, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %61)
%63 = fadd double 180504860.35393000, 0.0000000001
%64 = fsub double 0.00000000001, %63
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %64)
%66 = fadd double 1702448262.73550010, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %66)
%68 = fadd double 208129644.15505999, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %68)
%70 = fadd double 2026727113.78900003, 0.0000000001
%71 = fsub double 0.00000000001, %70
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %71)
%73 = fadd double 1651141937.57290006, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %73)
%75 = fadd double 302541188.86996001, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %75)
%77 = fadd double 1598352528.66450000, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %77)
%79 = fadd double 862774279.99690998, 0.0000000001
%80 = fsub double 0.00000000001, %79
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %80)
%82 = fadd double 1570263700.86400008, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %82)
%84 = fadd double 65381941.15953900, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %84)
%86 = fadd double 876400012.99747002, 0.0000000001
%87 = fsub double 0.00000000001, %86
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %87)
%89 = fadd double 2042485751.19790006, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %89)
%91 = fadd double 2016650645.07830000, 0.0000000001
%92 = fsub double 0.00000000001, %91
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %92)
%94 = fadd double 505950.11629915, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %94)
%96 = fadd double 96226160.00192900, 0.0000000001
%97 = fsub double 0.00000000001, %96
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %97)
%99 = fadd double 209819305.05410999, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %99)
%101 = fadd double 1705555704.86310005, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %101)
%103 = fadd double 660812731.71832001, 0.0000000001
%104 = fsub double 0.00000000001, %103
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %104)
%106 = fadd double 190298367.36344999, 0.0000000001
%107 = fsub double 0.00000000001, %106
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %107)
%109 = fadd double 86239855.38500600, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %109)
%111 = fadd double 821312348.07999003, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %111)
%113 = fadd double 891829595.15481997, 0.0000000001
%114 = fsub double 0.00000000001, %113
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %114)
%116 = fadd double 296760024.20060003, 0.0000000001
%117 = fsub double 0.00000000001, %116
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %117)
%119 = fadd double 721235264.39526999, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %119)
%121 = fadd double 1010504366.65649998, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %121)
%123 = fadd double 75295641.94073801, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %123)
%125 = fadd double 1617973318.59669995, 0.0000000001
%126 = fsub double 0.00000000001, %125
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %126)
%128 = fadd double 647566228.13547003, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %128)
%130 = fadd double 876774594.74799001, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %130)
%132 = fadd double 30456279.15591800, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %132)
%134 = fadd double 595418078.99326003, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %134)
%136 = fadd double 28960287.19176900, 0.0000000001
%137 = fsub double 0.00000000001, %136
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %137)
%139 = fadd double 1315942771.33640003, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %139)
%141 = fadd double 1049886207.95589995, 0.0000000001
%142 = fsub double 0.00000000001, %141
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %142)
%144 = fadd double 649865861.83971000, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %144)
%146 = fadd double 772431278.41433001, 0.0000000001
%147 = fsub double 0.00000000001, %146
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %147)
%149 = fadd double 1392204973.98729992, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %149)
%151 = fadd double 1746700030.79649997, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %151)
%153 = fadd double 8483285.55157330, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %153)
%155 = fadd double 1493355527.12840009, 0.0000000001
%156 = fsub double 0.00000000001, %155
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %156)
%158 = fadd double 296362879.37695003, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %158)
%160 = fadd double 81214294.24133800, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %160)
%162 = fadd double 268533542.47014999, 0.0000000001
%163 = fsub double 0.00000000001, %162
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %163)
%165 = fadd double 964923612.61047995, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %165)
%167 = fadd double 746555975.71483004, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %167)
%169 = fadd double 1632857709.26119995, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %169)
%171 = fadd double 1194553870.34500003, 0.0000000001
%172 = fsub double 0.00000000001, %171
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %172)
%174 = fadd double 1786522266.28290009, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %174)
%176 = fadd double 1284472741.01780009, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %176)
%178 = fadd double 326867463.00437999, 0.0000000001
%179 = fsub double 0.00000000001, %178
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %179)
%181 = fadd double 582424033.37489998, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %181)
%183 = fadd double 829886264.84771001, 0.0000000001
%184 = fsub double 0.00000000001, %183
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %184)
%186 = fadd double 562426859.01252997, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %186)
%188 = fadd double 1965772688.37750006, 0.0000000001
%189 = fsub double 0.00000000001, %188
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %189)
%191 = fadd double 555084968.41457999, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %191)
%193 = fadd double 104536445.23628999, 0.0000000001
%194 = fsub double 0.00000000001, %193
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %194)
%196 = fadd double 57931019.34733700, 0.0000000001
%197 = fsub double 0.00000000001, %196
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %197)
%199 = fadd double 252642359.38776001, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %199)
%201 = fadd double 264080709.58164999, 0.0000000001
%202 = fsub double 0.00000000001, %201
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %202)
%204 = fadd double 1220232817.84890008, 0.0000000001
%205 = fsub double 0.00000000001, %204
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %205)
%207 = fadd double 210529122.68013999, 0.0000000001
%208 = fsub double 0.00000000001, %207
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %208)
%210 = fadd double 1075410546.64089990, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %210)
%212 = fadd double 2102160953.55460000, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %212)
%214 = fadd double 1867869335.88940001, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %214)
%216 = fadd double 1633596862.61459994, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %216)
%218 = fadd double 104834626.89015999, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %218)
%220 = fadd double 974536143.22310996, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %220)
%222 = fadd double 1783625773.37669992, 0.0000000001
%223 = fsub double 0.00000000001, %222
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %223)
%225 = fadd double 1253584238.78719997, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %225)
%227 = fadd double 2146344920.52329993, 0.0000000001
%228 = fsub double 0.00000000001, %227
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %228)
%230 = fadd double 289530030.76747000, 0.0000000001
%231 = fsub double 0.00000000001, %230
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %231)
%233 = fadd double 667261962.81555998, 0.0000000001
%234 = fsub double 0.00000000001, %233
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %234)
%236 = fadd double 1793410740.67070007, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %236)
%238 = fadd double 288120783.22416002, 0.0000000001
%239 = fsub double 0.00000000001, %238
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %239)
%241 = fadd double 198806165.40079999, 0.0000000001
%242 = fsub double 0.00000000001, %241
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %242)
%244 = fadd double 211203666.83579999, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %244)
%246 = fadd double 1051355156.35829997, 0.0000000001
%247 = fsub double 0.00000000001, %246
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %247)
%249 = fadd double 985428951.27661002, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %249)
%251 = fadd double 1699884907.77699995, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %251)
%253 = fadd double 110190822.92974000, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %253)
%255 = fadd double 137482950.33102000, 0.0000000001
%256 = fsub double 0.00000000001, %255
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %256)
%258 = fadd double 938427933.18526006, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %258)
%260 = fadd double 686252249.92012000, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %260)
%262 = fadd double 65457738.04777000, 0.0000000001
%263 = fsub double 0.00000000001, %262
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %263)
%265 = fadd double 355246313.71701002, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %265)
%267 = fadd double 83520920.46894000, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %267)
%269 = fadd double 441039872.65631002, 0.0000000001
%270 = fsub double 0.00000000001, %269
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %270)
%272 = fadd double 737019618.12781000, 0.0000000001
%273 = fsub double 0.00000000001, %272
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %273)
%275 = fadd double 34004551.81959500, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %275)
%277 = fadd double 1005126624.27279997, 0.0000000001
%278 = fsub double 0.00000000001, %277
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %278)
%280 = fadd double 911318253.07881999, 0.0000000001
%281 = fsub double 0.00000000001, %280
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %281)
%283 = fadd double 517979547.54122001, 0.0000000001
%284 = fsub double 0.00000000001, %283
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %284)
%286 = fadd double 627185685.92133999, 0.0000000001
%287 = fsub double 0.00000000001, %286
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %287)
%289 = fadd double 325119771.27680999, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %289)
%291 = fadd double 1770251388.33270001, 0.0000000001
%292 = fsub double 0.00000000001, %291
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %292)
%294 = fadd double 771387149.67086995, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %294)
%296 = fadd double 1075415169.16720009, 0.0000000001
%297 = fsub double 0.00000000001, %296
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %297)
%299 = fadd double 33058705.46039500, 0.0000000001
%300 = fsub double 0.00000000001, %299
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %300)
%302 = fadd double 1102792642.51440001, 0.0000000001
%303 = fsub double 0.00000000001, %302
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %303)
%305 = fadd double 424267903.46096998, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %305)
%307 = fadd double 360822459.65332001, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %307)
%309 = fadd double 92704192.02688000, 0.0000000001
%310 = fsub double 0.00000000001, %309
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %310)
%312 = fadd double 1894276532.83150005, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %312)
%314 = fadd double 18608497.78469500, 0.0000000001
%315 = fsub double 0.00000000001, %314
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %315)
%317 = fadd double 763762433.92402005, 0.0000000001
%318 = fsub double 0.00000000001, %317
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %318)
%320 = fadd double 376256230.11092001, 0.0000000001
%321 = fsub double 0.00000000001, %320
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %321)
%323 = fadd double 212373582.66993001, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %323)
%325 = fadd double 1370943442.92619991, 0.0000000001
%326 = fsub double 0.00000000001, %325
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %326)
%328 = fadd double 240617504.93638000, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %328)
%330 = fadd double 438401309.10608000, 0.0000000001
%331 = fsub double 0.00000000001, %330
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %331)
%333 = fadd double 854183491.10145998, 0.0000000001
%334 = fsub double 0.00000000001, %333
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %334)
%336 = fadd double 540449765.47952998, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %336)
%338 = fadd double 1605987383.82550001, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %338)
%340 = fadd double 1533230254.43230009, 0.0000000001
%341 = fsub double 0.00000000001, %340
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %341)
%343 = fadd double 1638774664.18449998, 0.0000000001
%344 = fsub double 0.00000000001, %343
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %344)
%346 = fadd double 1599602615.24720001, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %346)
%348 = fadd double 1522859734.86249995, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %348)
%350 = fadd double 1906246989.10310006, 0.0000000001
%351 = fsub double 0.00000000001, %350
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %351)
%353 = fadd double 81440469.87959200, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %353)
%355 = fadd double 316263380.21274000, 0.0000000001
%356 = fsub double 0.00000000001, %355
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %356)
%358 = fadd double 1537964311.47099996, 0.0000000001
%359 = fsub double 0.00000000001, %358
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %359)
%361 = fadd double 1466406128.99900007, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %361)
%363 = fadd double 1046561273.60899997, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %363)
%365 = fadd double 1360553119.66170001, 0.0000000001
%366 = fsub double 0.00000000001, %365
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %366)
%368 = fadd double 1458109599.17319989, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %368)
%370 = fadd double 84266094.10274500, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %370)
%372 = fadd double 2108117271.79310012, 0.0000000001
%373 = fsub double 0.00000000001, %372
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %373)
%375 = fadd double 8724022.79245570, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %375)
%377 = fadd double 470377055.12042999, 0.0000000001
%378 = fsub double 0.00000000001, %377
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %378)
%380 = fadd double 736280774.67837000, 0.0000000001
%381 = fsub double 0.00000000001, %380
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %381)
%383 = fadd double 75485513.58828300, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %383)
%385 = fadd double 116274454.59963000, 0.0000000001
%386 = fsub double 0.00000000001, %385
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %386)
%388 = fadd double 232578225.99588001, 0.0000000001
%389 = fsub double 0.00000000001, %388
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %389)
%391 = fadd double 1595854426.95539999, 0.0000000001
%392 = fsub double 0.00000000001, %391
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %392)
%394 = fadd double 1244820727.27379990, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %394)
%396 = fadd double 347440541.10461998, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %396)
%398 = fadd double 218062163.65110001, 0.0000000001
%399 = fsub double 0.00000000001, %398
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %399)
%401 = fadd double 147759075.49335000, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %401)
%403 = fadd double 933731323.13262999, 0.0000000001
%404 = fsub double 0.00000000001, %403
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %404)
%406 = fadd double 160660156.32576001, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %406)
%408 = fadd double 64018279.32525800, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %408)
%410 = fadd double 1033205064.78240001, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %410)
%412 = fadd double 1297246193.04889989, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %412)
%414 = fadd double 906669062.01126003, 0.0000000001
%415 = fsub double 0.00000000001, %414
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %415)
%417 = fadd double 473822753.78410000, 0.0000000001
%418 = fsub double 0.00000000001, %417
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %418)
%420 = fadd double 1001062208.24960005, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %420)
%422 = fadd double 282903437.78460002, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %422)
%424 = fadd double 100939387.45507000, 0.0000000001
%425 = fsub double 0.00000000001, %424
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %425)
%427 = fadd double 147615228.19687000, 0.0000000001
%428 = fsub double 0.00000000001, %427
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %428)
%430 = fadd double 343992954.02287000, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %430)
%432 = fadd double 1127375594.02559996, 0.0000000001
%433 = fsub double 0.00000000001, %432
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %433)
%435 = fadd double 504370973.08696997, 0.0000000001
%436 = fsub double 0.00000000001, %435
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %436)
%438 = fadd double 796011273.01782000, 0.0000000001
%439 = fsub double 0.00000000001, %438
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %439)
%441 = fadd double 569361170.86899996, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %441)
%443 = fadd double 159220406.87297001, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %443)
%445 = fadd double 306020221.96477997, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %445)
%447 = fadd double 593765015.83922005, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %447)
%449 = fadd double 1897545324.04259992, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %449)
%451 = fadd double 1269384036.13039994, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %451)
%453 = fadd double 281236537.98369002, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %453)
%455 = fadd double 644540888.71675003, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %455)
%457 = fadd double 862362752.07514000, 0.0000000001
%458 = fsub double 0.00000000001, %457
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %458)
%460 = fadd double 415135685.18304998, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %460)
%462 = fadd double 380575482.21977001, 0.0000000001
%463 = fsub double 0.00000000001, %462
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %463)
%465 = fadd double 305101117.33609003, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %465)
%467 = fadd double 261061333.39561999, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %467)
%469 = fadd double 539315075.69110000, 0.0000000001
%470 = fsub double 0.00000000001, %469
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %470)
%472 = fadd double 623182251.01708996, 0.0000000001
%473 = fsub double 0.00000000001, %472
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %473)
%475 = fadd double 800128074.46116996, 0.0000000001
%476 = fsub double 0.00000000001, %475
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %476)
%478 = fadd double 1767551184.92919993, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %478)
%480 = fadd double 704329138.85344994, 0.0000000001
%481 = fsub double 0.00000000001, %480
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %481)
%483 = fadd double 204742095.40064999, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %483)
%485 = fadd double 1984360162.54220009, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %485)
%487 = fadd double 930842054.63429999, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %487)
%489 = fadd double 1606065190.68580008, 0.0000000001
%490 = fsub double 0.00000000001, %489
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %490)
%492 = fadd double 1129435004.76130009, 0.0000000001
%493 = fsub double 0.00000000001, %492
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %493)
%495 = fadd double 1918645589.55390000, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %495)
%497 = fadd double 1078616071.93409991, 0.0000000001
%498 = fsub double 0.00000000001, %497
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %498)
%500 = fadd double 826582196.72565997, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %500)
%502 = fadd double 2066130953.93479991, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %502)
%504 = fadd double 1252251682.90930009, 0.0000000001
%505 = fsub double 0.00000000001, %504
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %505)
%507 = fadd double 1562238818.68440008, 0.0000000001
%508 = fsub double 0.00000000001, %507
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %508)
%510 = fadd double 1345177095.31270003, 0.0000000001
%511 = fsub double 0.00000000001, %510
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %511)
%513 = fadd double 488228370.91654003, 0.0000000001
%514 = fsub double 0.00000000001, %513
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %514)
%516 = fadd double 1819561753.30259991, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %516)
%518 = fadd double 287808210.66204000, 0.0000000001
%519 = fsub double 0.00000000001, %518
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %519)
%521 = fadd double 1343477285.16989994, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %521)
%523 = fadd double 1071108383.00500000, 0.0000000001
%524 = fsub double 0.00000000001, %523
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %524)
%526 = fadd double 467281410.64425999, 0.0000000001
%527 = fsub double 0.00000000001, %526
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %527)
%529 = fadd double 2139960310.69009995, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %529)
%531 = fadd double 796637539.44778001, 0.0000000001
%532 = fsub double 0.00000000001, %531
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %532)
%534 = fadd double 371390456.51954001, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %534)
%536 = fadd double 1903340235.44109988, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %536)
%538 = fadd double 679740644.47424996, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %538)
%540 = fadd double 354720814.35031998, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %540)
%542 = fadd double 388064378.74346000, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %542)
%544 = fadd double 861798163.46021998, 0.0000000001
%545 = fsub double 0.00000000001, %544
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %545)
%547 = fadd double 1832114967.14720011, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %547)
%549 = fadd double 1136578771.06469989, 0.0000000001
%550 = fsub double 0.00000000001, %549
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %550)
%552 = fadd double 572054659.69244003, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %552)
%554 = fadd double 1032882505.64619994, 0.0000000001
%555 = fsub double 0.00000000001, %554
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %555)
%557 = fadd double 2098557979.20140004, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %557)
%559 = fadd double 1199865841.29830003, 0.0000000001
%560 = fsub double 0.00000000001, %559
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %560)
%562 = fadd double 285934965.78815001, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %562)
%564 = fadd double 924364745.19597006, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %564)
%566 = fadd double 781141544.78936005, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %566)
%568 = fadd double 701505934.25139999, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %568)
%570 = fadd double 827119121.35830998, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %570)
%572 = fadd double 1960055531.91860008, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %572)
%574 = fadd double 1423146985.14000010, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %574)
%576 = fadd double 1266090864.96580005, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %576)
%578 = fadd double 1107339354.89590001, 0.0000000001
%579 = fsub double 0.00000000001, %578
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %579)
%581 = fadd double 845304905.19986999, 0.0000000001
%582 = fsub double 0.00000000001, %581
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %582)
%584 = fadd double 1934651790.19639993, 0.0000000001
%585 = fsub double 0.00000000001, %584
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %585)
%587 = fadd double 279764402.83007002, 0.0000000001
%588 = fsub double 0.00000000001, %587
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %588)
%590 = fadd double 1170060889.41160011, 0.0000000001
%591 = fsub double 0.00000000001, %590
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %591)
%593 = fadd double 1648954877.17039990, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %593)
%595 = fadd double 699595097.42440999, 0.0000000001
%596 = fsub double 0.00000000001, %595
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %596)
%598 = fadd double 1720420238.52349997, 0.0000000001
%599 = fsub double 0.00000000001, %598
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %599)
%601 = fadd double 560281443.73988998, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %601)
%603 = fadd double 1774688972.33920002, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %603)
%605 = fadd double 1497763394.91300011, 0.0000000001
%606 = fsub double 0.00000000001, %605
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %606)
%608 = fadd double 394337676.32107002, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %608)
%610 = fadd double 350669257.03196001, 0.0000000001
%611 = fsub double 0.00000000001, %610
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %611)
%613 = fadd double 34654295.77865400, 0.0000000001
%614 = fsub double 0.00000000001, %613
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %614)
%616 = fadd double 2052434398.97569990, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %616)
%618 = fadd double 2030906693.61299992, 0.0000000001
%619 = fsub double 0.00000000001, %618
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %619)
%621 = fadd double 37586098.18472800, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %621)
%623 = fadd double 307922892.43462998, 0.0000000001
%624 = fsub double 0.00000000001, %623
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %624)
%626 = fadd double 1018781563.51909995, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %626)
%628 = fadd double 1818377484.55080009, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %628)
%630 = fadd double 919576170.54834998, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %630)
%632 = fadd double 1589763840.28660011, 0.0000000001
%633 = fsub double 0.00000000001, %632
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %633)
%635 = fadd double 661335200.71571004, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %635)
%637 = fadd double 61904708.55754400, 0.0000000001
%638 = fsub double 0.00000000001, %637
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %638)
%640 = fadd double 1095864161.98880005, 0.0000000001
%641 = fsub double 0.00000000001, %640
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %641)
%643 = fadd double 1531465815.66490006, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %643)
%645 = fadd double 239151591.84755999, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %645)
%647 = fadd double 4303847.64542100, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %647)
%649 = fadd double 20407376.77814200, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %649)
%651 = fadd double 122690853.42953999, 0.0000000001
%652 = fsub double 0.00000000001, %651
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %652)
%654 = fadd double 1313704187.68140006, 0.0000000001
%655 = fsub double 0.00000000001, %654
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %655)
%657 = fadd double 507892233.76558000, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %657)
%659 = fadd double 294591440.58569998, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %659)
%661 = fadd double 478240278.02280998, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %661)
%663 = fadd double 80806481.80340700, 0.0000000001
%664 = fsub double 0.00000000001, %663
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %664)
%666 = fadd double 351673816.57187003, 0.0000000001
%667 = fsub double 0.00000000001, %666
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %667)
%669 = fadd double 57447736.38489900, 0.0000000001
%670 = fsub double 0.00000000001, %669
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %670)
%672 = fadd double 518974404.35179001, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %672)
%674 = fadd double 180633062.72894999, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %674)
%676 = fadd double 1059866035.81459999, 0.0000000001
%677 = fsub double 0.00000000001, %676
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %677)
%679 = fadd double 1401567940.10130000, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %679)
%681 = fadd double 1231510015.61540008, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %681)
%683 = fadd double 36416439.03162400, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %683)
%685 = fadd double 1310189909.50230002, 0.0000000001
%686 = fsub double 0.00000000001, %685
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %686)
%688 = fadd double 293950252.13534999, 0.0000000001
%689 = fsub double 0.00000000001, %688
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %689)
%691 = fadd double 813519173.21816003, 0.0000000001
%692 = fsub double 0.00000000001, %691
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %692)
%694 = fadd double 286779253.64130002, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %694)
%696 = fadd double 1022748552.79729998, 0.0000000001
%697 = fsub double 0.00000000001, %696
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %697)
%699 = fadd double 878480918.09203994, 0.0000000001
%700 = fsub double 0.00000000001, %699
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %700)
%702 = fadd double 32364375.09281400, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %702)
%704 = fadd double 463918332.14441001, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %704)
%706 = fadd double 374946099.95902002, 0.0000000001
%707 = fsub double 0.00000000001, %706
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %707)
%709 = fadd double 1212003671.37879992, 0.0000000001
%710 = fsub double 0.00000000001, %709
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %710)
%712 = fadd double 1245027178.34050012, 0.0000000001
%713 = fsub double 0.00000000001, %712
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %713)
%715 = fadd double 119226288.68524000, 0.0000000001
%716 = fsub double 0.00000000001, %715
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %716)
%718 = fadd double 919666548.05274999, 0.0000000001
%719 = fsub double 0.00000000001, %718
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %719)
%721 = fadd double 886436696.79724002, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %721)
%723 = fadd double 335313358.51370001, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %723)
%725 = fadd double 1153417711.35299993, 0.0000000001
%726 = fsub double 0.00000000001, %725
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %726)
%728 = fadd double 2108065640.51690006, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %728)
%730 = fadd double 1163510928.61109996, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %730)
%732 = fadd double 1224722289.05679989, 0.0000000001
%733 = fsub double 0.00000000001, %732
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %733)
%735 = fadd double 231235914.56036001, 0.0000000001
%736 = fsub double 0.00000000001, %735
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %736)
%738 = fadd double 743917940.72755003, 0.0000000001
%739 = fsub double 0.00000000001, %738
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %739)
%741 = fadd double 647300012.82655001, 0.0000000001
%742 = fsub double 0.00000000001, %741
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %742)
%744 = fadd double 635202896.35378003, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %744)
%746 = fadd double 1136949563.65669990, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %746)
%748 = fadd double 1234375329.32730007, 0.0000000001
%749 = fsub double 0.00000000001, %748
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %749)
%751 = fadd double 596292685.56774998, 0.0000000001
%752 = fsub double 0.00000000001, %751
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %752)
%754 = fadd double 1748152004.04410005, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %754)
%756 = fadd double 47792970.88219600, 0.0000000001
%757 = fsub double 0.00000000001, %756
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %757)
%759 = fadd double 427561730.79429001, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %759)
%761 = fadd double 2079755079.64339995, 0.0000000001
%762 = fsub double 0.00000000001, %761
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %762)
%764 = fadd double 1118959922.77570009, 0.0000000001
%765 = fsub double 0.00000000001, %764
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %765)
%767 = fadd double 52948171.60382100, 0.0000000001
%768 = fsub double 0.00000000001, %767
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %768)
%770 = fadd double 1011482431.26549995, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %770)
%772 = fadd double 171710749.53026000, 0.0000000001
%773 = fsub double 0.00000000001, %772
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %773)
%775 = fadd double 1093782448.89429998, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %775)
%777 = fadd double 225225821.35210001, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %777)
%779 = fadd double 500474030.40342999, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %779)
%781 = fadd double 556129856.11527002, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %781)
%783 = fadd double 193707920.12917000, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %783)
%785 = fadd double 1457501762.17700005, 0.0000000001
%786 = fsub double 0.00000000001, %785
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %786)
%788 = fadd double 751858335.56487000, 0.0000000001
%789 = fsub double 0.00000000001, %788
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %789)
%791 = fadd double 75747410.17031600, 0.0000000001
%792 = fsub double 0.00000000001, %791
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %792)
%794 = fadd double 859305991.80543005, 0.0000000001
%795 = fsub double 0.00000000001, %794
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %795)
%797 = fadd double 1987879799.68140006, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %797)
%799 = fadd double 805264499.15829003, 0.0000000001
%800 = fsub double 0.00000000001, %799
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %800)
%802 = fadd double 232749581.11769000, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %802)
%804 = fadd double 2062212330.60069990, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %804)
%806 = fadd double 231606576.38286000, 0.0000000001
%807 = fsub double 0.00000000001, %806
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %807)
%809 = fadd double 68869604.78337200, 0.0000000001
%810 = fsub double 0.00000000001, %809
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %810)
%812 = fadd double 1613548793.97309995, 0.0000000001
%813 = fsub double 0.00000000001, %812
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %813)
%815 = fadd double 716462071.13037002, 0.0000000001
%816 = fsub double 0.00000000001, %815
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %816)
%818 = fadd double 1502384935.28609991, 0.0000000001
%819 = fsub double 0.00000000001, %818
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %819)
%821 = fadd double 156410441.94525000, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %821)
%823 = fadd double 679964485.43980002, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %823)
%825 = fadd double 867727487.43519998, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %825)
%827 = fadd double 161106356.55412000, 0.0000000001
%828 = fsub double 0.00000000001, %827
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %828)
%830 = fadd double 167687491.10571000, 0.0000000001
%831 = fsub double 0.00000000001, %830
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %831)
%833 = fadd double 1773885902.19269991, 0.0000000001
%834 = fsub double 0.00000000001, %833
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %834)
%836 = fadd double 1810466462.61680007, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %836)
%838 = fadd double 138180378.41235000, 0.0000000001
%839 = fsub double 0.00000000001, %838
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %839)
%841 = fadd double 1549414788.70989990, 0.0000000001
%842 = fsub double 0.00000000001, %841
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %842)
%844 = fadd double 1869756292.49909997, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %844)
%846 = fadd double 1878420594.35770011, 0.0000000001
%847 = fsub double 0.00000000001, %846
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %847)
%849 = fadd double 382059681.41929001, 0.0000000001
%850 = fsub double 0.00000000001, %849
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %850)
%852 = fadd double 477316944.38344002, 0.0000000001
%853 = fsub double 0.00000000001, %852
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %853)
%855 = fadd double 257997252.86717999, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %855)
%857 = fadd double 531449811.93199998, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %857)
%859 = fadd double 1469801618.17840004, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %859)
%861 = fadd double 896178561.18220997, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %861)
%863 = fadd double 1037524269.93330002, 0.0000000001
%864 = fsub double 0.00000000001, %863
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %864)
%866 = fadd double 420143221.38216001, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %866)
%868 = fadd double 1347525541.20950007, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %868)
%870 = fadd double 785409600.61398995, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %870)
%872 = fadd double 39304262.28086300, 0.0000000001
%873 = fsub double 0.00000000001, %872
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %873)
%875 = fadd double 1271005838.84489989, 0.0000000001
%876 = fsub double 0.00000000001, %875
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %876)
%878 = fadd double 1729471831.76329994, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %878)
%880 = fadd double 1835758310.24679995, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %880)
%882 = fadd double 1452396640.75430012, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %882)
%884 = fadd double 2048357080.13350010, 0.0000000001
%885 = fsub double 0.00000000001, %884
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %885)
%887 = fadd double 101305886.36149000, 0.0000000001
%888 = fsub double 0.00000000001, %887
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %888)
%890 = fadd double 239008525.57499999, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %890)
%892 = fadd double 694829365.61085999, 0.0000000001
%893 = fsub double 0.00000000001, %892
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %893)
%895 = fadd double 1790349020.42770004, 0.0000000001
%896 = fsub double 0.00000000001, %895
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %896)
%898 = fadd double 531172491.74606001, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %898)
%900 = fadd double 38344548.86489400, 0.0000000001
%901 = fsub double 0.00000000001, %900
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %901)
%903 = fadd double 305449183.30601001, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %903)
%905 = fadd double 873720446.42428005, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %905)
%907 = fadd double 1093969841.06909990, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %907)
%909 = fadd double 448072195.34579998, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %909)
%911 = fadd double 190753671.53999001, 0.0000000001
%912 = fsub double 0.00000000001, %911
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %912)
%914 = fadd double 859988364.64315999, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %914)
%916 = fadd double 670215226.07270002, 0.0000000001
%917 = fsub double 0.00000000001, %916
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %917)
%919 = fadd double 2137707181.00200009, 0.0000000001
%920 = fsub double 0.00000000001, %919
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %920)
%922 = fadd double 472650263.81110001, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %922)
%924 = fadd double 26651719.50788000, 0.0000000001
%925 = fsub double 0.00000000001, %924
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %925)
%927 = fadd double 1571678133.03859997, 0.0000000001
%928 = fsub double 0.00000000001, %927
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %928)
%930 = fadd double 1771900426.02959991, 0.0000000001
%931 = fsub double 0.00000000001, %930
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %931)
%933 = fadd double 638468235.32471001, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %933)
%935 = fadd double 1488456991.97659993, 0.0000000001
%936 = fsub double 0.00000000001, %935
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %936)
%938 = fadd double 59168356.74591600, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %938)
%940 = fadd double 394415728.70191997, 0.0000000001
%941 = fsub double 0.00000000001, %940
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %941)
%943 = fadd double 1329937209.21429992, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %943)
%945 = fadd double 146839010.75909001, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %945)
%947 = fadd double 892751594.81207001, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %947)
%949 = fadd double 855794285.73653996, 0.0000000001
%950 = fsub double 0.00000000001, %949
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %950)
%952 = fadd double 1372204369.95330000, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %952)
%954 = fadd double 613166016.96476996, 0.0000000001
%955 = fsub double 0.00000000001, %954
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %955)
%957 = fadd double 216952979.14656001, 0.0000000001
%958 = fsub double 0.00000000001, %957
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %958)
%960 = fadd double 649187763.55499995, 0.0000000001
%961 = fsub double 0.00000000001, %960
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %961)
%963 = fadd double 1128674885.10179996, 0.0000000001
%964 = fsub double 0.00000000001, %963
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %964)
%966 = fadd double 542887918.80042005, 0.0000000001
%967 = fsub double 0.00000000001, %966
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %967)
%969 = fadd double 1962628703.89319992, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %969)
%971 = fadd double 2057065509.91790009, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %971)
%973 = fadd double 34059267.66725100, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %973)
%975 = fadd double 1130090093.91709995, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %975)
%977 = fadd double 510944351.53271002, 0.0000000001
%978 = fsub double 0.00000000001, %977
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %978)
%980 = fadd double 499026863.54455000, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %980)
%982 = fadd double 590191792.10828996, 0.0000000001
%983 = fsub double 0.00000000001, %982
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %983)
%985 = fadd double 107123480.08177000, 0.0000000001
%986 = fsub double 0.00000000001, %985
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %986)
%988 = fadd double 214947408.77415001, 0.0000000001
%989 = fsub double 0.00000000001, %988
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %989)
%991 = fadd double 717292957.47561002, 0.0000000001
%992 = fsub double 0.00000000001, %991
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %992)
%994 = fadd double 1764187580.65409994, 0.0000000001
%995 = fsub double 0.00000000001, %994
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %995)
%997 = fadd double 320042318.62453997, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %997)
%999 = fadd double 1478720210.43709993, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %999)
%1001 = fadd double 437391905.21079999, 0.0000000001
%1002 = fsub double 0.00000000001, %1001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1002)
%1004 = fadd double 1296603064.60240006, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1004)
%1006 = fadd double 1090307931.71050000, 0.0000000001
%1007 = fsub double 0.00000000001, %1006
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1007)
%1009 = fadd double 316231245.79891002, 0.0000000001
%1010 = fsub double 0.00000000001, %1009
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1010)
%1012 = fadd double 2023461330.81270003, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1012)
%1014 = fadd double 349247042.88156998, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1014)
%1016 = fadd double 418535408.42404997, 0.0000000001
%1017 = fsub double 0.00000000001, %1016
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1017)
%1019 = fadd double 734261688.00993001, 0.0000000001
%1020 = fsub double 0.00000000001, %1019
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1020)
%1022 = fadd double 908730583.81409001, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1022)
%1024 = fadd double 1915146334.82500005, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1024)
%1026 = fadd double 1213081868.69549990, 0.0000000001
%1027 = fsub double 0.00000000001, %1026
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1027)
%1029 = fadd double 1317719138.11949992, 0.0000000001
%1030 = fsub double 0.00000000001, %1029
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1030)
%1032 = fadd double 1342747165.88790011, 0.0000000001
%1033 = fsub double 0.00000000001, %1032
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1033)
%1035 = fadd double 311043675.73395002, 0.0000000001
%1036 = fsub double 0.00000000001, %1035
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1036)
%1038 = fadd double 1830124488.96939993, 0.0000000001
%1039 = fsub double 0.00000000001, %1038
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1039)
%1041 = fadd double 791966971.97478998, 0.0000000001
%1042 = fsub double 0.00000000001, %1041
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1042)
%1044 = fadd double 2018935857.54089999, 0.0000000001
%1045 = fsub double 0.00000000001, %1044
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1045)
%1047 = fadd double 834832942.39929998, 0.0000000001
%1048 = fsub double 0.00000000001, %1047
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1048)
%1050 = fadd double 43019716.84508200, 0.0000000001
%1051 = fsub double 0.00000000001, %1050
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1051)
%1053 = fadd double 1250418834.85759997, 0.0000000001
%1054 = fsub double 0.00000000001, %1053
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1054)
%1056 = fadd double 631822330.76513004, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1056)
%1058 = fadd double 162309176.86875001, 0.0000000001
%1059 = fsub double 0.00000000001, %1058
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1059)
%1061 = fadd double 250912990.03955001, 0.0000000001
%1062 = fsub double 0.00000000001, %1061
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1062)
%1064 = fadd double 354373431.58936000, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1064)
%1066 = fadd double 664993562.45568001, 0.0000000001
%1067 = fsub double 0.00000000001, %1066
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1067)
%1069 = fadd double 652618933.51558995, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1069)
%1071 = fadd double 1755371482.08940005, 0.0000000001
%1072 = fsub double 0.00000000001, %1071
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1072)
%1074 = fadd double 191563276.97018999, 0.0000000001
%1075 = fsub double 0.00000000001, %1074
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1075)
%1077 = fadd double 682000124.27968001, 0.0000000001
%1078 = fsub double 0.00000000001, %1077
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1078)
%1080 = fadd double 1906873572.60419989, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1080)
%1082 = fadd double 607744829.44350004, 0.0000000001
%1083 = fsub double 0.00000000001, %1082
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1083)
%1085 = fadd double 1854201165.65580010, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1085)
%1087 = fadd double 1966858262.08550000, 0.0000000001
%1088 = fsub double 0.00000000001, %1087
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1088)
%1090 = fadd double 515087948.07846999, 0.0000000001
%1091 = fsub double 0.00000000001, %1090
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1091)
%1093 = fadd double 267112518.15783000, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1093)
%1095 = fadd double 123675069.35402000, 0.0000000001
%1096 = fsub double 0.00000000001, %1095
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1096)
%1098 = fadd double 57428884.35313600, 0.0000000001
%1099 = fsub double 0.00000000001, %1098
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1099)
%1101 = fadd double 682677470.16630006, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1101)
%1103 = fadd double 734340360.97203004, 0.0000000001
%1104 = fsub double 0.00000000001, %1103
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1104)
%1106 = fadd double 1396736106.61450005, 0.0000000001
%1107 = fsub double 0.00000000001, %1106
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1107)
%1109 = fadd double 1022587024.67799997, 0.0000000001
%1110 = fsub double 0.00000000001, %1109
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1110)
%1112 = fadd double 78372508.07133301, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1112)
%1114 = fadd double 357070422.04070002, 0.0000000001
%1115 = fsub double 0.00000000001, %1114
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1115)
%1117 = fadd double 1174440176.94779992, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1117)
%1119 = fadd double 1963638146.14739990, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1119)
%1121 = fadd double 189707360.11241001, 0.0000000001
%1122 = fsub double 0.00000000001, %1121
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1122)
%1124 = fadd double 2109120931.07920003, 0.0000000001
%1125 = fsub double 0.00000000001, %1124
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1125)
%1127 = fadd double 1048640921.38409996, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1127)
%1129 = fadd double 1189353839.17950010, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1129)
%1131 = fadd double 1550386524.61829996, 0.0000000001
%1132 = fsub double 0.00000000001, %1131
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1132)
%1134 = fadd double 1071334345.51520002, 0.0000000001
%1135 = fsub double 0.00000000001, %1134
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1135)
%1137 = fadd double 2049278550.40159988, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1137)
%1139 = fadd double 2119209583.53690004, 0.0000000001
%1140 = fsub double 0.00000000001, %1139
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1140)
%1142 = fadd double 1888271912.06380010, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1142)
%1144 = fadd double 1056059366.90429997, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1144)
%1146 = fadd double 428664282.24159998, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1146)
%1148 = fadd double 1901743332.89170003, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1148)
%1150 = fadd double 2130862846.33669996, 0.0000000001
%1151 = fsub double 0.00000000001, %1150
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1151)
%1153 = fadd double 387515999.82835001, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1153)
%1155 = fadd double 1161583457.33349991, 0.0000000001
%1156 = fsub double 0.00000000001, %1155
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1156)
%1158 = fadd double 291059625.26109999, 0.0000000001
%1159 = fsub double 0.00000000001, %1158
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1159)
%1161 = fadd double 1648370547.67799997, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1161)
%1163 = fadd double 310305472.91092002, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1163)
%1165 = fadd double 845853479.05692005, 0.0000000001
%1166 = fsub double 0.00000000001, %1165
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1166)
%1168 = fadd double 730911935.52956998, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1168)
%1170 = fadd double 328093049.54481000, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1170)
%1172 = fadd double 865024205.81159997, 0.0000000001
%1173 = fsub double 0.00000000001, %1172
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1173)
%1175 = fadd double 467578575.32107002, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1175)
%1177 = fadd double 325831951.81507999, 0.0000000001
%1178 = fsub double 0.00000000001, %1177
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1178)
%1180 = fadd double 20625525.60524500, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1180)
%1182 = fadd double 1992545612.31760001, 0.0000000001
%1183 = fsub double 0.00000000001, %1182
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1183)
%1185 = fadd double 1821736354.47659993, 0.0000000001
%1186 = fsub double 0.00000000001, %1185
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1186)
%1188 = fadd double 1916053079.87949991, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1188)
%1190 = fadd double 192739432.66780999, 0.0000000001
%1191 = fsub double 0.00000000001, %1190
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1191)
%1193 = fadd double 117790338.05118001, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1193)
%1195 = fadd double 501766354.18383002, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1195)
%1197 = fadd double 499269144.40587002, 0.0000000001
%1198 = fsub double 0.00000000001, %1197
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1198)
%1200 = fadd double 87312931.71451600, 0.0000000001
%1201 = fsub double 0.00000000001, %1200
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1201)
%1203 = fadd double 41302512.03807400, 0.0000000001
%1204 = fsub double 0.00000000001, %1203
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1204)
%1206 = fadd double 2068354515.53880000, 0.0000000001
%1207 = fsub double 0.00000000001, %1206
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1207)
%1209 = fadd double 1210955218.12069988, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1209)
%1211 = fadd double 671451695.90155995, 0.0000000001
%1212 = fsub double 0.00000000001, %1211
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1212)
%1214 = fadd double 238193356.53924000, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1214)
%1216 = fadd double 1508216368.56640005, 0.0000000001
%1217 = fsub double 0.00000000001, %1216
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1217)
%1219 = fadd double 747933951.61620998, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1219)
%1221 = fadd double 903170161.44357002, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1221)
%1223 = fadd double 1626606156.63639998, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1223)
%1225 = fadd double 1215162915.31100011, 0.0000000001
%1226 = fsub double 0.00000000001, %1225
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1226)
%1228 = fadd double 363203023.49743003, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1228)
%1230 = fadd double 1087457400.41910005, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1230)
%1232 = fadd double 205217736.81110001, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1232)
%1234 = fadd double 667942508.96970999, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1234)
%1236 = fadd double 1596286407.36229992, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1236)
%1238 = fadd double 1980606345.93260002, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1238)
%1240 = fadd double 2005010954.11820006, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1240)
%1242 = fadd double 1234034398.74909997, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1242)
%1244 = fadd double 462778770.24212998, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1244)
%1246 = fadd double 689176532.08974004, 0.0000000001
%1247 = fsub double 0.00000000001, %1246
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1247)
%1249 = fadd double 939580272.97918999, 0.0000000001
%1250 = fsub double 0.00000000001, %1249
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1250)
%1252 = fadd double 19610853.09388700, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1252)
%1254 = fadd double 509427526.87141001, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1254)
%1256 = fadd double 210031259.03037000, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1256)
%1258 = fadd double 97554342.07149801, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1258)
%1260 = fadd double 897104685.66812003, 0.0000000001
%1261 = fsub double 0.00000000001, %1260
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1261)
%1263 = fadd double 1764096182.08960009, 0.0000000001
%1264 = fsub double 0.00000000001, %1263
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1264)
%1266 = fadd double 1153125613.26279998, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1266)
%1268 = fadd double 1127346826.05200005, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1268)
%1270 = fadd double 19439420.02151800, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1270)
%1272 = fadd double 2056454526.50480008, 0.0000000001
%1273 = fsub double 0.00000000001, %1272
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1273)
%1275 = fadd double 293917669.87928998, 0.0000000001
%1276 = fsub double 0.00000000001, %1275
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1276)
%1278 = fadd double 1216100236.04089999, 0.0000000001
%1279 = fsub double 0.00000000001, %1278
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1279)
%1281 = fadd double 465681005.25229001, 0.0000000001
%1282 = fsub double 0.00000000001, %1281
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1282)
%1284 = fadd double 405941759.50316000, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1284)
%1286 = fadd double 393566369.09784001, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1286)
%1288 = fadd double 720862262.14673996, 0.0000000001
%1289 = fsub double 0.00000000001, %1288
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1289)
%1291 = fadd double 500431962.42755002, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1291)
%1293 = fadd double 587470028.34388995, 0.0000000001
%1294 = fsub double 0.00000000001, %1293
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1294)
%1296 = fadd double 99091777.56394300, 0.0000000001
%1297 = fsub double 0.00000000001, %1296
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1297)
%1299 = fadd double 423711310.31612003, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1299)
%1301 = fadd double 713721434.64963996, 0.0000000001
%1302 = fsub double 0.00000000001, %1301
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1302)
%1304 = fadd double 107148225.94369000, 0.0000000001
%1305 = fsub double 0.00000000001, %1304
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1305)
%1307 = fadd double 977822228.93754995, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1307)
%1309 = fadd double 645294921.34935999, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1309)
%1311 = fadd double 2007049558.21539998, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1311)
%1313 = fadd double 1135175163.86529994, 0.0000000001
%1314 = fsub double 0.00000000001, %1313
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1314)
%1316 = fadd double 1663660299.58270001, 0.0000000001
%1317 = fsub double 0.00000000001, %1316
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1317)
%1319 = fadd double 1409608011.48160005, 0.0000000001
%1320 = fsub double 0.00000000001, %1319
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1320)
%1322 = fadd double 99616376.81299800, 0.0000000001
%1323 = fsub double 0.00000000001, %1322
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1323)
%1325 = fadd double 1083470462.18899989, 0.0000000001
%1326 = fsub double 0.00000000001, %1325
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1326)
%1328 = fadd double 715285524.16269004, 0.0000000001
%1329 = fsub double 0.00000000001, %1328
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1329)
%1331 = fadd double 2000160664.51760006, 0.0000000001
%1332 = fsub double 0.00000000001, %1331
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1332)
%1334 = fadd double 1087820947.60249996, 0.0000000001
%1335 = fsub double 0.00000000001, %1334
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1335)
%1337 = fadd double 829028277.73320997, 0.0000000001
%1338 = fsub double 0.00000000001, %1337
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1338)
%1340 = fadd double 503046943.32962000, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1340)
%1342 = fadd double 108010241.19612999, 0.0000000001
%1343 = fsub double 0.00000000001, %1342
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1343)
%1345 = fadd double 1498719015.06389999, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1345)
%1347 = fadd double 641047950.60906994, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1347)
%1349 = fadd double 857303579.33214998, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1349)
%1351 = fadd double 1025523840.32079995, 0.0000000001
%1352 = fsub double 0.00000000001, %1351
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1352)
%1354 = fadd double 339365977.70954001, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1354)
%1356 = fadd double 35798849.17267800, 0.0000000001
%1357 = fsub double 0.00000000001, %1356
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1357)
%1359 = fadd double 475018009.04925001, 0.0000000001
%1360 = fsub double 0.00000000001, %1359
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1360)
%1362 = fadd double 1688991288.98510003, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1362)
%1364 = fadd double 799526762.88984001, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1364)
%1366 = fadd double 665418704.15316999, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1366)
%1368 = fadd double 1514460601.36969995, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1368)
%1370 = fadd double 2100290864.35540009, 0.0000000001
%1371 = fsub double 0.00000000001, %1370
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1371)
%1373 = fadd double 1934183648.64100003, 0.0000000001
%1374 = fsub double 0.00000000001, %1373
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1374)
%1376 = fadd double 1195516523.52509999, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1376)
%1378 = fadd double 95153949.78289101, 0.0000000001
%1379 = fsub double 0.00000000001, %1378
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1379)
%1381 = fadd double 1088592831.48490000, 0.0000000001
%1382 = fsub double 0.00000000001, %1381
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1382)
%1384 = fadd double 317860634.32345003, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1384)
%1386 = fadd double 296993555.20355999, 0.0000000001
%1387 = fsub double 0.00000000001, %1386
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1387)
%1389 = fadd double 2119417054.59430003, 0.0000000001
%1390 = fsub double 0.00000000001, %1389
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1390)
%1392 = fadd double 578828891.93289006, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1392)
%1394 = fadd double 391499347.53693002, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1394)
%1396 = fadd double 28623021.59456000, 0.0000000001
%1397 = fsub double 0.00000000001, %1396
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1397)
%1399 = fadd double 1109305152.52430010, 0.0000000001
%1400 = fsub double 0.00000000001, %1399
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1400)
%1402 = fadd double 528195460.74694997, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1402)
%1404 = fadd double 93033596.48726200, 0.0000000001
%1405 = fsub double 0.00000000001, %1404
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1405)
%1407 = fadd double 1830419983.30920005, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1407)
%1409 = fadd double 14149895.69096100, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1409)
%1411 = fadd double 335023793.98720002, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1411)
%1413 = fadd double 1217446887.90429997, 0.0000000001
%1414 = fsub double 0.00000000001, %1413
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1414)
%1416 = fadd double 1915809998.66899991, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1416)
%1418 = fadd double 703855189.11242998, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1418)
%1420 = fadd double 1412332219.71180010, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1420)
%1422 = fadd double 1951782163.33610010, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1422)
%1424 = fadd double 1708987747.58879995, 0.0000000001
%1425 = fsub double 0.00000000001, %1424
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1425)
%1427 = fadd double 877248459.83282995, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1427)
%1429 = fadd double 1074851908.17960000, 0.0000000001
%1430 = fsub double 0.00000000001, %1429
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1430)
%1432 = fadd double 75164467.33356699, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1432)
%1434 = fadd double 78524615.50058700, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1434)
%1436 = fadd double 376181163.50582999, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1436)
%1438 = fadd double 896664808.22133994, 0.0000000001
%1439 = fsub double 0.00000000001, %1438
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1439)
%1441 = fadd double 343578254.12932998, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1441)
%1443 = fadd double 1929031248.75740004, 0.0000000001
%1444 = fsub double 0.00000000001, %1443
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1444)
%1446 = fadd double 201370125.50751999, 0.0000000001
%1447 = fsub double 0.00000000001, %1446
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1447)
%1449 = fadd double 1586074505.85100007, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1449)
%1451 = fadd double 227669449.40560001, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1451)
%1453 = fadd double 1795976825.49429989, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1453)
%1455 = fadd double 917199041.62685001, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1455)
%1457 = fadd double 155638409.86379001, 0.0000000001
%1458 = fsub double 0.00000000001, %1457
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1458)
%1460 = fadd double 1381497258.54310012, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1460)
%1462 = fadd double 766904997.38513994, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1462)
%1464 = fadd double 161594004.06580999, 0.0000000001
%1465 = fsub double 0.00000000001, %1464
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1465)
%1467 = fadd double 368474955.00541002, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1467)
%1469 = fadd double 2021068523.59270000, 0.0000000001
%1470 = fsub double 0.00000000001, %1469
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1470)
%1472 = fadd double 71585291.26510000, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1472)
%1474 = fadd double 318599711.54492998, 0.0000000001
%1475 = fsub double 0.00000000001, %1474
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1475)
%1477 = fadd double 1324061979.06960011, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1477)
%1479 = fadd double 703648178.08001006, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1479)
%1481 = fadd double 107410391.93083000, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1481)
%1483 = fadd double 1083107131.14080000, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1483)
%1485 = fadd double 175028194.88773000, 0.0000000001
%1486 = fsub double 0.00000000001, %1485
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1486)
%1488 = fadd double 302125519.77836001, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1488)
%1490 = fadd double 519483541.12199998, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1490)
%1492 = fadd double 761648184.13589001, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1492)
%1494 = fadd double 136660766.91558000, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1494)
%1496 = fadd double 921740483.18142998, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1496)
%1498 = fadd double 122107066.47163001, 0.0000000001
%1499 = fsub double 0.00000000001, %1498
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1499)
%1501 = fadd double 335182543.47130001, 0.0000000001
%1502 = fsub double 0.00000000001, %1501
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1502)
%1504 = fadd double 363141358.56441998, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1504)
%1506 = fadd double 472635935.23833001, 0.0000000001
%1507 = fsub double 0.00000000001, %1506
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1507)
%1509 = fadd double 274290994.60583001, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1509)
%1511 = fadd double 2091143233.27999997, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1511)
%1513 = fadd double 924042783.26870000, 0.0000000001
%1514 = fsub double 0.00000000001, %1513
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1514)
%1516 = fadd double 622731732.59263003, 0.0000000001
%1517 = fsub double 0.00000000001, %1516
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1517)
%1519 = fadd double 823727023.92096996, 0.0000000001
%1520 = fsub double 0.00000000001, %1519
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1520)
%1522 = fadd double 1832087685.26589990, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1522)
%1524 = fadd double 105284421.04617000, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1524)
%1526 = fadd double 843229999.61495996, 0.0000000001
%1527 = fsub double 0.00000000001, %1526
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1527)
%1529 = fadd double 1293847223.18650007, 0.0000000001
%1530 = fsub double 0.00000000001, %1529
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1530)
%1532 = fadd double 1714907125.83400011, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1532)
%1534 = fadd double 609177264.58193004, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1534)
%1536 = fadd double 1691351726.29169989, 0.0000000001
%1537 = fsub double 0.00000000001, %1536
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1537)
%1539 = fadd double 1735460453.20549989, 0.0000000001
%1540 = fsub double 0.00000000001, %1539
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1540)
%1542 = fadd double 600333097.08963001, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1542)
%1544 = fadd double 1268264975.46690011, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1544)
%1546 = fadd double 1224672602.05080009, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1546)
%1548 = fadd double 2117797233.34419990, 0.0000000001
%1549 = fsub double 0.00000000001, %1548
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1549)
%1551 = fadd double 1898810634.18269992, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1551)
%1553 = fadd double 992216102.04150999, 0.0000000001
%1554 = fsub double 0.00000000001, %1553
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1554)
%1556 = fadd double 411459359.15082002, 0.0000000001
%1557 = fsub double 0.00000000001, %1556
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1557)
%1559 = fadd double 19802312.86907400, 0.0000000001
%1560 = fsub double 0.00000000001, %1559
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1560)
%1562 = fadd double 1525709302.10549998, 0.0000000001
%1563 = fsub double 0.00000000001, %1562
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1563)
%1565 = fadd double 165322328.80768001, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1565)
%1567 = fadd double 541796440.26419997, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1567)
%1569 = fadd double 31893224.86264400, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1569)
%1571 = fadd double 134927437.07653001, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1571)
%1573 = fadd double 1039081892.58060002, 0.0000000001
%1574 = fsub double 0.00000000001, %1573
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1574)
%1576 = fadd double 214025998.43079999, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1576)
%1578 = fadd double 1029241115.80470002, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1578)
%1580 = fadd double 154367790.32231000, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1580)
%1582 = fadd double 798503603.42938995, 0.0000000001
%1583 = fsub double 0.00000000001, %1582
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1583)
%1585 = fadd double 840357897.76557004, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1585)
%1587 = fadd double 1991372918.34619999, 0.0000000001
%1588 = fsub double 0.00000000001, %1587
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1588)
%1590 = fadd double 9202666.02552940, 0.0000000001
%1591 = fsub double 0.00000000001, %1590
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1591)
%1593 = fadd double 771534274.48763001, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1593)
%1595 = fadd double 4327516.34312010, 0.0000000001
%1596 = fsub double 0.00000000001, %1595
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1596)
%1598 = fadd double 236997689.83701000, 0.0000000001
%1599 = fsub double 0.00000000001, %1598
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1599)
%1601 = fadd double 1382462012.24130011, 0.0000000001
%1602 = fsub double 0.00000000001, %1601
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1602)
%1604 = fadd double 1817418736.75390005, 0.0000000001
%1605 = fsub double 0.00000000001, %1604
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1605)
%1607 = fadd double 931647339.40919006, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1607)
%1609 = fadd double 55682905.56549300, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1609)
%1611 = fadd double 216797692.53644001, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1611)
%1613 = fadd double 1337681646.43779993, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1613)
%1615 = fadd double 237603798.06974000, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1615)
%1617 = fadd double 352100879.81339002, 0.0000000001
%1618 = fsub double 0.00000000001, %1617
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1618)
%1620 = fadd double 1091501499.42389989, 0.0000000001
%1621 = fsub double 0.00000000001, %1620
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1621)
%1623 = fadd double 148851365.30318999, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1623)
%1625 = fadd double 1103949121.15310001, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1625)
%1627 = fadd double 219148553.21748999, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1627)
%1629 = fadd double 969333269.84756005, 0.0000000001
%1630 = fsub double 0.00000000001, %1629
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1630)
%1632 = fadd double 229681797.90382999, 0.0000000001
%1633 = fsub double 0.00000000001, %1632
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1633)
%1635 = fadd double 567950866.02261996, 0.0000000001
%1636 = fsub double 0.00000000001, %1635
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1636)
%1638 = fadd double 667557112.78543997, 0.0000000001
%1639 = fsub double 0.00000000001, %1638
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1639)
%1641 = fadd double 1450950125.98909998, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1641)
%1643 = fadd double 362337328.55368000, 0.0000000001
%1644 = fsub double 0.00000000001, %1643
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1644)
%1646 = fadd double 1346798136.71970010, 0.0000000001
%1647 = fsub double 0.00000000001, %1646
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1647)
%1649 = fadd double 22178181.18781400, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1649)
%1651 = fadd double 67427021.48192000, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1651)
%1653 = fadd double 337264190.37114000, 0.0000000001
%1654 = fsub double 0.00000000001, %1653
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1654)
%1656 = fadd double 1148530246.04229999, 0.0000000001
%1657 = fsub double 0.00000000001, %1656
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1657)
%1659 = fadd double 980419957.82314003, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1659)
%1661 = fadd double 438582928.06976002, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1661)
%1663 = fadd double 976816262.99900997, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1663)
%1665 = fadd double 113568921.84068000, 0.0000000001
%1666 = fsub double 0.00000000001, %1665
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1666)
%1668 = fadd double 277884154.47950000, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1668)
%1670 = fadd double 938568879.07458997, 0.0000000001
%1671 = fsub double 0.00000000001, %1670
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1671)
%1673 = fadd double 947095525.51484001, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1673)
%1675 = fadd double 1772964689.84340000, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1675)
%1677 = fadd double 421834180.74905002, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1677)
%1679 = fadd double 606468585.01971996, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1679)
%1681 = fadd double 549088958.24686003, 0.0000000001
%1682 = fsub double 0.00000000001, %1681
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1682)
%1684 = fadd double 334001574.88722998, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1684)
%1686 = fadd double 674552799.33033001, 0.0000000001
%1687 = fsub double 0.00000000001, %1686
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1687)
%1689 = fadd double 1611907598.48420000, 0.0000000001
%1690 = fsub double 0.00000000001, %1689
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1690)
%1692 = fadd double 963159544.72852004, 0.0000000001
%1693 = fsub double 0.00000000001, %1692
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1693)
%1695 = fadd double 556346011.46949005, 0.0000000001
%1696 = fsub double 0.00000000001, %1695
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1696)
%1698 = fadd double 217294039.78310001, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1698)
%1700 = fadd double 138870227.63409001, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1700)
%1702 = fadd double 1084761227.47379994, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1702)
%1704 = fadd double 543042322.17114997, 0.0000000001
%1705 = fsub double 0.00000000001, %1704
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1705)
%1707 = fadd double 210041203.69495001, 0.0000000001
%1708 = fsub double 0.00000000001, %1707
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1708)
%1710 = fadd double 1198106295.60109997, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1710)
%1712 = fadd double 353683517.42991000, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1712)
%1714 = fadd double 752410264.75206995, 0.0000000001
%1715 = fsub double 0.00000000001, %1714
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1715)
%1717 = fadd double 273501179.89981002, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1717)
%1719 = fadd double 852663536.38214004, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1719)
%1721 = fadd double 210624608.29109001, 0.0000000001
%1722 = fsub double 0.00000000001, %1721
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1722)
%1724 = fadd double 788032520.14344001, 0.0000000001
%1725 = fsub double 0.00000000001, %1724
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1725)
%1727 = fadd double 1878326964.16409993, 0.0000000001
%1728 = fsub double 0.00000000001, %1727
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1728)
%1730 = fadd double 297838577.10990000, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1730)
%1732 = fadd double 277938173.99675000, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1732)
%1734 = fadd double 1522217530.10509992, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1734)
%1736 = fadd double 299155508.37527001, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1736)
%1738 = fadd double 1529857870.28279996, 0.0000000001
%1739 = fsub double 0.00000000001, %1738
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1739)
%1741 = fadd double 135413184.68897000, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1741)
%1743 = fadd double 810975314.59047997, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1743)
%1745 = fadd double 4231593.21500920, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1745)
%1747 = fadd double 57566473.37689400, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1747)
%1749 = fadd double 525898325.54719001, 0.0000000001
%1750 = fsub double 0.00000000001, %1749
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1750)
%1752 = fadd double 853095926.42885005, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1752)
%1754 = fadd double 2144196846.75230002, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1754)
%1756 = fadd double 737428966.97498000, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1756)
%1758 = fadd double 195103742.26798001, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1758)
%1760 = fadd double 1191074942.90199995, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1760)
%1762 = fadd double 538907669.22048998, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1762)
%1764 = fadd double 789249653.89816999, 0.0000000001
%1765 = fsub double 0.00000000001, %1764
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1765)
%1767 = fadd double 226455860.05157000, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1767)
%1769 = fadd double 1461254248.49099994, 0.0000000001
%1770 = fsub double 0.00000000001, %1769
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1770)
%1772 = fadd double 235003338.84659001, 0.0000000001
%1773 = fsub double 0.00000000001, %1772
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1773)
%1775 = fadd double 364400242.04759002, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1775)
%1777 = fadd double 1051605310.94140005, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1777)
%1779 = fadd double 7901602.32985780, 0.0000000001
%1780 = fsub double 0.00000000001, %1779
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1780)
%1782 = fadd double 193167070.24566999, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1782)
%1784 = fadd double 295010041.69024003, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1784)
%1786 = fadd double 497160517.60597998, 0.0000000001
%1787 = fsub double 0.00000000001, %1786
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1787)
%1789 = fadd double 1531016432.65669990, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1789)
%1791 = fadd double 51418320.92159800, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1791)
%1793 = fadd double 432210252.55949998, 0.0000000001
%1794 = fsub double 0.00000000001, %1793
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1794)
%1796 = fadd double 464971207.61320001, 0.0000000001
%1797 = fsub double 0.00000000001, %1796
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1797)
%1799 = fadd double 295265749.78259999, 0.0000000001
%1800 = fsub double 0.00000000001, %1799
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1800)
%1802 = fadd double 20287422.65380100, 0.0000000001
%1803 = fsub double 0.00000000001, %1802
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1803)
%1805 = fadd double 2121909576.67729998, 0.0000000001
%1806 = fsub double 0.00000000001, %1805
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1806)
%1808 = fadd double 756036939.87256002, 0.0000000001
%1809 = fsub double 0.00000000001, %1808
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1809)
%1811 = fadd double 592150802.82176006, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1811)
%1813 = fadd double 539478631.55451000, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1813)
%1815 = fadd double 1582641624.19029999, 0.0000000001
%1816 = fsub double 0.00000000001, %1815
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1816)
%1818 = fadd double 1427679784.88380003, 0.0000000001
%1819 = fsub double 0.00000000001, %1818
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1819)
%1821 = fadd double 669472462.12258995, 0.0000000001
%1822 = fsub double 0.00000000001, %1821
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1822)
%1824 = fadd double 268324993.94929999, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1824)
%1826 = fadd double 1068975093.86290002, 0.0000000001
%1827 = fsub double 0.00000000001, %1826
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1827)
%1829 = fadd double 1919673712.22140002, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1829)
%1831 = fadd double 1245265727.87619996, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1831)
%1833 = fadd double 703135533.04294002, 0.0000000001
%1834 = fsub double 0.00000000001, %1833
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1834)
%1836 = fadd double 543920876.54482996, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1836)
%1838 = fadd double 1291518526.42129993, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1838)
%1840 = fadd double 567142287.12447000, 0.0000000001
%1841 = fsub double 0.00000000001, %1840
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1841)
%1843 = fadd double 111475963.41495000, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1843)
%1845 = fadd double 355485606.35576999, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1845)
%1847 = fadd double 552655545.30510998, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1847)
%1849 = fadd double 312665628.68842000, 0.0000000001
%1850 = fsub double 0.00000000001, %1849
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1850)
%1852 = fadd double 1421962398.21169996, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1852)
%1854 = fadd double 156064765.14002001, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1854)
%1856 = fadd double 1050385924.51580000, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1856)
%1858 = fadd double 149983879.37854999, 0.0000000001
%1859 = fsub double 0.00000000001, %1858
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1859)
%1861 = fadd double 1997107554.85929990, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1861)
%1863 = fadd double 618105502.50984001, 0.0000000001
%1864 = fsub double 0.00000000001, %1863
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1864)
%1866 = fadd double 173215741.89653999, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1866)
%1868 = fadd double 1996892788.66079998, 0.0000000001
%1869 = fsub double 0.00000000001, %1868
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1869)
%1871 = fadd double 227962645.56143999, 0.0000000001
%1872 = fsub double 0.00000000001, %1871
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1872)
%1874 = fadd double 353319901.04782999, 0.0000000001
%1875 = fsub double 0.00000000001, %1874
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1875)
%1877 = fadd double 58452338.62786700, 0.0000000001
%1878 = fsub double 0.00000000001, %1877
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1878)
%1880 = fadd double 668016137.76101005, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1880)
%1882 = fadd double 1033833.41982980, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1882)
%1884 = fadd double 1275842775.97560000, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1884)
%1886 = fadd double 364937526.21371001, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1886)
%1888 = fadd double 586185371.73169994, 0.0000000001
%1889 = fsub double 0.00000000001, %1888
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1889)
%1891 = fadd double 605420097.85421002, 0.0000000001
%1892 = fsub double 0.00000000001, %1891
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1892)
%1894 = fadd double 239439632.50023001, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1894)
%1896 = fadd double 1711097411.08529997, 0.0000000001
%1897 = fsub double 0.00000000001, %1896
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1897)
%1899 = fadd double 861557043.35132003, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1899)
%1901 = fadd double 1468650100.93249989, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1901)
%1903 = fadd double 200056748.49359000, 0.0000000001
%1904 = fsub double 0.00000000001, %1903
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1904)
%1906 = fadd double 299051872.89867002, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1906)
%1908 = fadd double 997224303.85125005, 0.0000000001
%1909 = fsub double 0.00000000001, %1908
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1909)
%1911 = fadd double 852685885.56017995, 0.0000000001
%1912 = fsub double 0.00000000001, %1911
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1912)
%1914 = fadd double 2099622328.45549989, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1914)
%1916 = fadd double 6371220.46714780, 0.0000000001
%1917 = fsub double 0.00000000001, %1916
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1917)
%1919 = fadd double 1992920600.52640009, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1919)
%1921 = fadd double 385163928.29284000, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1921)
%1923 = fadd double 1255776445.82780004, 0.0000000001
%1924 = fsub double 0.00000000001, %1923
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1924)
%1926 = fadd double 253811363.79802999, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1926)
%1928 = fadd double 740905176.85576999, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1928)
%1930 = fadd double 1897551977.59450006, 0.0000000001
%1931 = fsub double 0.00000000001, %1930
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1931)
%1933 = fadd double 317252946.86157000, 0.0000000001
%1934 = fsub double 0.00000000001, %1933
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1934)
%1936 = fadd double 1140406103.58249998, 0.0000000001
%1937 = fsub double 0.00000000001, %1936
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1937)
%1939 = fadd double 466517336.04604000, 0.0000000001
%1940 = fsub double 0.00000000001, %1939
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1940)
%1942 = fadd double 119166676.43833999, 0.0000000001
%1943 = fsub double 0.00000000001, %1942
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1943)
%1945 = fadd double 396544940.86824000, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1945)
%1947 = fadd double 240931546.06294999, 0.0000000001
%1948 = fsub double 0.00000000001, %1947
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1948)
%1950 = fadd double 975579236.61090004, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1950)
%1952 = fadd double 1330246691.52320004, 0.0000000001
%1953 = fsub double 0.00000000001, %1952
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1953)
%1955 = fadd double 1796174657.65120006, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1955)
%1957 = fadd double 230964669.17135000, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1957)
%1959 = fadd double 1073173278.66610003, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1959)
%1961 = fadd double 677792870.73558998, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1961)
%1963 = fadd double 1584467207.49600005, 0.0000000001
%1964 = fsub double 0.00000000001, %1963
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1964)
%1966 = fadd double 1483785237.02850008, 0.0000000001
%1967 = fsub double 0.00000000001, %1966
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1967)
%1969 = fadd double 1276453997.83360004, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1969)
%1971 = fadd double 43155901.85295800, 0.0000000001
%1972 = fsub double 0.00000000001, %1971
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1972)
%1974 = fadd double 180308836.27293000, 0.0000000001
%1975 = fsub double 0.00000000001, %1974
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1975)
%1977 = fadd double 628085191.45536005, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1977)
%1979 = fadd double 132860087.06642000, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1979)
%1981 = fadd double 851496603.57748997, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1981)
%1983 = fadd double 1274777782.23070002, 0.0000000001
%1984 = fsub double 0.00000000001, %1983
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1984)
%1986 = fadd double 618482682.31587005, 0.0000000001
%1987 = fsub double 0.00000000001, %1986
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1987)
%1989 = fadd double 1099000695.36310005, 0.0000000001
%1990 = fsub double 0.00000000001, %1989
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1990)
%1992 = fadd double 635836491.12369001, 0.0000000001
%1993 = fsub double 0.00000000001, %1992
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1993)
%1995 = fadd double 783240532.18856001, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1995)
%1997 = fadd double 1055350510.57149994, 0.0000000001
%1998 = fsub double 0.00000000001, %1997
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %1998)
%2000 = fadd double 514909787.67491001, 0.0000000001
%2001 = fsub double 0.00000000001, %2000
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2001)
%2003 = fadd double 1201965382.38170004, 0.0000000001
%2004 = fsub double 0.00000000001, %2003
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2004)
%2006 = fadd double 1428858060.61750007, 0.0000000001
%2007 = fsub double 0.00000000001, %2006
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2007)
%2009 = fadd double 2013944456.20059991, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2009)
%2011 = fadd double 359087650.38306999, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2011)
%2013 = fadd double 1521191425.33170009, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2013)
%2015 = fadd double 203132482.95388001, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2015)
%2017 = fadd double 475358114.75555003, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2017)
%2019 = fadd double 1514927339.81310010, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2019)
%2021 = fadd double 301476466.88635999, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2021)
%2023 = fadd double 1957092172.69779992, 0.0000000001
%2024 = fsub double 0.00000000001, %2023
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2024)
%2026 = fadd double 1211263048.35700011, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2026)
%2028 = fadd double 1198523242.33360004, 0.0000000001
%2029 = fsub double 0.00000000001, %2028
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2029)
%2031 = fadd double 1176587355.55270004, 0.0000000001
%2032 = fsub double 0.00000000001, %2031
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2032)
%2034 = fadd double 2120050711.14590001, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2034)
%2036 = fadd double 1194684697.75139999, 0.0000000001
%2037 = fsub double 0.00000000001, %2036
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2037)
%2039 = fadd double 134471464.89308000, 0.0000000001
%2040 = fsub double 0.00000000001, %2039
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2040)
%2042 = fadd double 732332163.66533995, 0.0000000001
%2043 = fsub double 0.00000000001, %2042
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2043)
%2045 = fadd double 583897741.57146001, 0.0000000001
%2046 = fsub double 0.00000000001, %2045
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2046)
%2048 = fadd double 985634617.96440005, 0.0000000001
%2049 = fsub double 0.00000000001, %2048
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2049)
%2051 = fadd double 73188829.26662500, 0.0000000001
%2052 = fsub double 0.00000000001, %2051
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2052)
%2054 = fadd double 76975475.50242300, 0.0000000001
%2055 = fsub double 0.00000000001, %2054
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2055)
%2057 = fadd double 643916296.99696004, 0.0000000001
%2058 = fsub double 0.00000000001, %2057
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2058)
%2060 = fadd double 1427265145.35850000, 0.0000000001
%2061 = fsub double 0.00000000001, %2060
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2061)
%2063 = fadd double 1371954440.94330001, 0.0000000001
%2064 = fsub double 0.00000000001, %2063
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2064)
%2066 = fadd double 396837478.64486003, 0.0000000001
%2067 = fsub double 0.00000000001, %2066
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2067)
%2069 = fadd double 2142824855.81629992, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2069)
%2071 = fadd double 1982834695.92210007, 0.0000000001
%2072 = fsub double 0.00000000001, %2071
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2072)
%2074 = fadd double 303401466.59762001, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2074)
%2076 = fadd double 1986675582.09980011, 0.0000000001
%2077 = fsub double 0.00000000001, %2076
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2077)
%2079 = fadd double 1699825057.68689990, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2079)
%2081 = fadd double 918662495.63989997, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2081)
%2083 = fadd double 1854213512.82500005, 0.0000000001
%2084 = fsub double 0.00000000001, %2083
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2084)
%2086 = fadd double 132118832.64450000, 0.0000000001
%2087 = fsub double 0.00000000001, %2086
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2087)
%2089 = fadd double 689362922.77679002, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2089)
%2091 = fadd double 35218511.06880100, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2091)
%2093 = fadd double 1298658301.35630012, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2093)
%2095 = fadd double 1929057741.00830007, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2095)
%2097 = fadd double 1160390989.90700006, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2097)
%2099 = fadd double 226291074.65809000, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2099)
%2101 = fadd double 681772929.75322998, 0.0000000001
%2102 = fsub double 0.00000000001, %2101
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2102)
%2104 = fadd double 632385357.45637000, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2104)
%2106 = fadd double 106157799.72581001, 0.0000000001
%2107 = fsub double 0.00000000001, %2106
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2107)
%2109 = fadd double 1581365904.85750008, 0.0000000001
%2110 = fsub double 0.00000000001, %2109
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2110)
%2112 = fadd double 1668769304.99169993, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2112)
%2114 = fadd double 220084522.85128000, 0.0000000001
%2115 = fsub double 0.00000000001, %2114
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2115)
%2117 = fadd double 202943624.86138001, 0.0000000001
%2118 = fsub double 0.00000000001, %2117
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2118)
%2120 = fadd double 1408842946.55279994, 0.0000000001
%2121 = fsub double 0.00000000001, %2120
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2121)
%2123 = fadd double 74794908.26082499, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2123)
%2125 = fadd double 368817466.65678000, 0.0000000001
%2126 = fsub double 0.00000000001, %2125
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2126)
%2128 = fadd double 322539089.02045000, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2128)
%2130 = fadd double 687435164.10362005, 0.0000000001
%2131 = fsub double 0.00000000001, %2130
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2131)
%2133 = fadd double 42712679.63319600, 0.0000000001
%2134 = fsub double 0.00000000001, %2133
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2134)
%2136 = fadd double 835723946.22432995, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2136)
%2138 = fadd double 151136491.33697999, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2138)
%2140 = fadd double 1133921724.50810003, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2140)
%2142 = fadd double 257739521.96178001, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2142)
%2144 = fadd double 243327862.18650001, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2144)
%2146 = fadd double 352656368.21647000, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2146)
%2148 = fadd double 763100710.36247003, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2148)
%2150 = fadd double 637247463.06833994, 0.0000000001
%2151 = fsub double 0.00000000001, %2150
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2151)
%2153 = fadd double 880135600.37108004, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2153)
%2155 = fadd double 408168217.28833997, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2155)
%2157 = fadd double 1673136242.91050005, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2157)
%2159 = fadd double 1468054129.74419999, 0.0000000001
%2160 = fsub double 0.00000000001, %2159
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2160)
%2162 = fadd double 227570703.49092001, 0.0000000001
%2163 = fsub double 0.00000000001, %2162
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2163)
%2165 = fadd double 791514371.23574996, 0.0000000001
%2166 = fsub double 0.00000000001, %2165
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2166)
%2168 = fadd double 558618170.17300999, 0.0000000001
%2169 = fsub double 0.00000000001, %2168
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2169)
%2171 = fadd double 2083456556.36809993, 0.0000000001
%2172 = fsub double 0.00000000001, %2171
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2172)
%2174 = fadd double 1824145437.61389995, 0.0000000001
%2175 = fsub double 0.00000000001, %2174
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2175)
%2177 = fadd double 303978839.79707003, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2177)
%2179 = fadd double 416864759.59363002, 0.0000000001
%2180 = fsub double 0.00000000001, %2179
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2180)
%2182 = fadd double 862900764.45787001, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2182)
%2184 = fadd double 1129012283.30139995, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2184)
%2186 = fadd double 1245447314.10929990, 0.0000000001
%2187 = fsub double 0.00000000001, %2186
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2187)
%2189 = fadd double 1696188227.07259989, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2189)
%2191 = fadd double 176789032.68193001, 0.0000000001
%2192 = fsub double 0.00000000001, %2191
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2192)
%2194 = fadd double 4409313.14673780, 0.0000000001
%2195 = fsub double 0.00000000001, %2194
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2195)
%2197 = fadd double 189200059.61252001, 0.0000000001
%2198 = fsub double 0.00000000001, %2197
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2198)
%2200 = fadd double 511523722.99233001, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2200)
%2202 = fadd double 101566154.95262000, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2202)
%2204 = fadd double 154159384.69591999, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2204)
%2206 = fadd double 912994529.45792997, 0.0000000001
%2207 = fsub double 0.00000000001, %2206
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2207)
%2209 = fadd double 872752670.12911999, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2209)
%2211 = fadd double 455921712.07226998, 0.0000000001
%2212 = fsub double 0.00000000001, %2211
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2212)
%2214 = fadd double 1545650441.96709991, 0.0000000001
%2215 = fsub double 0.00000000001, %2214
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2215)
%2217 = fadd double 547053284.83566999, 0.0000000001
%2218 = fsub double 0.00000000001, %2217
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2218)
%2220 = fadd double 237517345.72959000, 0.0000000001
%2221 = fsub double 0.00000000001, %2220
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2221)
%2223 = fadd double 178605247.62672001, 0.0000000001
%2224 = fsub double 0.00000000001, %2223
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2224)
%2226 = fadd double 903839510.42837000, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2226)
%2228 = fadd double 577245961.59468997, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2228)
%2230 = fadd double 1156564835.60850000, 0.0000000001
%2231 = fsub double 0.00000000001, %2230
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2231)
%2233 = fadd double 215692245.11853001, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2233)
%2235 = fadd double 1858206386.65019989, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2235)
%2237 = fadd double 1628852059.75250006, 0.0000000001
%2238 = fsub double 0.00000000001, %2237
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2238)
%2240 = fadd double 945466897.03174996, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2240)
%2242 = fadd double 371313042.57963997, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2242)
%2244 = fadd double 222502720.54828000, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2244)
%2246 = fadd double 1417754085.37840009, 0.0000000001
%2247 = fsub double 0.00000000001, %2246
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2247)
%2249 = fadd double 78402162.81135400, 0.0000000001
%2250 = fsub double 0.00000000001, %2249
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2250)
%2252 = fadd double 1078184252.52449989, 0.0000000001
%2253 = fsub double 0.00000000001, %2252
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2253)
%2255 = fadd double 46729547.65010400, 0.0000000001
%2256 = fsub double 0.00000000001, %2255
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2256)
%2258 = fadd double 492702397.08911002, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2258)
%2260 = fadd double 246698884.82903999, 0.0000000001
%2261 = fsub double 0.00000000001, %2260
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2261)
%2263 = fadd double 1782628034.89540005, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2263)
%2265 = fadd double 772502462.87768996, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2265)
%2267 = fadd double 208316795.47376999, 0.0000000001
%2268 = fsub double 0.00000000001, %2267
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2268)
%2270 = fadd double 1110197846.69339991, 0.0000000001
%2271 = fsub double 0.00000000001, %2270
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2271)
%2273 = fadd double 569986404.09534001, 0.0000000001
%2274 = fsub double 0.00000000001, %2273
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2274)
%2276 = fadd double 346854564.23070002, 0.0000000001
%2277 = fsub double 0.00000000001, %2276
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2277)
%2279 = fadd double 111330750.30758999, 0.0000000001
%2280 = fsub double 0.00000000001, %2279
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2280)
%2282 = fadd double 1574031437.13669991, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2282)
%2284 = fadd double 963142339.64697003, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2284)
%2286 = fadd double 794788139.33541000, 0.0000000001
%2287 = fsub double 0.00000000001, %2286
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2287)
%2289 = fadd double 711629889.57661998, 0.0000000001
%2290 = fsub double 0.00000000001, %2289
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2290)
%2292 = fadd double 507886304.82036000, 0.0000000001
%2293 = fsub double 0.00000000001, %2292
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2293)
%2295 = fadd double 462433695.78881001, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2295)
%2297 = fadd double 913450759.02191997, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2297)
%2299 = fadd double 1208408278.46659994, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2299)
%2301 = fadd double 1408220842.49790001, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2301)
%2303 = fadd double 1177894727.74169993, 0.0000000001
%2304 = fsub double 0.00000000001, %2303
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2304)
%2306 = fadd double 1091249935.59369993, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2306)
%2308 = fadd double 766648237.45668995, 0.0000000001
%2309 = fsub double 0.00000000001, %2308
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2309)
%2311 = fadd double 214957413.69411999, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2311)
%2313 = fadd double 237695523.34746999, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2313)
%2315 = fadd double 507723289.78763002, 0.0000000001
%2316 = fsub double 0.00000000001, %2315
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2316)
%2318 = fadd double 1702287346.65470004, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2318)
%2320 = fadd double 330690526.33161998, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2320)
%2322 = fadd double 313863880.29907000, 0.0000000001
%2323 = fsub double 0.00000000001, %2322
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2323)
%2325 = fadd double 402999441.82024997, 0.0000000001
%2326 = fsub double 0.00000000001, %2325
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2326)
%2328 = fadd double 299258552.01791000, 0.0000000001
%2329 = fsub double 0.00000000001, %2328
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2329)
%2331 = fadd double 354591117.32832998, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2331)
%2333 = fadd double 8244217.06412170, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2333)
%2335 = fadd double 1332475594.66269994, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2335)
%2337 = fadd double 1232117876.02769995, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2337)
%2339 = fadd double 333820803.43048000, 0.0000000001
%2340 = fsub double 0.00000000001, %2339
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2340)
%2342 = fadd double 1915595792.95199990, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2342)
%2344 = fadd double 71286401.63084300, 0.0000000001
%2345 = fsub double 0.00000000001, %2344
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2345)
%2347 = fadd double 789423363.56088996, 0.0000000001
%2348 = fsub double 0.00000000001, %2347
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2348)
%2350 = fadd double 551973852.28822005, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2350)
%2352 = fadd double 1247638483.23709989, 0.0000000001
%2353 = fsub double 0.00000000001, %2352
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2353)
%2355 = fadd double 296111165.69459999, 0.0000000001
%2356 = fsub double 0.00000000001, %2355
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2356)
%2358 = fadd double 2091476822.93869996, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2358)
%2360 = fadd double 1141648678.13249993, 0.0000000001
%2361 = fsub double 0.00000000001, %2360
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2361)
%2363 = fadd double 330874671.38568002, 0.0000000001
%2364 = fsub double 0.00000000001, %2363
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2364)
%2366 = fadd double 245747513.48559001, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2366)
%2368 = fadd double 599468591.86889005, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2368)
%2370 = fadd double 1162531828.84870005, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2370)
%2372 = fadd double 1351769556.02069998, 0.0000000001
%2373 = fsub double 0.00000000001, %2372
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2373)
%2375 = fadd double 493434954.76691002, 0.0000000001
%2376 = fsub double 0.00000000001, %2375
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2376)
%2378 = fadd double 999062379.67869997, 0.0000000001
%2379 = fsub double 0.00000000001, %2378
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2379)
%2381 = fadd double 1356626368.92219996, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2381)
%2383 = fadd double 196408539.11032999, 0.0000000001
%2384 = fsub double 0.00000000001, %2383
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2384)
%2386 = fadd double 2122598664.27469993, 0.0000000001
%2387 = fsub double 0.00000000001, %2386
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2387)
%2389 = fadd double 881173680.87624002, 0.0000000001
%2390 = fsub double 0.00000000001, %2389
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2390)
%2392 = fadd double 138133103.42332000, 0.0000000001
%2393 = fsub double 0.00000000001, %2392
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2393)
%2395 = fadd double 333574933.18410999, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2395)
%2397 = fadd double 699987323.39361000, 0.0000000001
%2398 = fsub double 0.00000000001, %2397
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2398)
%2400 = fadd double 15655449.45901800, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2400)
%2402 = fadd double 1006712177.28149998, 0.0000000001
%2403 = fsub double 0.00000000001, %2402
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2403)
%2405 = fadd double 1426730129.60459995, 0.0000000001
%2406 = fsub double 0.00000000001, %2405
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2406)
%2408 = fadd double 255879438.77847001, 0.0000000001
%2409 = fsub double 0.00000000001, %2408
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2409)
%2411 = fadd double 710056513.28931999, 0.0000000001
%2412 = fsub double 0.00000000001, %2411
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2412)
%2414 = fadd double 994897217.81036997, 0.0000000001
%2415 = fsub double 0.00000000001, %2414
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2415)
%2417 = fadd double 718404905.34419000, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2417)
%2419 = fadd double 262724802.30730000, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2419)
%2421 = fadd double 158057339.08035001, 0.0000000001
%2422 = fsub double 0.00000000001, %2421
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2422)
%2424 = fadd double 292194028.29005003, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2424)
%2426 = fadd double 1100720939.27200007, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2426)
%2428 = fadd double 1261929167.77880001, 0.0000000001
%2429 = fsub double 0.00000000001, %2428
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2429)
%2431 = fadd double 317019345.08818001, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2431)
%2433 = fadd double 1516489456.15009999, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2433)
%2435 = fadd double 35245147.62740700, 0.0000000001
%2436 = fsub double 0.00000000001, %2435
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2436)
%2438 = fadd double 1340403651.39680004, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2438)
%2440 = fadd double 1490035314.42820001, 0.0000000001
%2441 = fsub double 0.00000000001, %2440
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2441)
%2443 = fadd double 1036559463.38689995, 0.0000000001
%2444 = fsub double 0.00000000001, %2443
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2444)
%2446 = fadd double 169388840.96948999, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2446)
%2448 = fadd double 460848477.57492000, 0.0000000001
%2449 = fsub double 0.00000000001, %2448
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2449)
%2451 = fadd double 613638972.93173003, 0.0000000001
%2452 = fsub double 0.00000000001, %2451
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2452)
%2454 = fadd double 982612225.18106997, 0.0000000001
%2455 = fsub double 0.00000000001, %2454
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2455)
%2457 = fadd double 495750467.93207997, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2457)
%2459 = fadd double 1579728809.66720009, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2459)
%2461 = fadd double 1085182908.27970004, 0.0000000001
%2462 = fsub double 0.00000000001, %2461
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2462)
%2464 = fadd double 1609217084.58419991, 0.0000000001
%2465 = fsub double 0.00000000001, %2464
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2465)
%2467 = fadd double 1238754645.00239992, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2467)
%2469 = fadd double 650284583.28698003, 0.0000000001
%2470 = fsub double 0.00000000001, %2469
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2470)
%2472 = fadd double 804076101.60757995, 0.0000000001
%2473 = fsub double 0.00000000001, %2472
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2473)
%2475 = fadd double 1522728011.70880008, 0.0000000001
%2476 = fsub double 0.00000000001, %2475
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2476)
%2478 = fadd double 1028851480.85899997, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2478)
%2480 = fadd double 155998512.82909000, 0.0000000001
%2481 = fsub double 0.00000000001, %2480
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2481)
%2483 = fadd double 620076902.08002996, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2483)
%2485 = fadd double 300188449.90815997, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2485)
%2487 = fadd double 1056873646.60070002, 0.0000000001
%2488 = fsub double 0.00000000001, %2487
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2488)
%2490 = fadd double 1612296666.33774495, 0.0000000001
call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i64 0, i64 0), double %2490)
ret i32 0
}