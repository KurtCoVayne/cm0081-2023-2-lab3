; ModuleID = 'fft.c'
source_filename = "fft.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx14.0.0"

@PI = constant double 0x400921FB54442D18, align 8

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @fft(ptr noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca double, align 8
  %11 = alloca { double, double }, align 8
  %12 = alloca { double, double }, align 8
  %13 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  %14 = load i32, ptr %5, align 4
  %15 = icmp eq i32 %14, 1
  br i1 %15, label %16, label %17

16:                                               ; preds = %3
  br label %257

17:                                               ; preds = %3
  %18 = load i32, ptr %5, align 4
  %19 = sdiv i32 %18, 2
  %20 = sext i32 %19 to i64
  %21 = mul i64 %20, 16
  %22 = call ptr @malloc(i64 %21) #4
  store ptr %22, ptr %7, align 8
  %23 = load i32, ptr %5, align 4
  %24 = sdiv i32 %23, 2
  %25 = sext i32 %24 to i64
  %26 = mul i64 %25, 16
  %27 = call ptr @malloc(i64 %26) #4
  store ptr %27, ptr %8, align 8
  store i32 0, ptr %9, align 4
  br label %28

28:                                               ; preds = %65, %17
  %29 = load i32, ptr %9, align 4
  %30 = mul nsw i32 2, %29
  %31 = load i32, ptr %5, align 4
  %32 = icmp slt i32 %30, %31
  br i1 %32, label %33, label %68

33:                                               ; preds = %28
  %34 = load ptr, ptr %4, align 8
  %35 = load i32, ptr %9, align 4
  %36 = mul nsw i32 2, %35
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds { double, double }, ptr %34, i64 %37
  %39 = getelementptr inbounds { double, double }, ptr %38, i32 0, i32 0
  %40 = load double, ptr %39, align 8
  %41 = getelementptr inbounds { double, double }, ptr %38, i32 0, i32 1
  %42 = load double, ptr %41, align 8
  %43 = load ptr, ptr %7, align 8
  %44 = load i32, ptr %9, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds { double, double }, ptr %43, i64 %45
  %47 = getelementptr inbounds { double, double }, ptr %46, i32 0, i32 0
  %48 = getelementptr inbounds { double, double }, ptr %46, i32 0, i32 1
  store double %40, ptr %47, align 8
  store double %42, ptr %48, align 8
  %49 = load ptr, ptr %4, align 8
  %50 = load i32, ptr %9, align 4
  %51 = mul nsw i32 2, %50
  %52 = add nsw i32 %51, 1
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds { double, double }, ptr %49, i64 %53
  %55 = getelementptr inbounds { double, double }, ptr %54, i32 0, i32 0
  %56 = load double, ptr %55, align 8
  %57 = getelementptr inbounds { double, double }, ptr %54, i32 0, i32 1
  %58 = load double, ptr %57, align 8
  %59 = load ptr, ptr %8, align 8
  %60 = load i32, ptr %9, align 4
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds { double, double }, ptr %59, i64 %61
  %63 = getelementptr inbounds { double, double }, ptr %62, i32 0, i32 0
  %64 = getelementptr inbounds { double, double }, ptr %62, i32 0, i32 1
  store double %56, ptr %63, align 8
  store double %58, ptr %64, align 8
  br label %65

65:                                               ; preds = %33
  %66 = load i32, ptr %9, align 4
  %67 = add nsw i32 %66, 1
  store i32 %67, ptr %9, align 4
  br label %28, !llvm.loop !6

68:                                               ; preds = %28
  %69 = load ptr, ptr %7, align 8
  %70 = load i32, ptr %5, align 4
  %71 = sdiv i32 %70, 2
  %72 = load i32, ptr %6, align 4
  call void @fft(ptr %69, i32 %71, i32 %72)
  %73 = load ptr, ptr %8, align 8
  %74 = load i32, ptr %5, align 4
  %75 = sdiv i32 %74, 2
  %76 = load i32, ptr %6, align 4
  call void @fft(ptr %73, i32 %75, i32 %76)
  %77 = load i32, ptr %5, align 4
  %78 = sitofp i32 %77 to double
  %79 = fdiv double 0x401921FB54442D18, %78
  %80 = load i32, ptr %6, align 4
  %81 = icmp ne i32 %80, 0
  %82 = zext i1 %81 to i64
  %83 = select i1 %81, i32 -1, i32 1
  %84 = sitofp i32 %83 to double
  %85 = fmul double %79, %84
  store double %85, ptr %10, align 8
  %86 = getelementptr inbounds { double, double }, ptr %11, i32 0, i32 0
  %87 = getelementptr inbounds { double, double }, ptr %11, i32 0, i32 1
  store double 1.000000e+00, ptr %86, align 8
  store double 0.000000e+00, ptr %87, align 8
  %88 = load double, ptr %10, align 8
  %89 = call double @llvm.cos.f64(double %88)
  %90 = load double, ptr %10, align 8
  %91 = call double @llvm.sin.f64(double %90)
  %92 = fmul double %91, 0.000000e+00
  %93 = fmul double %91, 1.000000e+00
  %94 = fadd double %89, %92
  %95 = getelementptr inbounds { double, double }, ptr %12, i32 0, i32 0
  %96 = getelementptr inbounds { double, double }, ptr %12, i32 0, i32 1
  store double %94, ptr %95, align 8
  store double %93, ptr %96, align 8
  store i32 0, ptr %13, align 4
  br label %97

97:                                               ; preds = %251, %68
  %98 = load i32, ptr %13, align 4
  %99 = mul nsw i32 2, %98
  %100 = load i32, ptr %5, align 4
  %101 = icmp slt i32 %99, %100
  br i1 %101, label %102, label %254

102:                                              ; preds = %97
  %103 = load ptr, ptr %7, align 8
  %104 = load i32, ptr %13, align 4
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds { double, double }, ptr %103, i64 %105
  %107 = getelementptr inbounds { double, double }, ptr %106, i32 0, i32 0
  %108 = load double, ptr %107, align 8
  %109 = getelementptr inbounds { double, double }, ptr %106, i32 0, i32 1
  %110 = load double, ptr %109, align 8
  %111 = getelementptr inbounds { double, double }, ptr %11, i32 0, i32 0
  %112 = load double, ptr %111, align 8
  %113 = getelementptr inbounds { double, double }, ptr %11, i32 0, i32 1
  %114 = load double, ptr %113, align 8
  %115 = load ptr, ptr %8, align 8
  %116 = load i32, ptr %13, align 4
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds { double, double }, ptr %115, i64 %117
  %119 = getelementptr inbounds { double, double }, ptr %118, i32 0, i32 0
  %120 = load double, ptr %119, align 8
  %121 = getelementptr inbounds { double, double }, ptr %118, i32 0, i32 1
  %122 = load double, ptr %121, align 8
  %123 = fmul double %112, %120
  %124 = fmul double %114, %122
  %125 = fmul double %112, %122
  %126 = fmul double %114, %120
  %127 = fsub double %123, %124
  %128 = fadd double %125, %126
  %129 = fcmp uno double %127, %127
  br i1 %129, label %130, label %136, !prof !8

130:                                              ; preds = %102
  %131 = fcmp uno double %128, %128
  br i1 %131, label %132, label %136, !prof !8

132:                                              ; preds = %130
  %133 = call { double, double } @__muldc3(double %112, double %114, double %120, double %122) #5
  %134 = extractvalue { double, double } %133, 0
  %135 = extractvalue { double, double } %133, 1
  br label %136

136:                                              ; preds = %132, %130, %102
  %137 = phi double [ %127, %102 ], [ %127, %130 ], [ %134, %132 ]
  %138 = phi double [ %128, %102 ], [ %128, %130 ], [ %135, %132 ]
  %139 = fadd double %108, %137
  %140 = fadd double %110, %138
  %141 = load ptr, ptr %4, align 8
  %142 = load i32, ptr %13, align 4
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds { double, double }, ptr %141, i64 %143
  %145 = getelementptr inbounds { double, double }, ptr %144, i32 0, i32 0
  %146 = getelementptr inbounds { double, double }, ptr %144, i32 0, i32 1
  store double %139, ptr %145, align 8
  store double %140, ptr %146, align 8
  %147 = load ptr, ptr %7, align 8
  %148 = load i32, ptr %13, align 4
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds { double, double }, ptr %147, i64 %149
  %151 = getelementptr inbounds { double, double }, ptr %150, i32 0, i32 0
  %152 = load double, ptr %151, align 8
  %153 = getelementptr inbounds { double, double }, ptr %150, i32 0, i32 1
  %154 = load double, ptr %153, align 8
  %155 = getelementptr inbounds { double, double }, ptr %11, i32 0, i32 0
  %156 = load double, ptr %155, align 8
  %157 = getelementptr inbounds { double, double }, ptr %11, i32 0, i32 1
  %158 = load double, ptr %157, align 8
  %159 = load ptr, ptr %8, align 8
  %160 = load i32, ptr %13, align 4
  %161 = sext i32 %160 to i64
  %162 = getelementptr inbounds { double, double }, ptr %159, i64 %161
  %163 = getelementptr inbounds { double, double }, ptr %162, i32 0, i32 0
  %164 = load double, ptr %163, align 8
  %165 = getelementptr inbounds { double, double }, ptr %162, i32 0, i32 1
  %166 = load double, ptr %165, align 8
  %167 = fmul double %156, %164
  %168 = fmul double %158, %166
  %169 = fmul double %156, %166
  %170 = fmul double %158, %164
  %171 = fsub double %167, %168
  %172 = fadd double %169, %170
  %173 = fcmp uno double %171, %171
  br i1 %173, label %174, label %180, !prof !8

174:                                              ; preds = %136
  %175 = fcmp uno double %172, %172
  br i1 %175, label %176, label %180, !prof !8

176:                                              ; preds = %174
  %177 = call { double, double } @__muldc3(double %156, double %158, double %164, double %166) #5
  %178 = extractvalue { double, double } %177, 0
  %179 = extractvalue { double, double } %177, 1
  br label %180

180:                                              ; preds = %176, %174, %136
  %181 = phi double [ %171, %136 ], [ %171, %174 ], [ %178, %176 ]
  %182 = phi double [ %172, %136 ], [ %172, %174 ], [ %179, %176 ]
  %183 = fsub double %152, %181
  %184 = fsub double %154, %182
  %185 = load ptr, ptr %4, align 8
  %186 = load i32, ptr %13, align 4
  %187 = load i32, ptr %5, align 4
  %188 = sdiv i32 %187, 2
  %189 = add nsw i32 %186, %188
  %190 = sext i32 %189 to i64
  %191 = getelementptr inbounds { double, double }, ptr %185, i64 %190
  %192 = getelementptr inbounds { double, double }, ptr %191, i32 0, i32 0
  %193 = getelementptr inbounds { double, double }, ptr %191, i32 0, i32 1
  store double %183, ptr %192, align 8
  store double %184, ptr %193, align 8
  %194 = load i32, ptr %6, align 4
  %195 = icmp ne i32 %194, 0
  br i1 %195, label %196, label %224

196:                                              ; preds = %180
  %197 = load ptr, ptr %4, align 8
  %198 = load i32, ptr %13, align 4
  %199 = sext i32 %198 to i64
  %200 = getelementptr inbounds { double, double }, ptr %197, i64 %199
  %201 = getelementptr inbounds { double, double }, ptr %200, i32 0, i32 0
  %202 = load double, ptr %201, align 8
  %203 = getelementptr inbounds { double, double }, ptr %200, i32 0, i32 1
  %204 = load double, ptr %203, align 8
  %205 = fdiv double %202, 2.000000e+00
  %206 = fdiv double %204, 2.000000e+00
  %207 = getelementptr inbounds { double, double }, ptr %200, i32 0, i32 0
  %208 = getelementptr inbounds { double, double }, ptr %200, i32 0, i32 1
  store double %205, ptr %207, align 8
  store double %206, ptr %208, align 8
  %209 = load ptr, ptr %4, align 8
  %210 = load i32, ptr %13, align 4
  %211 = load i32, ptr %5, align 4
  %212 = sdiv i32 %211, 2
  %213 = add nsw i32 %210, %212
  %214 = sext i32 %213 to i64
  %215 = getelementptr inbounds { double, double }, ptr %209, i64 %214
  %216 = getelementptr inbounds { double, double }, ptr %215, i32 0, i32 0
  %217 = load double, ptr %216, align 8
  %218 = getelementptr inbounds { double, double }, ptr %215, i32 0, i32 1
  %219 = load double, ptr %218, align 8
  %220 = fdiv double %217, 2.000000e+00
  %221 = fdiv double %219, 2.000000e+00
  %222 = getelementptr inbounds { double, double }, ptr %215, i32 0, i32 0
  %223 = getelementptr inbounds { double, double }, ptr %215, i32 0, i32 1
  store double %220, ptr %222, align 8
  store double %221, ptr %223, align 8
  br label %224

224:                                              ; preds = %196, %180
  %225 = getelementptr inbounds { double, double }, ptr %12, i32 0, i32 0
  %226 = load double, ptr %225, align 8
  %227 = getelementptr inbounds { double, double }, ptr %12, i32 0, i32 1
  %228 = load double, ptr %227, align 8
  %229 = getelementptr inbounds { double, double }, ptr %11, i32 0, i32 0
  %230 = load double, ptr %229, align 8
  %231 = getelementptr inbounds { double, double }, ptr %11, i32 0, i32 1
  %232 = load double, ptr %231, align 8
  %233 = fmul double %230, %226
  %234 = fmul double %232, %228
  %235 = fmul double %230, %228
  %236 = fmul double %232, %226
  %237 = fsub double %233, %234
  %238 = fadd double %235, %236
  %239 = fcmp uno double %237, %237
  br i1 %239, label %240, label %246, !prof !8

240:                                              ; preds = %224
  %241 = fcmp uno double %238, %238
  br i1 %241, label %242, label %246, !prof !8

242:                                              ; preds = %240
  %243 = call { double, double } @__muldc3(double %230, double %232, double %226, double %228) #5
  %244 = extractvalue { double, double } %243, 0
  %245 = extractvalue { double, double } %243, 1
  br label %246

246:                                              ; preds = %242, %240, %224
  %247 = phi double [ %237, %224 ], [ %237, %240 ], [ %244, %242 ]
  %248 = phi double [ %238, %224 ], [ %238, %240 ], [ %245, %242 ]
  %249 = getelementptr inbounds { double, double }, ptr %11, i32 0, i32 0
  %250 = getelementptr inbounds { double, double }, ptr %11, i32 0, i32 1
  store double %247, ptr %249, align 8
  store double %248, ptr %250, align 8
  br label %251

251:                                              ; preds = %246
  %252 = load i32, ptr %13, align 4
  %253 = add nsw i32 %252, 1
  store i32 %253, ptr %13, align 4
  br label %97, !llvm.loop !9

254:                                              ; preds = %97
  %255 = load ptr, ptr %7, align 8
  call void @free(ptr %255)
  %256 = load ptr, ptr %8, align 8
  call void @free(ptr %256)
  br label %257

257:                                              ; preds = %254, %16
  ret void
}

