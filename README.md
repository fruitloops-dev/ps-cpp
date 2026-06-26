# PS C++ VS Code Template

C++로 알고리즘 문제풀이를 연습하기 위한 GitHub repo 템플릿입니다.

현재 실행 방식은 다음과 같습니다.

- 문제별로 `.cpp` 파일만 관리
- `input.txt`, `.in` 파일 사용하지 않음
- 실행하면 터미널에서 직접 입력
- `psrun` 명령어로 컴파일 + 실행

---

## 폴더 구조

```text
ps-cpp/
├─ .vscode/
│  ├─ tasks.json
│  ├─ launch.json
│  └─ settings.json
├─ problems/
│  ├─ boj/
│  │  └─ 1000.cpp
│  ├─ programmers/
│  └─ codeforces/
├─ templates/
│  ├─ main.cpp
│  └─ graph.cpp
├─ scripts/
│  ├─ psrun.sh
│  └─ new_problem.sh
├─ build/
├─ README.md
└─ .gitignore
```

---

## 필요한 패키지

WSL Ubuntu 기준:

```bash
sudo apt update
sudo apt install -y build-essential gdb git
```

확인:

```bash
g++ --version
gdb --version
git --version
```

---

## 새 문제 만들기

형식:

```bash
./scripts/new_problem.sh <site> <problem_id>
```

예시:

```bash
./scripts/new_problem.sh boj 10828
```

그러면 아래 파일이 생성됩니다.

```text
problems/boj/10828.cpp
```

프로그래머스 문제라면:

```bash
./scripts/new_problem.sh programmers 42586
```

코드포스 문제라면:

```bash
./scripts/new_problem.sh codeforces 1920A
```

---

## 실행하기

### 1. 문제 번호만으로 실행

```bash
psrun 10828
```

단, 이 방식은 `problems/**/10828.cpp`가 하나만 있을 때만 동작합니다.

예를 들어 아래처럼 하나만 있으면 정상 실행됩니다.

```text
problems/boj/10828.cpp
```

---

### 2. 사이트를 명시해서 실행

같은 번호의 문제가 여러 사이트에 있을 수 있으므로, 가장 안전한 방식은 사이트를 같이 쓰는 것입니다.

```bash
psrun boj 10828
```

```bash
psrun programmers 42586
```

```bash
psrun codeforces 1920A
```

---

### 3. 전체 경로로 실행

```bash
psrun problems/boj/10828.cpp
```

---

## 입력 방식

현재 방식에서는 `input.txt`나 `.in` 파일을 사용하지 않습니다.

실행하면 터미널에서 직접 입력합니다.

예시:

```bash
psrun boj 1000
```

실행 후 직접 입력:

```text
1 2
```

출력:

```text
3
```

입력이 여러 줄이면 그대로 붙여넣으면 됩니다.

예시:

```text
5
1 2
3 4
5 6
7 8
9 10
```

입력 종료가 필요한 프로그램이라면 WSL 터미널에서:

```text
Ctrl + D
```

를 누르면 EOF가 들어갑니다.

---

## 예제 코드

`problems/boj/1000.cpp`

```cpp
#include <bits/stdc++.h>
using namespace std;

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);

    int a, b;
    cin >> a >> b;
    cout << a + b << '\n';

    return 0;
}
```

---

## 기본 템플릿

`templates/main.cpp`

```cpp
#include <bits/stdc++.h>
using namespace std;

using ll = long long;

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);

    return 0;
}
```

---

## Git 사용 예시

처음 한 번:

```bash
git init
git add .
git commit -m "Set up C++ PS environment"
```

GitHub repo 연결:

```bash
git remote add origin https://github.com/<YOUR_ID>/<REPO_NAME>.git
git branch -M main
git push -u origin main
```

문제 풀이 후:

```bash
git add .
git commit -m "Solve BOJ 10828"
git push
```

---

## 자주 쓰는 흐름

```bash
./scripts/new_problem.sh boj 10828
code problems/boj/10828.cpp
psrun boj 10828
```

또는 파일명이 유일하다면:

```bash
psrun 10828
```

---

## 참고

`build/` 폴더는 실행 파일이 저장되는 곳입니다.

직접 관리할 필요 없고, 삭제해도 됩니다.

```bash
rm -rf build
```

다시 `psrun`을 실행하면 자동으로 생성됩니다.
