#include <bits/stdc++.h>

using namespace std;

int main() {
    int K; cin>>K; long long ans=0;
    stack<int> s;

    while (K--) {
        int temp; 
        cin >> temp;

        if (temp == 0)
            s.pop();
        else s.push(temp);
    }

    while (!s.empty()) {
        ans += s.top();
        s.pop();
    }
    cout<<ans<<'\n'; 
}