; Function Attrs: allocsize(0)
declare ptr @malloc(i64 noundef) #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.cos.f64(double) #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.sin.f64(double) #2

declare { double, double } @__muldc3(double, double, double, double)

declare void @free(ptr noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @multiply(ptr noundef %0, ptr noundef %1, i32 noundef %2, i32 noundef %3, ptr noundef %4) #0 {
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  store ptr %0, ptr %6, align 8
  store ptr %1, ptr %7, align 8
  store i32 %2, ptr %8, align 4
  store i32 %3, ptr %9, align 4
  store ptr %4, ptr %10, align 8
  %17 = load i32, ptr %9, align 4
  %18 = sext i32 %17 to i64
  %19 = mul i64 %18, 16
  %20 = call ptr @malloc(i64 %19) #4
  store ptr %20, ptr %11, align 8
  %21 = load i32, ptr %9, align 4
  %22 = sext i32 %21 to i64
  %23 = mul i64 %22, 16
  %24 = call ptr @malloc(i64 %23) #4
  store ptr %24, ptr %12, align 8
  store i32 0, ptr %13, align 4
  br label %25

25:                                               ; preds = %54, %5
  %26 = load i32, ptr %13, align 4
  %27 = load i32, ptr %8, align 4
  %28 = icmp slt i32 %26, %27
  br i1 %28, label %29, label %57

29:                                               ; preds = %25
  %30 = load ptr, ptr %6, align 8
  %31 = load i32, ptr %13, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds i32, ptr %30, i64 %32
  %34 = load i32, ptr %33, align 4
  %35 = sitofp i32 %34 to double
  %36 = load ptr, ptr %11, align 8
  %37 = load i32, ptr %13, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds { double, double }, ptr %36, i64 %38
  %40 = getelementptr inbounds { double, double }, ptr %39, i32 0, i32 0
  %41 = getelementptr inbounds { double, double }, ptr %39, i32 0, i32 1
  store double %35, ptr %40, align 8
  store double 0.000000e+00, ptr %41, align 8
  %42 = load ptr, ptr %7, align 8
  %43 = load i32, ptr %13, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds i32, ptr %42, i64 %44
  %46 = load i32, ptr %45, align 4
  %47 = sitofp i32 %46 to double
  %48 = load ptr, ptr %12, align 8
  %49 = load i32, ptr %13, align 4
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds { double, double }, ptr %48, i64 %50
  %52 = getelementptr inbounds { double, double }, ptr %51, i32 0, i32 0
  %53 = getelementptr inbounds { double, double }, ptr %51, i32 0, i32 1
  store double %47, ptr %52, align 8
  store double 0.000000e+00, ptr %53, align 8
  br label %54

54:                                               ; preds = %29
  %55 = load i32, ptr %13, align 4
  %56 = add nsw i32 %55, 1
  store i32 %56, ptr %13, align 4
  br label %25, !llvm.loop !10

57:                                               ; preds = %25
  %58 = load i32, ptr %8, align 4
  store i32 %58, ptr %14, align 4
  br label %59

59:                                               ; preds = %76, %57
  %60 = load i32, ptr %14, align 4
  %61 = load i32, ptr %9, align 4
  %62 = icmp slt i32 %60, %61
  br i1 %62, label %63, label %79

63:                                               ; preds = %59
  %64 = load ptr, ptr %11, align 8
  %65 = load i32, ptr %14, align 4
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds { double, double }, ptr %64, i64 %66
  %68 = getelementptr inbounds { double, double }, ptr %67, i32 0, i32 0
  %69 = getelementptr inbounds { double, double }, ptr %67, i32 0, i32 1
  store double 0.000000e+00, ptr %68, align 8
  store double 0.000000e+00, ptr %69, align 8
  %70 = load ptr, ptr %12, align 8
  %71 = load i32, ptr %14, align 4
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds { double, double }, ptr %70, i64 %72
  %74 = getelementptr inbounds { double, double }, ptr %73, i32 0, i32 0
  %75 = getelementptr inbounds { double, double }, ptr %73, i32 0, i32 1
  store double 0.000000e+00, ptr %74, align 8
  store double 0.000000e+00, ptr %75, align 8
  br label %76

76:                                               ; preds = %63
  %77 = load i32, ptr %14, align 4
  %78 = add nsw i32 %77, 1
  store i32 %78, ptr %14, align 4
  br label %59, !llvm.loop !11

79:                                               ; preds = %59
  %80 = load ptr, ptr %11, align 8
  %81 = load i32, ptr %9, align 4
  call void @fft(ptr %80, i32 %81, i32 noundef 0)
  %82 = load ptr, ptr %12, align 8
  %83 = load i32, ptr %9, align 4
  call void @fft(ptr %82, i32 %83, i32 noundef 0)
  store i32 0, ptr %15, align 4
  br label %84

84:                                               ; preds = %123, %79
  %85 = load i32, ptr %15, align 4
  %86 = load i32, ptr %9, align 4
  %87 = icmp slt i32 %85, %86
  br i1 %87, label %88, label %126

88:                                               ; preds = %84
  %89 = load ptr, ptr %12, align 8
  %90 = load i32, ptr %15, align 4
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds { double, double }, ptr %89, i64 %91
  %93 = getelementptr inbounds { double, double }, ptr %92, i32 0, i32 0
  %94 = load double, ptr %93, align 8
  %95 = getelementptr inbounds { double, double }, ptr %92, i32 0, i32 1
  %96 = load double, ptr %95, align 8
  %97 = load ptr, ptr %11, align 8
  %98 = load i32, ptr %15, align 4
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds { double, double }, ptr %97, i64 %99
  %101 = getelementptr inbounds { double, double }, ptr %100, i32 0, i32 0
  %102 = load double, ptr %101, align 8
  %103 = getelementptr inbounds { double, double }, ptr %100, i32 0, i32 1
  %104 = load double, ptr %103, align 8
  %105 = fmul double %102, %94
  %106 = fmul double %104, %96
  %107 = fmul double %102, %96
  %108 = fmul double %104, %94
  %109 = fsub double %105, %106
  %110 = fadd double %107, %108
  %111 = fcmp uno double %109, %109
  br i1 %111, label %112, label %118, !prof !8

112:                                              ; preds = %88
  %113 = fcmp uno double %110, %110
  br i1 %113, label %114, label %118, !prof !8

114:                                              ; preds = %112
  %115 = call { double, double } @__muldc3(double %102, double %104, double %94, double %96) #5
  %116 = extractvalue { double, double } %115, 0
  %117 = extractvalue { double, double } %115, 1
  br label %118

118:                                              ; preds = %114, %112, %88
  %119 = phi double [ %109, %88 ], [ %109, %112 ], [ %116, %114 ]
  %120 = phi double [ %110, %88 ], [ %110, %112 ], [ %117, %114 ]
  %121 = getelementptr inbounds { double, double }, ptr %100, i32 0, i32 0
  %122 = getelementptr inbounds { double, double }, ptr %100, i32 0, i32 1
  store double %119, ptr %121, align 8
  store double %120, ptr %122, align 8
  br label %123

123:                                              ; preds = %118
  %124 = load i32, ptr %15, align 4
  %125 = add nsw i32 %124, 1
  store i32 %125, ptr %15, align 4
  br label %84, !llvm.loop !12

126:                                              ; preds = %84
  %127 = load ptr, ptr %11, align 8
  %128 = load i32, ptr %9, align 4
  call void @fft(ptr %127, i32 %128, i32 1)
  store i32 0, ptr %16, align 4
  br label %129

129:                                              ; preds = %148, %126
  %130 = load i32, ptr %16, align 4
  %131 = load i32, ptr %9, align 4
  %132 = icmp slt i32 %130, %131
  br i1 %132, label %133, label %151

133:                                              ; preds = %129
  %134 = load ptr, ptr %11, align 8
  %135 = load i32, ptr %16, align 4
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds { double, double }, ptr %134, i64 %136
  %138 = getelementptr inbounds { double, double }, ptr %137, i32 0, i32 0
  %139 = load double, ptr %138, align 8
  %140 = getelementptr inbounds { double, double }, ptr %137, i32 0, i32 1
  %141 = load double, ptr %140, align 8
  %142 = call double @llvm.round.f64(double %139)
  %143 = fptosi double %142 to i32
  %144 = load ptr, ptr %10, align 8
  %145 = load i32, ptr %16, align 4
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds i32, ptr %144, i64 %146
  store i32 %143, ptr %147, align 4
  br label %148

148:                                              ; preds = %133
  %149 = load i32, ptr %16, align 4
  %150 = add nsw i32 %149, 1
  store i32 %150, ptr %16, align 4
  br label %129, !llvm.loop !13

151:                                              ; preds = %129
  %152 = load ptr, ptr %11, align 8
  call void @free(ptr %152)
  %153 = load ptr, ptr %12, align 8
  call void @free(ptr %153)
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.round.f64(double) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @multiply_fft(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca ptr, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  %18 = load i32, ptr %4, align 4
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %23, label %20

20:                                               ; preds = %2
  %21 = load i32, ptr %5, align 4
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %24

23:                                               ; preds = %20, %2
  store i32 0, ptr %3, align 4
  br label %182

24:                                               ; preds = %20
  store i32 1, ptr %6, align 4
  store i32 1, ptr %7, align 4
  br label %25

25:                                               ; preds = %35, %24
  %26 = load i32, ptr %7, align 4
  %27 = load i32, ptr %4, align 4
  %28 = icmp sle i32 %26, %27
  br i1 %28, label %33, label %29

29:                                               ; preds = %25
  %30 = load i32, ptr %7, align 4
  %31 = load i32, ptr %5, align 4
  %32 = icmp sle i32 %30, %31
  br label %33

33:                                               ; preds = %29, %25
  %34 = phi i1 [ true, %25 ], [ %32, %29 ]
  br i1 %34, label %35, label %40

35:                                               ; preds = %33
  %36 = load i32, ptr %7, align 4
  %37 = mul nsw i32 %36, 10
  store i32 %37, ptr %7, align 4
  %38 = load i32, ptr %6, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, ptr %6, align 4
  br label %25, !llvm.loop !14

40:                                               ; preds = %33
  %41 = load i32, ptr %6, align 4
  %42 = sext i32 %41 to i64
  %43 = mul i64 %42, 4
  %44 = call ptr @malloc(i64 %43) #4
  store ptr %44, ptr %8, align 8
  %45 = load i32, ptr %6, align 4
  %46 = sext i32 %45 to i64
  %47 = mul i64 %46, 4
  %48 = call ptr @malloc(i64 %47) #4
  store ptr %48, ptr %9, align 8
  %49 = load i32, ptr %4, align 4
  %50 = load ptr, ptr %8, align 8
  %51 = load i32, ptr %6, align 4
  %52 = sub nsw i32 %51, 1
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds i32, ptr %50, i64 %53
  store i32 %49, ptr %54, align 4
  %55 = load i32, ptr %5, align 4
  %56 = load ptr, ptr %9, align 8
  %57 = load i32, ptr %6, align 4
  %58 = sub nsw i32 %57, 1
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds i32, ptr %56, i64 %59
  store i32 %55, ptr %60, align 4
  %61 = load i32, ptr %6, align 4
  %62 = sub nsw i32 %61, 2
  store i32 %62, ptr %10, align 4
  br label %63

63:                                               ; preds = %103, %40
  %64 = load i32, ptr %10, align 4
  %65 = icmp sge i32 %64, 0
  br i1 %65, label %66, label %106

66:                                               ; preds = %63
  %67 = load ptr, ptr %8, align 8
  %68 = load i32, ptr %10, align 4
  %69 = add nsw i32 %68, 1
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds i32, ptr %67, i64 %70
  %72 = load i32, ptr %71, align 4
  %73 = sdiv i32 %72, 10
  %74 = load ptr, ptr %8, align 8
  %75 = load i32, ptr %10, align 4
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds i32, ptr %74, i64 %76
  store i32 %73, ptr %77, align 4
  %78 = load ptr, ptr %9, align 8
  %79 = load i32, ptr %10, align 4
  %80 = add nsw i32 %79, 1
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds i32, ptr %78, i64 %81
  %83 = load i32, ptr %82, align 4
  %84 = sdiv i32 %83, 10
  %85 = load ptr, ptr %9, align 8
  %86 = load i32, ptr %10, align 4
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds i32, ptr %85, i64 %87
  store i32 %84, ptr %88, align 4
  %89 = load ptr, ptr %8, align 8
  %90 = load i32, ptr %10, align 4
  %91 = add nsw i32 %90, 1
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds i32, ptr %89, i64 %92
  %94 = load i32, ptr %93, align 4
  %95 = srem i32 %94, 10
  store i32 %95, ptr %93, align 4
  %96 = load ptr, ptr %9, align 8
  %97 = load i32, ptr %10, align 4
  %98 = add nsw i32 %97, 1
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds i32, ptr %96, i64 %99
  %101 = load i32, ptr %100, align 4
  %102 = srem i32 %101, 10
  store i32 %102, ptr %100, align 4
  br label %103

103:                                              ; preds = %66
  %104 = load i32, ptr %10, align 4
  %105 = add nsw i32 %104, -1
  store i32 %105, ptr %10, align 4
  br label %63, !llvm.loop !15

106:                                              ; preds = %63
  store i32 1, ptr %11, align 4
  br label %107

107:                                              ; preds = %112, %106
  %108 = load i32, ptr %11, align 4
  %109 = load i32, ptr %6, align 4
  %110 = mul nsw i32 2, %109
  %111 = icmp slt i32 %108, %110
  br i1 %111, label %112, label %115

112:                                              ; preds = %107
  %113 = load i32, ptr %11, align 4
  %114 = mul nsw i32 %113, 2
  store i32 %114, ptr %11, align 4
  br label %107, !llvm.loop !16

115:                                              ; preds = %107
  %116 = load i32, ptr %11, align 4
  %117 = sext i32 %116 to i64
  %118 = mul i64 %117, 4
  %119 = call ptr @malloc(i64 %118) #4
  store ptr %119, ptr %12, align 8
  %120 = load ptr, ptr %8, align 8
  %121 = load ptr, ptr %9, align 8
  %122 = load i32, ptr %6, align 4
  %123 = load i32, ptr %11, align 4
  %124 = load ptr, ptr %12, align 8
  call void @multiply(ptr %120, ptr %121, i32 %122, i32 %123, ptr %124)
  store i32 0, ptr %13, align 4
  %125 = load i32, ptr %11, align 4
  %126 = sub nsw i32 %125, 1
  store i32 %126, ptr %14, align 4
  br label %127

127:                                              ; preds = %150, %115
  %128 = load i32, ptr %14, align 4
  %129 = icmp sge i32 %128, 0
  br i1 %129, label %130, label %153

130:                                              ; preds = %127
  %131 = load i32, ptr %13, align 4
  %132 = load ptr, ptr %12, align 8
  %133 = load i32, ptr %14, align 4
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds i32, ptr %132, i64 %134
  %136 = load i32, ptr %135, align 4
  %137 = add nsw i32 %136, %131
  store i32 %137, ptr %135, align 4
  %138 = load ptr, ptr %12, align 8
  %139 = load i32, ptr %14, align 4
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds i32, ptr %138, i64 %140
  %142 = load i32, ptr %141, align 4
  %143 = sdiv i32 %142, 10
  store i32 %143, ptr %13, align 4
  %144 = load ptr, ptr %12, align 8
  %145 = load i32, ptr %14, align 4
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds i32, ptr %144, i64 %146
  %148 = load i32, ptr %147, align 4
  %149 = srem i32 %148, 10
  store i32 %149, ptr %147, align 4
  br label %150

150:                                              ; preds = %130
  %151 = load i32, ptr %14, align 4
  %152 = add nsw i32 %151, -1
  store i32 %152, ptr %14, align 4
  br label %127, !llvm.loop !17

153:                                              ; preds = %127
  store i32 0, ptr %15, align 4
  store i32 1, ptr %16, align 4
  %154 = load i32, ptr %11, align 4
  %155 = sub nsw i32 %154, 2
  store i32 %155, ptr %17, align 4
  br label %156

156:                                              ; preds = %177, %153
  %157 = load i32, ptr %17, align 4
  %158 = load i32, ptr %11, align 4
  %159 = sub nsw i32 %158, 2
  %160 = load i32, ptr %6, align 4
  %161 = mul nsw i32 2, %160
  %162 = sub nsw i32 %159, %161
  %163 = add nsw i32 %162, 1
  %164 = icmp sge i32 %157, %163
  br i1 %164, label %165, label %180

165:                                              ; preds = %156
  %166 = load ptr, ptr %12, align 8
  %167 = load i32, ptr %17, align 4
  %168 = sext i32 %167 to i64
  %169 = getelementptr inbounds i32, ptr %166, i64 %168
  %170 = load i32, ptr %169, align 4
  %171 = load i32, ptr %16, align 4
  %172 = mul nsw i32 %170, %171
  %173 = load i32, ptr %15, align 4
  %174 = add nsw i32 %173, %172
  store i32 %174, ptr %15, align 4
  %175 = load i32, ptr %16, align 4
  %176 = mul nsw i32 %175, 10
  store i32 %176, ptr %16, align 4
  br label %177

177:                                              ; preds = %165
  %178 = load i32, ptr %17, align 4
  %179 = add nsw i32 %178, -1
  store i32 %179, ptr %17, align 4
  br label %156, !llvm.loop !18

180:                                              ; preds = %156
  %181 = load i32, ptr %15, align 4
  store i32 %181, ptr %3, align 4
  br label %182

182:                                              ; preds = %180, %23
  %183 = load i32, ptr %3, align 4
  ret i32 %183
}

attributes #0 = { noinline nounwind optnone ssp uwtable(sync) "frame-pointer"="non-leaf" "min-legal-vector-width"="0" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+sm4,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #1 = { allocsize(0) "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+sm4,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+sm4,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #4 = { allocsize(0) }
attributes #5 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 14, i32 0]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 1}
!5 = !{!"Apple clang version 15.0.0 (clang-1500.0.40.1)"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = !{!"branch_weights", i32 1, i32 1048575}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
!12 = distinct !{!12, !7}
!13 = distinct !{!13, !7}
!14 = distinct !{!14, !7}
!15 = distinct !{!15, !7}
!16 = distinct !{!16, !7}
!17 = distinct !{!17, !7}
!18 = distinct !{!18, !7}
