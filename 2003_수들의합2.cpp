#include <iostream>

using namespace std;

int n, m, sum, start = 0, result = 0;
int a[10001];

int main() {
    cin >> n >> m;
    for (int i = 0; i < n; i++) {
        cin >> a[i];
    }
    
    while (true) {
        if (start >= n) break;
        sum = 0;
        
        for (int i = start; i < n; i++) {
            sum += a[i];
            if (sum > m) {
                break;
            } else if (sum == m) {
                result += 1;
                break;
            }
        }
        
        start += 1;
    }
    
    cout << result << endl;
}
