#include <iostream>

using namespace std;

int n, m;
int map[501][501];
int visited[501][501] = {0};
int dx[] = {-1, 0, 1, 0};
int dy[] = {0, 1, 0, -1};

void dfs(int x, int y) {
    if (x < 0 || y < 0 || x >= n || y >= m) return;
    
    visited[x][y] += 1;
    for(int i = 0; i < 4; i++) {
        if(map[x + dx[i]][y + dy[i]] < map[x][y]) {
            dfs(x + dx[i], y + dy[i]);
        }
    }
}

int main() {
    ios_base::sync_with_stdio(false); cin.tie(NULL); cout.tie(NULL);
    
    cin >> n >> m;
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < m; j++) {
            cin >> map[i][j];
        }
    }
    
    dfs(0, 0);
    cout << visited[n-1][m-1] << endl;
}
