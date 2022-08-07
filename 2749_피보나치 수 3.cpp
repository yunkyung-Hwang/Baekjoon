#include <iostream>

#define CYCLE 1500000

using namespace std;
long long n;
long long f[CYCLE] = {0, 1};

void fibonacci() {
    for (int i = 2; i < CYCLE; i++) {
        f[i] = (f[i - 1] + f[i - 2]) % 1000000;
    }
}

int main() {
    ios_base::sync_with_stdio(0); cin.tie(0); cout.tie(0);
    cin >> n;
    
    fibonacci();
    cout << f[n%CYCLE] << endl;
}
