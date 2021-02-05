; ModuleID = 'seashell-compiler-output'
source_filename = "seashell-compiler-output"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.stack = type { i32, i32, i32* }

@.str = private unnamed_addr constant [2 x i8] c"s\00", align 1
@.str.1 = private unnamed_addr constant [52 x i8] c"/u1/dtompkins/.seashell/projects/_A4/common/stack.c\00", align 1
@__PRETTY_FUNCTION__.stack_push = private unnamed_addr constant [37 x i8] c"void stack_push(int, struct stack *)\00", align 1
@__PRETTY_FUNCTION__.stack_is_empty = private unnamed_addr constant [43 x i8] c"_Bool stack_is_empty(const struct stack *)\00", align 1
@__PRETTY_FUNCTION__.stack_top = private unnamed_addr constant [36 x i8] c"int stack_top(const struct stack *)\00", align 1
@.str.2 = private unnamed_addr constant [7 x i8] c"s->len\00", align 1
@__PRETTY_FUNCTION__.stack_pop = private unnamed_addr constant [30 x i8] c"int stack_pop(struct stack *)\00", align 1

; Function Attrs: noinline nounwind optnone
define %struct.stack* @stack_create() #0 {
entry:
  %s = alloca %struct.stack*, align 8
  %call = call noalias i8* @malloc(i64 16) #3
  %0 = bitcast i8* %call to %struct.stack*
  store %struct.stack* %0, %struct.stack** %s, align 8
  %1 = load %struct.stack*, %struct.stack** %s, align 8
  %len = getelementptr inbounds %struct.stack, %struct.stack* %1, i32 0, i32 0
  store i32 0, i32* %len, align 8
  %2 = load %struct.stack*, %struct.stack** %s, align 8
  %maxlen = getelementptr inbounds %struct.stack, %struct.stack* %2, i32 0, i32 1
  store i32 1, i32* %maxlen, align 4
  %3 = load %struct.stack*, %struct.stack** %s, align 8
  %maxlen1 = getelementptr inbounds %struct.stack, %struct.stack* %3, i32 0, i32 1
  %4 = load i32, i32* %maxlen1, align 4
  %conv = sext i32 %4 to i64
  %mul = mul i64 %conv, 4
  %call2 = call noalias i8* @malloc(i64 %mul) #3
  %5 = bitcast i8* %call2 to i32*
  %6 = load %struct.stack*, %struct.stack** %s, align 8
  %data = getelementptr inbounds %struct.stack, %struct.stack* %6, i32 0, i32 2
  store i32* %5, i32** %data, align 8
  %7 = load %struct.stack*, %struct.stack** %s, align 8
  ret %struct.stack* %7
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: noinline nounwind optnone
define void @stack_push(i32 %item, %struct.stack* %s) #0 {
entry:
  %item.addr = alloca i32, align 4
  %s.addr = alloca %struct.stack*, align 8
  store i32 %item, i32* %item.addr, align 4
  store %struct.stack* %s, %struct.stack** %s.addr, align 8
  %0 = load %struct.stack*, %struct.stack** %s.addr, align 8
  %tobool = icmp ne %struct.stack* %0, null
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  br label %if.end

if.else:                                          ; preds = %entry
  call void @__assert_fail(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.1, i64 0, i64 0), i32 23, i8* getelementptr inbounds ([37 x i8], [37 x i8]* @__PRETTY_FUNCTION__.stack_push, i64 0, i64 0)) #4
  unreachable

if.end:                                           ; preds = %if.then
  %1 = load %struct.stack*, %struct.stack** %s.addr, align 8
  %len = getelementptr inbounds %struct.stack, %struct.stack* %1, i32 0, i32 0
  %2 = load i32, i32* %len, align 8
  %3 = load %struct.stack*, %struct.stack** %s.addr, align 8
  %maxlen = getelementptr inbounds %struct.stack, %struct.stack* %3, i32 0, i32 1
  %4 = load i32, i32* %maxlen, align 4
  %cmp = icmp eq i32 %2, %4
  br i1 %cmp, label %if.then1, label %if.end6

