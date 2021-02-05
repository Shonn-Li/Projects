; ModuleID = 'seashell-compiler-output'
source_filename = "seashell-compiler-output"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.image = type opaque

@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [25 x i8] c"scanf(\22%d\22, &width) == 1\00", align 1
@.str.2 = private unnamed_addr constant [55 x i8] c"/u1/dtompkins/.seashell/projects/_A4/common/image-io.c\00", align 1
@__PRETTY_FUNCTION__.image_load_from_input = private unnamed_addr constant [42 x i8] c"struct image *image_load_from_input(void)\00", align 1
@.str.3 = private unnamed_addr constant [10 x i8] c"width > 0\00", align 1
@.str.4 = private unnamed_addr constant [26 x i8] c"scanf(\22%d\22, &height) == 1\00", align 1
@.str.5 = private unnamed_addr constant [11 x i8] c"height > 0\00", align 1
@BLACK = external constant i32, align 4
@.str.6 = private unnamed_addr constant [25 x i8] c"scanf(\22%d\22, &pixel) == 1\00", align 1
@WHITE = external constant i32, align 4
@.str.7 = private unnamed_addr constant [33 x i8] c"BLACK <= pixel && pixel <= WHITE\00", align 1
@.str.8 = private unnamed_addr constant [4 x i8] c"img\00", align 1
@__PRETTY_FUNCTION__.image_print = private unnamed_addr constant [39 x i8] c"void image_print(const struct image *)\00", align 1
@.str.9 = private unnamed_addr constant [7 x i8] c"%d %d\0A\00", align 1
@.str.10 = private unnamed_addr constant [2 x i8] c" \00", align 1
@.str.11 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline nounwind optnone
define %struct.image* @image_load_from_input() #0 {
entry:
  %width = alloca i32, align 4
  %height = alloca i32, align 4
  %pixel = alloca i32, align 4
  %img = alloca %struct.image*, align 8
  %y = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 0, i32* %width, align 4
  store i32 0, i32* %height, align 4
  store i32 0, i32* %pixel, align 4
  %call = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %width)
  %cmp = icmp eq i32 %call, 1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  br label %if.end

if.else:                                          ; preds = %entry
  call void @__assert_fail(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.1, i64 0, i64 0), i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.str.2, i64 0, i64 0), i32 9, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @__PRETTY_FUNCTION__.image_load_from_input, i64 0, i64 0)) #3
  unreachable

if.end:                                           ; preds = %if.then
  %0 = load i32, i32* %width, align 4
  %cmp1 = icmp sgt i32 %0, 0
  br i1 %cmp1, label %if.then2, label %if.else3

if.then2:                                         ; preds = %if.end
  br label %if.end4

if.else3:                                         ; preds = %if.end
  call void @__assert_fail(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.str.2, i64 0, i64 0), i32 10, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @__PRETTY_FUNCTION__.image_load_from_input, i64 0, i64 0)) #3
  unreachable

if.end4:                                          ; preds = %if.then2
  %call5 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %height)
  %cmp6 = icmp eq i32 %call5, 1
  br i1 %cmp6, label %if.then7, label %if.else8

if.then7:                                         ; preds = %if.end4
  br label %if.end9

if.else8:                                         ; preds = %if.end4
  call void @__assert_fail(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.4, i64 0, i64 0), i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.str.2, i64 0, i64 0), i32 11, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @__PRETTY_FUNCTION__.image_load_from_input, i64 0, i64 0)) #3
  unreachable

if.end9:                                          ; preds = %if.then7
  %1 = load i32, i32* %height, align 4
  %cmp10 = icmp sgt i32 %1, 0
  br i1 %cmp10, label %if.then11, label %if.else12

if.then11:                                        ; preds = %if.end9
  br label %if.end13

if.else12:                                        ; preds = %if.end9
  call void @__assert_fail(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.5, i64 0, i64 0), i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.str.2, i64 0, i64 0), i32 12, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @__PRETTY_FUNCTION__.image_load_from_input, i64 0, i64 0)) #3
  unreachable

if.end13:                                         ; preds = %if.then11
  %2 = load i32, i32* %width, align 4
  %3 = load i32, i32* %height, align 4
  %4 = load i32, i32* @BLACK, align 4
  %call14 = call %struct.image* @image_create(i32 %2, i32 %3, i32 %4)
  store %struct.image* %call14, %struct.image** %img, align 8
  store i32 0, i32* %y, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc29, %if.end13
  %5 = load i32, i32* %y, align 4
  %6 = load i32, i32* %height, align 4
  %cmp15 = icmp slt i32 %5, %6
  br i1 %cmp15, label %for.body, label %for.end31

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %x, align 4
  br label %for.cond16

for.cond16:                                       ; preds = %for.inc, %for.body
  %7 = load i32, i32* %x, align 4
  %8 = load i32, i32* %width, align 4
  %cmp17 = icmp slt i32 %7, %8
  br i1 %cmp17, label %for.body18, label %for.end

for.body18:                                       ; preds = %for.cond16
  %call19 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %pixel)
  %cmp20 = icmp eq i32 %call19, 1
  br i1 %cmp20, label %if.then21, label %if.else22

if.then21:                                        ; preds = %for.body18
  br label %if.end23

if.else22:                                        ; preds = %for.body18
  call void @__assert_fail(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.str.2, i64 0, i64 0), i32 16, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @__PRETTY_FUNCTION__.image_load_from_input, i64 0, i64 0)) #3
  unreachable

if.end23:                                         ; preds = %if.then21
  %9 = load i32, i32* @BLACK, align 4
  %10 = load i32, i32* %pixel, align 4
  %cmp24 = icmp sle i32 %9, %10
  br i1 %cmp24, label %land.lhs.true, label %if.else27

