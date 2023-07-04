// 1689_겹치는 선분

// 문제
// 선분이 최대로 겹쳐있는 부분의 개수
// 끝점은 겹친거 아님
// 선분 개수 n <= 1000000(백만)
// 선분 좌표의 절대값 <= 10억

// 끝나는 지점 시작 지점 맞물릴때 처리를 위한 정렬 잘 해주기

typealias Line = (point: Int, count: Int)
let n = Int(readLine()!)!
var lines = [Line](repeating: (0, 0), count: n * 2)
var i = 0
while i < n * 2 {
    let line = readLine()!.split(separator: " ").map { Int(String($0))! }
    lines[i] = (line[0], 1)
    lines[i+1] = (line[1], -1)
    i += 2
}

// lines.sort(by: { $0.point < $1.point })  // 점 기준으로만 정렬하면 틀림!
lines.sort(by: { ($0.point, $0.count) < ($1.point, $1.count) })

var result = 0
var count = 0
for line in lines {
    count += line.count
    result = max(result, count)
}
print(result)
