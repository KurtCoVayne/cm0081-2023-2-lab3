// long binary_exponentiation(long b, long e) {
//   long ans = 1;
// 	for (; e; b = b*b, e >>= 1)
// 		if (e&1) ans = ans*b;
// 	return ans;
// }
// Do it recursively:
long binary_exponentiation(long *ans, long b, long e) {
  if (e == 0) return 1;
  binary_exponentiation(ans, b*b, e>>1);
  if (e&1) *ans = *ans*b;
  return *ans;
}