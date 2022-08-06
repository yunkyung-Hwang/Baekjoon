#include <iostream>

#define SIZE 10000

using namespace std;

int stack[SIZE];
int n, num, sp = -1;
string command;

bool empty() {
    return sp == -1;
}

void push(int x) {
    sp++;
    stack[sp] = x;
}

int pop() {
    if (empty()) return -1;
    else return stack[sp--];
}

int size() {
    return sp + 1;
}

int top() {
    if (empty()) return -1;
    else return stack[sp];
}

int main() {
    ios_base::sync_with_stdio(0); cin.tie(0); cout.tie(0);
    
    cin >> n;
    
    for (int i = 0; i < n; i++) {
        cin >> command;
        
        if (command == "push") {
            cin >> num;
            push(num);
        } else if (command == "pop") cout << pop() << endl;
        else if (command == "size") cout << size() << endl;
        else if (command == "empty") cout << empty() << endl;
        else if (command == "top") cout << top() << endl;
    }
}
