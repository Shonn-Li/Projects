; ModuleID = 'seashell-compiler-output'
source_filename = "seashell-compiler-output"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"denom\00", align 1
@.str.1 = private unnamed_addr constant [52 x i8] c"/u1/dtompkins/.seashell/projects/_A4/common/round.c\00", align 1
@__PRETTY_FUNCTION__.div_round = private unnamed_addr constant [24 x i8] c"int div_round(int, int)\00", align 1

; Function Attrs: noinline nounwind optnone
define i32 @div_round(i32 %num, i32 %denom) #0 {
entry:
  %retval = alloca i32, align 4
  %num.addr = alloca i32, align 4
  %denom.addr = alloca i32, align 4
  store i32 %num, i32* %num.addr, align 4
  store i32 %denom, i32* %denom.addr, align 4
  %0 = load i32, i32* %denom.addr, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  br label %if.end

if.else:                                          ; preds = %entry
  call void @__assert_fail(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.1, i64 0, i64 0), i32 7, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @__PRETTY_FUNCTION__.div_round, i64 0, i64 0)) #3
  unreachable

if.end:                                           ; preds = %if.then
  %1 = load i32, i32* %num.addr, align 4
  %call = call i32 @abs(i32 %1) #4
  %2 = load i32, i32* %denom.addr, align 4
  %call1 = call i32 @abs(i32 %2) #4
  %rem = srem i32 %call, %call1
  %mul = mul nsw i32 2, %rem
  %3 = load i32, i32* %denom.addr, align 4
  %call2 = call i32 @abs(i32 %3) #4
  %cmp = icmp sle i32 %mul, %call2
  br i1 %cmp, label %if.then3, label %if.else4

if.then3:                                         ; preds = %if.end
  %4 = load i32, i32* %num.addr, align 4
  %5 = load i32, i32* %denom.addr, align 4
  %div = sdiv i32 %4, %5
  store i32 %div, i32* %retval, align 4
  br label %return

if.else4:                                         ; preds = %if.end
  %6 = load i32, i32* %num.addr, align 4
  %7 = load i32, i32* %denom.addr, align 4
  %mul5 = mul nsw i32 %6, %7
  %cmp6 = icmp sgt i32 %mul5, 0
  br i1 %cmp6, label %if.then7, label %if.else9

if.then7:                                         ; preds = %if.else4
  %8 = load i32, i32* %num.addr, align 4
  %9 = load i32, i32* %denom.addr, align 4
  %div8 = sdiv i32 %8, %9
  %add = add nsw i32 %div8, 1
  store i32 %add, i32* %retval, align 4
  br label %return

if.else9:                                         ; preds = %if.else4
  %10 = load i32, i32* %num.addr, align 4
  %11 = load i32, i32* %denom.addr, align 4
  %div10 = sdiv i32 %10, %11
  %sub = sub nsw i32 %div10, 1
  store i32 %sub, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.else9, %if.then7, %if.then3
  %12 = load i32, i32* %retval, align 4
  ret i32 %12
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #1

; Function Attrs: nounwind readnone
declare i32 @abs(i32) #2

attributes #0 = { noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }
attributes #4 = { nounwind readnone }

!llvm.ident = !{!0}
!llvm.module.flags = !{!1}

!0 = !{!"clang version 9.0.1 (https://github.com/llvm/llvm-project.git c1a0a213378a458fbea1a5c77b315c7dce08fd05)"}
!1 = !{i32 1, !"wchar_size", i32 4}
