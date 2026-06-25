#include <stdio.h>

#define N 30   /* number of samples to compute */

/* coefficients for fd1 = 1 kHz, fs = 10 kHz (your design) */
static const double b0 = 0.067455;
static const double b1 = 0.134910;
static const double b2 = 0.067455;
static const double a1 = 1.142981;   
static const double a2 = -0.412795; 

int main(void) {
   // int n;
    int x[N];  /* input signal */
    double x1 = -1.0, x2 = -1.0;   /* x[-1], x[-2] */
    double y1 = -1.0, y2 = -1.0;   /* y[-1], y[-2] */

    for (int n = 0; n < N; n++) {
        x[n] = 1;  /* step input, +1 for all n >= 0 */
    }

    for (int n = 0; n < 30; n++) {
        //double x = 1.0;                       /* step input, +1 for all n >= 0 */
        double y = b0*x[n] + b1*x1 + b2*x2 + a1*y1 + a2*y2;
        printf("y[%2d] = %+9.5f\n", n, y);
        x2 = x1; // x[n-2] = x[n-1]
        x1 = x[n];  // x[n-1] = x[n]                    
        y2 = y1; // y[n-2] = y[n-1]
        y1 = y;  // y[n-1] = y[n]                  
    }
    return 0;
}
