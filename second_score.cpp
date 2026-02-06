#include <iostream>
#include <climits>
using namespace std;

int main() {
    int t;
    cin >> t;

    while (t--) {
        int n;
        cin >> n;

        long long max1 = LLONG_MIN;
        long long max2 = LLONG_MIN;

        for (int i = 0; i < n; i++) {
            long long x;
            cin >> x;

            if (x > max1) {
                max2 = max1;
                max1 = x;
            } else if (x > max2) {
                max2 = x;
            }
        }

        if (n < 2)
            cout << -1 << '\n';
        else
            cout << max2 << '\n';
    }

    return 0;
}