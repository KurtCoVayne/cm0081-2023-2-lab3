long binary_exponentiation(long b, long e) {
  long ans = 1;
	for (; e; b = b*b, e >>= 1)
		if (e&1) ans = ans*b;
	return ans;
}