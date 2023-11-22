#include <complex.h>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>

typedef double complex cd;

const double PI = 3.141592653589793;

void fft(cd a[], int n, int invert) {
    if (n == 1) return;

    cd *a0 = malloc(n / 2 * sizeof(cd));
    cd *a1 = malloc(n / 2 * sizeof(cd));

    for (int i = 0; 2 * i < n; i++) {
        a0[i] = a[2 * i];
        a1[i] = a[2 * i + 1];
    }

    fft(a0, n / 2, invert);
    fft(a1, n / 2, invert);

    double ang = 2 * PI / n * (invert ? -1 : 1);
    cd w = 1;
    cd wn = cos(ang) + sin(ang) * I;

    for (int i = 0; 2 * i < n; i++) {
        a[i] = a0[i] + w * a1[i];
        a[i + n / 2] = a0[i] - w * a1[i];
        if (invert) {
            a[i] /= 2.0;
            a[i + n / 2] /= 2.0;
        }
        w *= wn;
    }

    free(a0);
    free(a1);
}

void multiply(int a[], int b[], int n, int m, int *result) {
    cd *fa = malloc(m * sizeof(cd));
    cd *fb = malloc(m * sizeof(cd));

    for (int i = 0; i < n; i++) {
        fa[i] = a[i];
        fb[i] = b[i];
    }
    // Paddding with zeros
    for (int i = n; i < m; i++) {
        fa[i] = 0;
        fb[i] = 0;
    }

    fft(fa, m, 0);
    fft(fb, m, 0);

    for (int i = 0; i < m; i++)
        fa[i] *= fb[i];

    fft(fa, m, 1);

    for (int i = 0; i < m; i++)
        result[i] = round(creal(fa[i]));

    free(fa);
    free(fb);
}

int multiply_fft(int a, int b) {
    if(a == 0 || b == 0) return 0;
    int n = 1, pow10 = 1;
    while (pow10 <= a || pow10 <= b) {
        pow10 *= 10;
        n++;
    }

    int *a_digits = malloc(n * sizeof(int));
    int *b_digits = malloc(n * sizeof(int));

    a_digits[n - 1] = a;
    b_digits[n - 1] = b;

    for (int i = n - 2; i >= 0; i--) {
        a_digits[i] = a_digits[i + 1] / 10;
        b_digits[i] = b_digits[i + 1] / 10;
        a_digits[i + 1] %= 10;
        b_digits[i + 1] %= 10;
    }

    int m = 1;
    while (m < 2 * n) {
        m *= 2;
    }

    int *result = malloc(m * sizeof(int));
    multiply(a_digits, b_digits, n, m, result);
    int carry = 0;
    for (int i = m - 1; i >= 0; i--) {
        result[i] += carry;
        carry = result[i] / 10;
        result[i] %= 10;
    }
    int c = 0, ten_pow = 1;
    for (int i = m - 2; i >= m-2 -2*n+1; i--) {
        c += result[i] * ten_pow;
        ten_pow *= 10;
    }
    return c;
}