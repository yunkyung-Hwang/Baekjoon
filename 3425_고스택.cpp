#include <iostream>
#include <stack>

using namespace std;

#define MAX 1000000000

typedef long long ll;

string command[10000];
int numStorage[10000];
stack<ll> numStack;
string c;
int ci, ni, num;
bool isError;

void calculate() {
    ni = 0;
    isError = false;
    for (int j = 0; j < ci; j++) {
        if (command[j] == "NUM") {
            numStack.push(numStorage[ni++]);
        } else if (numStack.empty()) {
            isError = true;
            break;
        } else if (command[j] == "POP") {
            numStack.pop();
        } else if (command[j] == "INV") {
            ll num = numStack.top();
            numStack.pop();
            numStack.push(num * -1);
        } else if (command[j] == "DUP") {
            numStack.push(numStack.top());
        } else if (numStack.size() < 2) {
            isError = true;
            break;
        } else if (command[j] == "SWP") {
            ll n1 = numStack.top();
            numStack.pop();
            ll n2 = numStack.top();
            numStack.top() = n1;
            numStack.push(n2);
        } else if (command[j] == "ADD") {
            ll n1 = numStack.top();
            numStack.pop();
            numStack.top() += n1;
        } else if (command[j] == "SUB") {
            ll n1 = numStack.top();
            numStack.pop();
            numStack.top() -= n1;
        } else if (command[j] == "MUL") {
            ll n1 = numStack.top();
            numStack.pop();
            numStack.top() *= n1;
        } else if (command[j] == "DIV") {
            ll n1 = numStack.top();
            if (n1 == 0) {
                isError = true;
                break;
            }
            numStack.pop();
            numStack.top() /= n1;
        } else if (command[j] == "MOD") {
            ll n1 = numStack.top();
            if (n1 == 0) {
                isError = true;
                break;
            }
            numStack.pop();
            numStack.top() %= n1;
        }
    }
}

int main() {
    while(true) {
        // 케이스마다 명령어 입력
        ci = 0;
        ni = 0;
        while(true) {
            cin >> c;
            if (c == "QUIT") exit(0);
            else if (c == "END") break;
            else if (c == "NUM") {
                cin >> numStorage[ni++];
            }
            command[ci++] = c;
        }

        int cnt;
        cin >> cnt;
        
        // 숫자 입력 & 각 숫자마다 명령 목록 수행
        for (int i = 0; i < cnt; i++) {
            cin >> num;
            numStack.push(num);
            
            // 명령 목록 수행
            calculate();
            
            // 수행 후 결과 출력
            if (isError || numStack.size() != 1 || numStack.top() > MAX || numStack.top() < MAX * -1)
                cout << "ERROR" << endl;
            else cout << numStack.top() << endl;
            
            // stack 초기화
            while (!numStack.empty()) numStack.pop();
        }
        cout << endl;
    }
}
