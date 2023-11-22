; ModuleID = 'linear_diophantine.c'
source_filename = "linear_diophantine.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx14.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @gcd(i32 noundef %0, i32 noundef %1, i32* noundef %2, i32* noundef %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32*, align 8
  %9 = alloca i32*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store i32 %0, i32* %6, align 4
  store i32 %1, i32* %7, align 4
  store i32* %2, i32** %8, align 8
  store i32* %3, i32** %9, align 8
  %13 = load i32, i32* %7, align 4
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %19

15:                                               ; preds = %4
  %16 = load i32*, i32** %8, align 8
  store i32 1, i32* %16, align 4
  %17 = load i32*, i32** %9, align 8
  store i32 0, i32* %17, align 4
  %18 = load i32, i32* %6, align 4
  store i32 %18, i32* %5, align 4
  br label %36

19:                                               ; preds = %4
  %20 = load i32, i32* %7, align 4
  %21 = load i32, i32* %6, align 4
  %22 = load i32, i32* %7, align 4
  %23 = srem i32 %21, %22
  %24 = call i32 @gcd(i32 %20, i32 %23, i32* %10, i32* %11)
  store i32 %24, i32* %12, align 4
  %25 = load i32, i32* %11, align 4
  %26 = load i32*, i32** %8, align 8
  store i32 %25, i32* %26, align 4
  %27 = load i32, i32* %10, align 4
  %28 = load i32, i32* %11, align 4
  %29 = load i32, i32* %6, align 4
  %30 = load i32, i32* %7, align 4
  %31 = sdiv i32 %29, %30
  %32 = mul nsw i32 %28, %31
  %33 = sub nsw i32 %27, %32
  %34 = load i32*, i32** %9, align 8
  store i32 %33, i32* %34, align 4
  %35 = load i32, i32* %12, align 4
  store i32 %35, i32* %5, align 4
  br label %36

36:                                               ; preds = %19, %15
  %37 = load i32, i32* %5, align 4
  ret i32 %37
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @find_any_solution(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32* noundef %3, i32* noundef %4, i32* noundef %5) #0 {
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32*, align 8
  %12 = alloca i32*, align 8
  %13 = alloca i32*, align 8
  store i32 %0, i32* %8, align 4
  store i32 %1, i32* %9, align 4
  store i32 %2, i32* %10, align 4
  store i32* %3, i32** %11, align 8
  store i32* %4, i32** %12, align 8
  store i32* %5, i32** %13, align 8
  %14 = load i32, i32* %8, align 4
  %15 = load i32, i32* %9, align 4
  %16 = load i32*, i32** %11, align 8
  %17 = load i32*, i32** %12, align 8
  %18 = call i32 @gcd(i32 %14, i32 %15, i32* %16, i32* %17)
  %19 = load i32*, i32** %13, align 8
  store i32 %18, i32* %19, align 4
  %20 = load i32, i32* %10, align 4
  %21 = load i32*, i32** %13, align 8
  %22 = load i32, i32* %21, align 4
  %23 = srem i32 %20, %22
  %24 = icmp ne i32 %23, 0
  br i1 %24, label %25, label %26

25:                                               ; preds = %6
  store i32 0, i32* %7, align 4
  br label %57

26:                                               ; preds = %6
  %27 = load i32, i32* %10, align 4
  %28 = load i32*, i32** %13, align 8
  %29 = load i32, i32* %28, align 4
  %30 = sdiv i32 %27, %29
  %31 = load i32*, i32** %11, align 8
  %32 = load i32, i32* %31, align 4
  %33 = mul nsw i32 %32, %30
  store i32 %33, i32* %31, align 4
  %34 = load i32, i32* %10, align 4
  %35 = load i32*, i32** %13, align 8
  %36 = load i32, i32* %35, align 4
  %37 = sdiv i32 %34, %36
  %38 = load i32*, i32** %12, align 8
  %39 = load i32, i32* %38, align 4
  %40 = mul nsw i32 %39, %37
  store i32 %40, i32* %38, align 4
  %41 = load i32, i32* %8, align 4
  %42 = icmp slt i32 %41, 0
  br i1 %42, label %43, label %48

43:                                               ; preds = %26
  %44 = load i32*, i32** %11, align 8
  %45 = load i32, i32* %44, align 4
  %46 = sub nsw i32 0, %45
  %47 = load i32*, i32** %11, align 8
  store i32 %46, i32* %47, align 4
  br label %48

48:                                               ; preds = %43, %26
  %49 = load i32, i32* %9, align 4
  %50 = icmp slt i32 %49, 0
  br i1 %50, label %51, label %56

51:                                               ; preds = %48
  %52 = load i32*, i32** %12, align 8
  %53 = load i32, i32* %52, align 4
  %54 = sub nsw i32 0, %53
  %55 = load i32*, i32** %12, align 8
  store i32 %54, i32* %55, align 4
  br label %56

56:                                               ; preds = %51, %48
  store i32 1, i32* %7, align 4
  br label %57

57:                                               ; preds = %56, %25
  %58 = load i32, i32* %7, align 4
  ret i32 %58
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="non-leaf" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.5a,+zcm,+zcz" }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 14, i32 0]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 1, !"branch-target-enforcement", i32 0}
!3 = !{i32 1, !"sign-return-address", i32 0}
!4 = !{i32 1, !"sign-return-address-all", i32 0}
!5 = !{i32 1, !"sign-return-address-with-bkey", i32 0}
!6 = !{i32 7, !"PIC Level", i32 2}
!7 = !{i32 7, !"uwtable", i32 1}
!8 = !{i32 7, !"frame-pointer", i32 1}
!9 = !{!"clang version 14.0.6"}


; ASSERT EQ: i32 1 = call i32 @gcd(i32 1, i32 0, i32* null, i32* null)
; ASSERT EQ: i32 1 = call i32 @gcd(i32 0, i32 1, i32* null, i32* null)
; ASSERT EQ: i32 3 = call i32 @gcd(i32 3, i32 6, i32* null, i32* null)
; ASSERT EQ: i32 3 = call i32 @gcd(i32 15, i32 3, i32* null, i32* null)
; ASSERT EQ: i32 1 = call i32 @gcd(i32 15, i32 7, i32* null, i32* null)
; ASSERT EQ: i32 1 = call i32 @gcd(i32 7, i32 15, i32* null, i32* null)
; ASSERT EQ: i32 2 = call i32 @gcd(i32 2, i32 6, i32* null, i32* null)
; ASSERT EQ: i32 2 = call i32 @gcd(i32 32, i32 14, i32* null, i32* null)

; ASSERT EQ: i32 1 = call i32 @find_any_solution(i32 1, i32 0, i32 1, i32* null, i32* null, i32* null)
; ASSERT EQ: i32 0 = call i32 @find_any_solution(i32 2, i32 2, i32 3, i32* null, i32* null, i32* null)
; ASSERT EQ: i32 1 = call i32 @find_any_solution(i32 3, i32 6, i32 3, i32* null, i32* null, i32* null)
; ASSERT EQ: i32 1 = call i32 @find_any_solution(i32 15, i32 3, i32 3, i32* null, i32* null, i32* null)
; ASSERT EQ: i32 1 = call i32 @find_any_solution(i32 15, i32 7, i32 3, i32* null, i32* null, i32* null)

