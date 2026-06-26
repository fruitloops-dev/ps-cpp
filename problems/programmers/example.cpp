#include <bits/stdc++.h>
using namespace std;

// Programmers style example.
// Submit only the solution function when the platform does not require main().

int solution(vector<int> numbers) {
    int answer = 0;
    for (int x : numbers) answer += x;
    return answer;
}

#ifdef LOCAL
int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);

    vector<int> numbers = {1, 2, 3, 4, 5};
    cout << solution(numbers) << '\n';

    return 0;
}
#endif
