#include <iostream>

using namespace std;

int n, result;
int col[15];

int check(int row);
int nQueen(int index);

int main() {
    cin >> n;
    nQueen(0);
    cout << result << endl;
}

int check(int index) {
    for (int i = 0; i < index; i++) {
        if (col[index] == col[i] || abs(col[index] - col[i]) == index - i) return false;
    }
    return true;
}

int nQueen(int index) {
    if (index == n) {
        result += 1;
    } else {
        for (int i = 0; i < n; i++) {
            col[index] = i;
            if(check(index)) nQueen(index + 1);
        }
    }
    return 0;
}
