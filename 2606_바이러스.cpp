#include <iostream>
#include <vector>

using namespace std;

int cnt, n, c1, c2, result = 0;
vector<int> list[101];
bool visited[101];

// n번 노드에대하여 dfs
void dfs(int n) {
    // 1. 이미 방문한 노드
    if (visited[n] == true) return;
    // 2. 방문하지 않은 노드
    else {
        // 일단 방문 체크
        visited[n] = true;
        // 방문됬으니까 결과값 +1
        result += 1;
        // 방문된 노드를 기준으로 자식이 있으면 연결된 놈들도 싹 다 판별
        for (int i = 0; i < list[n].size(); i++) {
            dfs(list[n][i]);
        }
    }
}

int main() {
    ios_base::sync_with_stdio(false); cin.tie(NULL); cout.tie(NULL);
    cin >> cnt;
    cin >> n;
    
    for (int i = 0; i < n; i++) {
        cin >> c1 >> c2;
        list[c1].push_back(c2);
        list[c2].push_back(c1);
      // 얘때문에 틀렸습니다
//         visited[i] = false;
    }
    
    dfs(1);
    
    cout << result - 1 << endl;
}
