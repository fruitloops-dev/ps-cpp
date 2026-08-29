#include <iostream>
#include <vector>
#include <optional>

using namespace std;

class ScoreTracker {
private:
    int total;
    int count;

public:
    ScoreTracker();

    void addScore(int score);
    optional<double> average() const;
    int size() const;
    void clear();
};


int main() {


}