land.lhs.true:                                    ; preds = %if.end23
  %11 = load i32, i32* %pixel, align 4
  %12 = load i32, i32* @WHITE, align 4
  %cmp25 = icmp sle i32 %11, %12
  br i1 %cmp25, label %if.then26, label %if.else27

if.then26:                                        ; preds = %land.lhs.true
  br label %if.end28

if.else27:                                        ; preds = %land.lhs.true, %if.end23
  call void @__assert_fail(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.7, i64 0, i64 0), i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.str.2, i64 0, i64 0), i32 17, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @__PRETTY_FUNCTION__.image_load_from_input, i64 0, i64 0)) #3
  unreachable

if.end28:                                         ; preds = %if.then26
  %13 = load %struct.image*, %struct.image** %img, align 8
  %14 = load i32, i32* %x, align 4
  %15 = load i32, i32* %y, align 4
  %16 = load i32, i32* %pixel, align 4
  call void @image_set_pixel(%struct.image* %13, i32 %14, i32 %15, i32 %16)
  br label %for.inc

for.inc:                                          ; preds = %if.end28
  %17 = load i32, i32* %x, align 4
  %inc = add nsw i32 %17, 1
  store i32 %inc, i32* %x, align 4
  br label %for.cond16

for.end:                                          ; preds = %for.cond16
  br label %for.inc29

for.inc29:                                        ; preds = %for.end
  %18 = load i32, i32* %y, align 4
  %inc30 = add nsw i32 %18, 1
  store i32 %inc30, i32* %y, align 4
  br label %for.cond

for.end31:                                        ; preds = %for.cond
  %19 = load %struct.image*, %struct.image** %img, align 8
  ret %struct.image* %19
}

declare i32 @__isoc99_scanf(i8*, ...) #1

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #2

declare %struct.image* @image_create(i32, i32, i32) #1

declare void @image_set_pixel(%struct.image*, i32, i32, i32) #1

; Function Attrs: noinline nounwind optnone
define void @image_print(%struct.image* %img) #0 {
entry:
  %img.addr = alloca %struct.image*, align 8
  %width = alloca i32, align 4
  %height = alloca i32, align 4
  %y = alloca i32, align 4
  %x = alloca i32, align 4
  store %struct.image* %img, %struct.image** %img.addr, align 8
  %0 = load %struct.image*, %struct.image** %img.addr, align 8
  %tobool = icmp ne %struct.image* %0, null
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  br label %if.end

if.else:                                          ; preds = %entry
  call void @__assert_fail(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.8, i64 0, i64 0), i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.str.2, i64 0, i64 0), i32 25, i8* getelementptr inbounds ([39 x i8], [39 x i8]* @__PRETTY_FUNCTION__.image_print, i64 0, i64 0)) #3
  unreachable

if.end:                                           ; preds = %if.then
  %1 = load %struct.image*, %struct.image** %img.addr, align 8
  %call = call i32 @image_get_width(%struct.image* %1)
  store i32 %call, i32* %width, align 4
  %2 = load %struct.image*, %struct.image** %img.addr, align 8
  %call1 = call i32 @image_get_height(%struct.image* %2)
  store i32 %call1, i32* %height, align 4
  %3 = load i32, i32* %width, align 4
  %4 = load i32, i32* %height, align 4
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.9, i64 0, i64 0), i32 %3, i32 %4)
  store i32 0, i32* %y, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc13, %if.end
  %5 = load i32, i32* %y, align 4
  %6 = load i32, i32* %height, align 4
  %cmp = icmp slt i32 %5, %6
  br i1 %cmp, label %for.body, label %for.end15

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %x, align 4
  br label %for.cond3

for.cond3:                                        ; preds = %for.inc, %for.body
  %7 = load i32, i32* %x, align 4
  %8 = load i32, i32* %width, align 4
  %cmp4 = icmp slt i32 %7, %8
  br i1 %cmp4, label %for.body5, label %for.end

for.body5:                                        ; preds = %for.cond3
  %9 = load i32, i32* %x, align 4
  %tobool6 = icmp ne i32 %9, 0
  br i1 %tobool6, label %if.then7, label %if.end9

if.then7:                                         ; preds = %for.body5
  %call8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.10, i64 0, i64 0))
  br label %if.end9

if.end9:                                          ; preds = %if.then7, %for.body5
  %10 = load %struct.image*, %struct.image** %img.addr, align 8
  %11 = load i32, i32* %x, align 4
  %12 = load i32, i32* %y, align 4
  %call10 = call i32 @image_get_pixel(%struct.image* %10, i32 %11, i32 %12)
  %call11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 %call10)
  br label %for.inc

for.inc:                                          ; preds = %if.end9
  %13 = load i32, i32* %x, align 4
  %inc = add nsw i32 %13, 1
  store i32 %inc, i32* %x, align 4
  br label %for.cond3

for.end:                                          ; preds = %for.cond3
  %call12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.11, i64 0, i64 0))
  br label %for.inc13

for.inc13:                                        ; preds = %for.end
  %14 = load i32, i32* %y, align 4
  %inc14 = add nsw i32 %14, 1
  store i32 %inc14, i32* %y, align 4
  br label %for.cond

for.end15:                                        ; preds = %for.cond
  ret void
}

declare i32 @image_get_width(%struct.image*) #1

declare i32 @image_get_height(%struct.image*) #1

declare i32 @printf(i8*, ...) #1

declare i32 @image_get_pixel(%struct.image*, i32, i32) #1

attributes #0 = { noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}
!llvm.module.flags = !{!1}

!0 = !{!"clang version 9.0.1 (https://github.com/llvm/llvm-project.git c1a0a213378a458fbea1a5c77b315c7dce08fd05)"}
!1 = !{i32 1, !"wchar_size", i32 4}
