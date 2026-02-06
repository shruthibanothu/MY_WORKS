#include <stdio.h>

int main() {
    int n;
    scanf("%d", &n);

    int cnt[8] = {0};
    int x;

    for (int i = 0; i < n; i++) {
        scanf("%d", &x);
        cnt[x]++;
    }

    if (cnt[5] > 0 || cnt[7] > 0) {
        printf("-1\n");
        return 0;
    }

    int groups = n / 3;

    while (cnt[1] > 0 && cnt[2] > 0 && cnt[4] > 0) {
        printf("1 2 4\n");
        cnt[1]--;
        cnt[2]--;
        cnt[4]--;
        groups--;
    }

    while (cnt[1] > 0 && cnt[3] > 0 && cnt[6] > 0) {
        printf("1 3 6\n");
        cnt[1]--;
        cnt[3]--;
        cnt[6]--;
        groups--;
    }

    while (cnt[1] > 0 && cnt[2] > 0 && cnt[6] > 0) {
        printf("1 2 6\n");
        cnt[1]--;
        cnt[2]--;
        cnt[6]--;
        groups--;
    }
    if (groups != 0) {
        printf("-1\n");
    }

    return 0;
}
