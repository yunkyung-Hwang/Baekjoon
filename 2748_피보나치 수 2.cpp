#include <iostream>

using namespace std;
int n;

long long fibonacci(int n) {
    if (n <= 2) return 1;

    long long a, b, c;
    a = b = c = 1;
    for (int i = 3; i <= n; i++) {
        c = a + b;
        a = b;
        b = c;
    }
    return c;
}

int main() {
    ios_base::sync_with_stdio(0); cin.tie(0); cout.tie(0);
    cin >> n;
    
    cout << fibonacci(n) << endl;
}
