#include <bits/stdc++.h>
using namespace std;

#define fastio ios::sync_with_stdio(false); cin.tie(nullptr)

int main() {
    fastio;

#ifdef LOCAL
    freopen("input.txt", "r", stdin);
#endif

    int n, m;
    cin >> n >> m;

    vector<vector<int>> graph(n + 1);
    for (int i = 0; i < m; ++i) {
        int a, b;
        cin >> a >> b;
        graph[a].push_back(b);
        graph[b].push_back(a);
    }

    vector<int> dist(n + 1, -1);
    queue<int> q;

    int start = 1;
    dist[start] = 0;
    q.push(start);

    while (!q.empty()) {
        int cur = q.front();
        q.pop();

        for (int nxt : graph[cur]) {
            if (dist[nxt] != -1) continue;
            dist[nxt] = dist[cur] + 1;
            q.push(nxt);
        }
    }

    return 0;
}
