#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

int n, cnt;
int town[25][25];
int visited[25][25];
vector<int> houseCnt;
int dx[] = {-1, 0, 1, 0};
int dy[] = {0, 1, 0, -1};

int dfs(int x, int y) {
    // 인덱스가 town을 넘어가는 경우 제외
    if (x < 0 || y < 0 || x >= n || y >= n) return 0;
    // 집이 있고 처음 방문하는 경우에만 실행
    if (town[x][y] != 0 && visited[x][y] == 0) {
        // 방문 체크
        visited[x][y] = 1;
        // 단지에 포함되는 집 개수
        cnt += 1;
        // 상하좌우 집이 있는가 판별
        for (int i = 0; i < 4; i++) {
            dfs(x + dx[i], y + dy[i]);
        }
        return 1;
    }
    return 0;
}

int main() {
    ios_base::sync_with_stdio(false); cin.tie(NULL); cout.tie(NULL);
    
    cin >> n;
    for (int i = 0; i < n; i++) {
        string s;
        cin >> s;
        for (int j = 0; j < s.length(); j++) {
            town[i][j] = s[j] - '0';
        }
    }
    
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            // 모든 집 다 방문
            cnt = 0;
            // 단지 하나
            int tmp = dfs(i, j);
            // 단지가 생성됬다면 집 개수 push
            if (tmp != 0) {
                houseCnt.push_back(cnt);
            }
        }
    }
    
    cout << houseCnt.size() << endl;
    sort(houseCnt.begin(), houseCnt.end());
    for(int i = 0; i < houseCnt.size(); i++) {
        cout << houseCnt[i] << endl;
    }
}
