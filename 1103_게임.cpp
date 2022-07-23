#include <iostream>

using namespace std;

// dfs
// 상하좌우 순서대로 갈 수 있는 방향 확인
// - 인덱스가 넘치거나 도착지가 H이면 dfs 종료
// - 갈 수 있으면 재귀 실행
// - 해당 노드에서 방문한 상하좌우 값중 가장 큰 값을 return

// visited에 방문 여부 뿐만아니라 해당 노드의 최대자식값을 저장

int n, m;
int board[51][51], visited[51][51];
int dx[4] = {-1, 0, 1, 0};
int dy[4] = {0, 1, 0, -1};
bool isCycle = false;

int dfs(int x, int y) {
    // 보드를 벗어나거나 구멍이거나 방문했던곳(순환)이면 종료
    if (x < 0 || y < 0 || x >= n || y >= m || board[x][y] == -1 || isCycle) return 0;

    // 방문하지 않은 곳
    int cal = -1;
    if (visited[x][y] == -1) {
        // 방문 체크
        visited[x][y] = 0;
        // 해당 노드의 상하좌우를 모두 방문(dfs)
        for (int i = 0; i < 4; i++) {
            int r = dfs(x + dx[i] * board[x][y], y + dy[i] * board[x][y]) + 1;
            if (cal < r) cal = r;
        }
        // 부모의 자식 중 가장 최대값이 부모에 저장
        visited[x][y] = cal;
        
        return cal;
    }
    // 방문중인 곳에 다시 옴 == 사이클
    else if (visited[x][y] == 0) {
        isCycle = true;
        return 0;
    }
    // 탐색 끝
    else {
        return visited[x][y];
    }
    
    return 0;
}

int main() {
    ios_base::sync_with_stdio(false); cin.tie(NULL); cout.tie(NULL);
    cin >> n >> m;
    
    // board 배열과 방문했음을 기록하는 visited 배열 입력 및 초기화
    for(int i = 0; i < n; i++) {
        string s;
        cin >> s;
        // 공백없이 입력받을땐 문자열로 받아서 처리
        for (int j = 0; j < s.length(); j++) {
            if (s[j] == 'H') board[i][j] = -1;
            else board[i][j] = s[j] - '0';
            visited[i][j] = -1;
        }
    }
    
    int result = dfs(0, 0);
    result = isCycle ? -1 : result;
    cout << result << endl;
}
