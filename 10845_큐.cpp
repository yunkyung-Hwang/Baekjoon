#include <iostream>

#define SIZE 10000

using namespace std;

int queue[SIZE];
int n, num, fp = -1, bp = -1;
string command;

bool empty() {
    return fp == bp;
}

void push(int x) {
    bp++;
    queue[bp] = x;
}

int pop() {
    if (empty()) return -1;
    else return queue[++fp];
}

int size() {
    return bp - fp;
}

int front() {
    if (empty()) return -1;
    else return queue[fp + 1];
}

int back() {
    if (empty()) return -1;
    else return queue[bp];
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
        else if (command == "front") cout << front() << endl;
        else if (command == "back") cout << back() << endl;
    }
}
