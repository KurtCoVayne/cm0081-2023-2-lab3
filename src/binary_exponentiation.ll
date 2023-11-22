; ModuleID = 'binary_exponentiation.c'
source_filename = "binary_exponentiation.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple- cosx14.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define i64 @binary_exponentiation(i64 noundef %0, i64 noundef %1) #0 {
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  store i64 %0, i64* %3, align 8
  store i64 %1, i64* %4, align 8
  store i64 1, i64* %5, align 8
  br label %6

6:                                                ; preds = %18, %2
  %7 = load i64, i64* %4, align 8
  %8 = icmp ne i64 %7, 0
  br i1 %8, label %9, label %24

9:                                                ; preds = %6
  %10 = load i64, i64* %4, align 8
  %11 = and i64 %10, 1
  %12 = icmp ne i64 %11, 0
  br i1 %12, label %13, label %17

13:                                               ; preds = %9
  %14 = load i64, i64* %5, align 8
  %15 = load i64, i64* %3, align 8
  %16 = mul nsw i64 %14, %15
  store i64 %16, i64* %5, align 8
  br label %17

17:                                               ; preds = %13, %9
  br label %18

18:                                               ; preds = %17
  %19 = load i64, i64* %3, align 8
  %20 = load i64, i64* %3, align 8
  %21 = mul nsw i64 %19, %20
  store i64 %21, i64* %3, align 8
  %22 = load i64, i64* %4, align 8
  %23 = ashr i64 %22, 1
  store i64 %23, i64* %4, align 8
  br label %6

24:                                               ; preds = %6
  %25 = load i64, i64* %5, align 8
  ret i64 %25
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

; ASSERT EQ: i64 1 = call i64 @binary_exponentiation(i64 2, i64 0)
; ASSERT EQ: i64 2 = call i64 @binary_exponentiation(i64 2, i64 1)
; ASSERT EQ: i64 8589934592 = call i64 @binary_exponentiation(i64 2, i64 33)
; ASSERT EQ: i64 4294967296 = call i64 @binary_exponentiation(i64 2, i64 32)
; ASSERT EQ: i64 2147483648 = call i64 @binary_exponentiation(i64 2, i64 31)
