#include <stdio.h>

#define MAXN 50
#define MAXL 50

long long min_ll(long long a, long long b) { return a < b ? a : b; }

int main(void) {
    int N, L;
    long long T, K;
    static long long A[MAXL];
    static long long C[MAXN][MAXL];

    if (scanf("%d %d %lld %lld", &N, &L, &T, &K) != 4) return 0;

    for (int j = 0; j < L; ++j) scanf("%lld", &A[j]);
    for (int i = 0; i < N; ++i) {
        for (int j = 0; j < L; ++j) {
            scanf("%lld", &C[i][j]);
        }
    }

    /* current level of each machine i */
    int level[MAXN];
    for (int i = 0; i < N; ++i) level[i] = 0;

    long long apples = K;

    for (long long t = 0; t < T; ++t) {
        int best_i = -1, best_j = -1;
        long long best_cost = -1;

        /* choose cheapest affordable strengthening */
        for (int i = 0; i < N; ++i) {
            int j = level[i];
            if (j + 1 >= L) continue; /* already max level */
            long long cost = C[i][j];
            if (cost <= apples) {
                if (best_i == -1 || cost < best_cost) {
                    best_i = i;
                    best_j = j;
                    best_cost = cost;
                }
            }
        }

        if (best_i == -1) {
            /* do nothing */
            printf("-1");
        }
        else {
            /* strengthen machine best_i at level best_j */
            printf("%d %d", best_i, best_j);
            apples -= C[best_i][best_j];
            level[best_i]++;  /* now at best_j + 1 */
        }

        /* production phase: all machines produce apples */
        long long add = 0;
        for (int i = 0; i < N; ++i) {
            int j = level[i];
            if (j >= 0 && j < L) add += A[j];
        }
        apples += add;
        if (apples < 0) apples = 0; /* safety */
    }

    return 0;
}