if.then1:                                         ; preds = %if.end
  %5 = load %struct.stack*, %struct.stack** %s.addr, align 8
  %maxlen2 = getelementptr inbounds %struct.stack, %struct.stack* %5, i32 0, i32 1
  %6 = load i32, i32* %maxlen2, align 4
  %mul = mul nsw i32 %6, 2
  store i32 %mul, i32* %maxlen2, align 4
  %7 = load %struct.stack*, %struct.stack** %s.addr, align 8
  %data = getelementptr inbounds %struct.stack, %struct.stack* %7, i32 0, i32 2
  %8 = load i32*, i32** %data, align 8
  %9 = bitcast i32* %8 to i8*
  %10 = load %struct.stack*, %struct.stack** %s.addr, align 8
  %maxlen3 = getelementptr inbounds %struct.stack, %struct.stack* %10, i32 0, i32 1
  %11 = load i32, i32* %maxlen3, align 4
  %conv = sext i32 %11 to i64
  %mul4 = mul i64 %conv, 4
  %call = call i8* @realloc(i8* %9, i64 %mul4) #3
  %12 = bitcast i8* %call to i32*
  %13 = load %struct.stack*, %struct.stack** %s.addr, align 8
  %data5 = getelementptr inbounds %struct.stack, %struct.stack* %13, i32 0, i32 2
  store i32* %12, i32** %data5, align 8
  br label %if.end6

if.end6:                                          ; preds = %if.then1, %if.end
  %14 = load i32, i32* %item.addr, align 4
  %15 = load %struct.stack*, %struct.stack** %s.addr, align 8
  %data7 = getelementptr inbounds %struct.stack, %struct.stack* %15, i32 0, i32 2
  %16 = load i32*, i32** %data7, align 8
  %17 = load %struct.stack*, %struct.stack** %s.addr, align 8
  %len8 = getelementptr inbounds %struct.stack, %struct.stack* %17, i32 0, i32 0
  %18 = load i32, i32* %len8, align 8
  %idxprom = sext i32 %18 to i64
  %arrayidx = getelementptr inbounds i32, i32* %16, i64 %idxprom
  store i32 %14, i32* %arrayidx, align 4
  %19 = load %struct.stack*, %struct.stack** %s.addr, align 8
  %len9 = getelementptr inbounds %struct.stack, %struct.stack* %19, i32 0, i32 0
  %20 = load i32, i32* %len9, align 8
  %add = add nsw i32 %20, 1
  store i32 %add, i32* %len9, align 8
  ret void
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #2

; Function Attrs: nounwind
declare i8* @realloc(i8*, i64) #1

; Function Attrs: noinline nounwind optnone
define void @stack_destroy(%struct.stack* %s) #0 {
entry:
  %s.addr = alloca %struct.stack*, align 8
  store %struct.stack* %s, %struct.stack** %s.addr, align 8
  %0 = load %struct.stack*, %struct.stack** %s.addr, align 8
  %data = getelementptr inbounds %struct.stack, %struct.stack* %0, i32 0, i32 2
  %1 = load i32*, i32** %data, align 8
  %2 = bitcast i32* %1 to i8*
  call void @free(i8* %2) #3
  %3 = load %struct.stack*, %struct.stack** %s.addr, align 8
  %4 = bitcast %struct.stack* %3 to i8*
  call void @free(i8* %4) #3
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #1

; Function Attrs: noinline nounwind optnone
define zeroext i1 @stack_is_empty(%struct.stack* %s) #0 {
entry:
  %s.addr = alloca %struct.stack*, align 8
  store %struct.stack* %s, %struct.stack** %s.addr, align 8
  %0 = load %struct.stack*, %struct.stack** %s.addr, align 8
  %tobool = icmp ne %struct.stack* %0, null
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  br label %if.end

if.else:                                          ; preds = %entry
  call void @__assert_fail(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.1, i64 0, i64 0), i32 40, i8* getelementptr inbounds ([43 x i8], [43 x i8]* @__PRETTY_FUNCTION__.stack_is_empty, i64 0, i64 0)) #4
  unreachable

if.end:                                           ; preds = %if.then
  %1 = load %struct.stack*, %struct.stack** %s.addr, align 8
  %len = getelementptr inbounds %struct.stack, %struct.stack* %1, i32 0, i32 0
  %2 = load i32, i32* %len, align 8
  %cmp = icmp eq i32 %2, 0
  ret i1 %cmp
}

; Function Attrs: noinline nounwind optnone
define i32 @stack_top(%struct.stack* %s) #0 {
entry:
  %s.addr = alloca %struct.stack*, align 8
  store %struct.stack* %s, %struct.stack** %s.addr, align 8
  %0 = load %struct.stack*, %struct.stack** %s.addr, align 8
  %tobool = icmp ne %struct.stack* %0, null
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  br label %if.end

