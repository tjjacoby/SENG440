#include <stdio.h>

#define N 30   /* number of samples to compute */

static const int b0 = 1105;
static const int b1 = 2210;
static const int b2 = 1105;
static const int a1 = 18727;
static const int a2 = -6763;

int main() {
    int x[N];  /* input signal */

    int x1_fixed = -(1 << 14), x2_fixed = -(1 << 14);   /* x[-1], x[-2] in fixed-point representation */
    int y1_fixed = -(1 << 14), y2_fixed = -(1 << 14);   /* y[-1], y[-2] in fixed-point representation */

    //Step input signal initialization
    for (int n = 0; n < N; n++) {
        x[n] = (1 << 14);  /* step input, +1 for all n >= 0 */
    }
    //Only use sqaure if flag is set
    #if 0
    // Sqaure wave high for 2 steps low for 2 steps 
    for (int n = 0; n < N; n++) {
        if ((n / 2) % 2 == 0) {
            x[n] = (1 << 14);  /* high for 2 steps */
        } else {
            x[n] = 0; /* low for 2 steps */
        }
    }
    #endif


 for (int n = 0; n < 30; n++) {
        //double x = 1.0;                       /* step input, +1 for all n >= 0 */
        //double y = b0*x[n] + b1*x1 + b2*x2 + a1*y1 + a2*y2;

        int y_fixed = (
            b0 * x[n] + b1 * x1_fixed + b2 * x2_fixed + a1 * y1_fixed + a2 * y2_fixed
        ) >> 14;


        //printf("y[%2d] = %+9.5f\n", n, y);
       // printf("y_fixed[%2d] = %d\n", n, y_fixed);
        printf("y_fixed[%2d] = %+9.5f\n", n, (double)y_fixed / (1 << 14));
        x2_fixed = x1_fixed; // x[n-2] = x[n-1]
        x1_fixed = x[n];  // x[n-1] = x[n]                    
        y2_fixed = y1_fixed; // y[n-2] = y[n-1]
        y1_fixed = y_fixed;  // y[n-1] = y[n]                  
    }
    return 0;
}