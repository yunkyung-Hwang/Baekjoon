// 19598_최소 회의실 개수

// 문제
// n개의 회의를 모두 진행할 수 있는 최소 회의실 개수
// n <= 100000(십만)

// 끝나는 지점 시작 지점 맞물릴때 처리를 위한 정렬 잘 해주기

typealias Time = (time: Int, count: Int)
let n = Int(readLine()!)!
var times = [Time]()
for _ in 0..<n {
    let time = readLine()!.split(separator: " ").map { Int(String($0))! }
    times.append((time[0], 1))
    times.append((time[1], -1))
}

times.sort(by: { $0.time < $1.time })   // 점 기준으로만 정렬하면 틀림!
times.sort(by: { ($0.time, $0.count) < ($1.time, $1.count) })

var result = 0
var count = 0
for time in times {
    count += time.count
    result = max(result, count)
}
print(result)