if.else:                                          ; preds = %entry
  call void @__assert_fail(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.1, i64 0, i64 0), i32 46, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @__PRETTY_FUNCTION__.stack_top, i64 0, i64 0)) #4
  unreachable

if.end:                                           ; preds = %if.then
  %1 = load %struct.stack*, %struct.stack** %s.addr, align 8
  %len = getelementptr inbounds %struct.stack, %struct.stack* %1, i32 0, i32 0
  %2 = load i32, i32* %len, align 8
  %tobool1 = icmp ne i32 %2, 0
  br i1 %tobool1, label %if.then2, label %if.else3

if.then2:                                         ; preds = %if.end
  br label %if.end4

if.else3:                                         ; preds = %if.end
  call void @__assert_fail(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.1, i64 0, i64 0), i32 47, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @__PRETTY_FUNCTION__.stack_top, i64 0, i64 0)) #4
  unreachable

if.end4:                                          ; preds = %if.then2
  %3 = load %struct.stack*, %struct.stack** %s.addr, align 8
  %data = getelementptr inbounds %struct.stack, %struct.stack* %3, i32 0, i32 2
  %4 = load i32*, i32** %data, align 8
  %5 = load %struct.stack*, %struct.stack** %s.addr, align 8
  %len5 = getelementptr inbounds %struct.stack, %struct.stack* %5, i32 0, i32 0
  %6 = load i32, i32* %len5, align 8
  %sub = sub nsw i32 %6, 1
  %idxprom = sext i32 %sub to i64
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom
  %7 = load i32, i32* %arrayidx, align 4
  ret i32 %7
}

; Function Attrs: noinline nounwind optnone
define i32 @stack_pop(%struct.stack* %s) #0 {
entry:
  %s.addr = alloca %struct.stack*, align 8
  store %struct.stack* %s, %struct.stack** %s.addr, align 8
  %0 = load %struct.stack*, %struct.stack** %s.addr, align 8
  %tobool = icmp ne %struct.stack* %0, null
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  br label %if.end

if.else:                                          ; preds = %entry
  call void @__assert_fail(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.1, i64 0, i64 0), i32 53, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @__PRETTY_FUNCTION__.stack_pop, i64 0, i64 0)) #4
  unreachable

if.end:                                           ; preds = %if.then
  %1 = load %struct.stack*, %struct.stack** %s.addr, align 8
  %len = getelementptr inbounds %struct.stack, %struct.stack* %1, i32 0, i32 0
  %2 = load i32, i32* %len, align 8
  %tobool1 = icmp ne i32 %2, 0
  br i1 %tobool1, label %if.then2, label %if.else3

if.then2:                                         ; preds = %if.end
  br label %if.end4

if.else3:                                         ; preds = %if.end
  call void @__assert_fail(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.1, i64 0, i64 0), i32 54, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @__PRETTY_FUNCTION__.stack_pop, i64 0, i64 0)) #4
  unreachable

if.end4:                                          ; preds = %if.then2
  %3 = load %struct.stack*, %struct.stack** %s.addr, align 8
  %len5 = getelementptr inbounds %struct.stack, %struct.stack* %3, i32 0, i32 0
  %4 = load i32, i32* %len5, align 8
  %sub = sub nsw i32 %4, 1
  store i32 %sub, i32* %len5, align 8
  %5 = load %struct.stack*, %struct.stack** %s.addr, align 8
  %data = getelementptr inbounds %struct.stack, %struct.stack* %5, i32 0, i32 2
  %6 = load i32*, i32** %data, align 8
  %7 = load %struct.stack*, %struct.stack** %s.addr, align 8
  %len6 = getelementptr inbounds %struct.stack, %struct.stack* %7, i32 0, i32 0
  %8 = load i32, i32* %len6, align 8
  %idxprom = sext i32 %8 to i64
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 %idxprom
  %9 = load i32, i32* %arrayidx, align 4
  ret i32 %9
}

attributes #0 = { noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { noreturn nounwind }

!llvm.ident = !{!0}
!llvm.module.flags = !{!1}

!0 = !{!"clang version 9.0.1 (https://github.com/llvm/llvm-project.git c1a0a213378a458fbea1a5c77b315c7dce08fd05)"}
!1 = !{i32 1, !"wchar_size", i32 4}
