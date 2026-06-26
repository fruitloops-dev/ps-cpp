# PS C++ VS Code Template

알고리즘 문제풀이를 GitHub repo + VS Code + C++20 환경에서 바로 시작하기 위한 템플릿입니다.

## 포함된 것

```text
ps-cpp-vscode-template/
├─ .vscode/
│  ├─ tasks.json       # 현재 열려 있는 cpp 파일 빌드/실행
│  ├─ launch.json      # 현재 열려 있는 cpp 파일 디버깅
│  └─ settings.json    # C++20, g++ 기반 VS Code 설정
├─ problems/
│  ├─ boj/
│  │  └─ 1000.cpp
│  ├─ codeforces/
│  │  └─ example.cpp
│  └─ programmers/
│     └─ example.cpp
├─ templates/
│  ├─ main.cpp         # 기본 문제풀이 템플릿
│  └─ graph.cpp        # 그래프/BFS 시작 템플릿
├─ scripts/
│  ├─ new_problem.sh   # macOS/Linux/Git Bash용 문제 파일 생성 스크립트
│  └─ new_problem.ps1  # Windows PowerShell용 문제 파일 생성 스크립트
├─ build/              # 컴파일 결과물 저장 위치
├─ input.txt           # 로컬 테스트 입력
├─ input.example.txt   # 예제 입력
├─ .clang-format
├─ .gitignore
└─ README.md
```

## 1. 필수 설치

### Windows 추천: MSYS2 UCRT64

1. MSYS2 설치
2. 시작 메뉴에서 `MSYS2 UCRT64` 실행
3. 아래 명령어 실행

```bash
pacman -Syu
pacman -S --needed mingw-w64-ucrt-x86_64-toolchain git
```

4. Windows 환경 변수 `Path`에 아래 경로 추가

```text
C:\msys64\ucrt64\bin
```

5. 새 터미널에서 확인

```bash
g++ --version
gdb --version
git --version
```

### macOS

```bash
xcode-select --install
```

### Ubuntu / WSL

```bash
sudo apt update
sudo apt install -y build-essential gdb git
```

## 2. VS Code 확장

VS Code에서 아래 확장을 설치하세요.

- C/C++ by Microsoft

터미널로 설치하려면:

```bash
code --install-extension ms-vscode.cpptools
```

## 3. 사용법

이 폴더를 VS Code로 엽니다.

```bash
code .
```

`problems/boj/1000.cpp` 파일을 열고 `input.txt`에 입력을 적은 뒤 실행합니다.

### 빌드

```text
Ctrl + Shift + B
```

기본 빌드 작업은 `C++: build current file`입니다.

### 실행

VS Code Command Palette에서:

```text
Tasks: Run Task
```

그다음:

```text
C++: run current file
```

### 디버깅

1. 디버깅할 `.cpp` 파일을 엽니다.
2. 중단점을 찍습니다.
3. `F5`를 누릅니다.
4. `Debug current C++ file`을 선택합니다.

## 4. 새 문제 파일 만들기

### macOS / Linux / Git Bash

```bash
./scripts/new_problem.sh boj 10828
```

생성 결과:

```text
problems/boj/10828.cpp
```

### Windows PowerShell

```powershell
./scripts/new_problem.ps1 boj 10828
```

## 5. GitHub에 올리기

GitHub에서 빈 repo를 만든 뒤, 이 폴더에서:

```bash
git init
git add .
git commit -m "Set up C++ PS environment"
git branch -M main
git remote add origin https://github.com/YOUR_NAME/YOUR_REPO.git
git push -u origin main
```

## 6. 추천 운영 방식

```text
problems/boj/1000.cpp
problems/boj/10828.cpp
problems/codeforces/1920A.cpp
problems/programmers/level2_problem_name.cpp
```

문제마다 파일 하나씩 만들고, `input.txt`만 바꿔가며 테스트하면 됩니다.

## 7. BOJ 1000 테스트

`input.txt`:

```text
1 2
```

`problems/boj/1000.cpp` 실행 결과:

```text
3
```
