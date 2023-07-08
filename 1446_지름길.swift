// 1446_지름길.swift

// 풀이
// dp

typealias Road = (start: Int, end: Int, distance: Int)
let nd = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, d) = (nd[0], nd[1])
var roads: [Road] = [Road](repeating: (0, 0, 0), count: n)
var dp = Array(0...10001)

for i in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    roads[i] = (input[0], input[1], input[2])
}

for i in 0...d {
    if i > 0 { dp[i] = min(dp[i-1]+1, dp[i]) }

    for road in roads {
        // 현재 점에서 출발하는 지름길이 있다면
        if road.start == i {
            dp[road.end] = min(dp[road.end], dp[road.start] + road.distance)
        }
    }
}

print(dp[d])
