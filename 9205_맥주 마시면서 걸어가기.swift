import Foundation

// 9205_맥주 마시면서 걸어가기

// 문제
// 상근이네 집에서 출발해서 맥주를 마시며 락 페스티벌에 간다.
// 맥주는 20개가 있으며 50미터마다 한 병씩 마신다.
// 편의점에서 맥주를 더 살 수 있다. 하지만 들고다닐 수 있는 맥주는 최대 20병이다.
// 편의점을 나선 직후에도 맥주를 마셔야한다.
// 도착할 수 있는지 여부를 구하시오.
// 두 좌표 사이의 거리는 x차이 + y차이이다.

// 풀이
// 출제자의 의도를 잘 파악하기 위해 맥주를 마시면서 풀어본다.
// 술마시면서 가서그런가 최단거리로 가는지는 상관 없고 도착 여부만 판단하면 됨
// 들 수 있는 맥주가 20병이고 리필도 20병씩이니까 지점마다 움직일 수 있는 고정 영역(정사각형)이 그려짐
// 목적지에 도착할 때 까지 해당 영역 내에 편의점이 있으면 들리는 방식으로 dfs 실행
// 이미 방문한 편의점은 다시 안가도 됨

let t = Int(readLine()!)!
for _ in 0..<t {
    let n = Int(readLine()!)!
    let home = readLine()!.split(separator: " ").map { Int(String($0))! }
    var cs = [[Int]](repeating: [0, 0], count: n)
    var visit = [Bool](repeating: false, count: n)
    for i in 0..<n {
        cs[i] = readLine()!.split(separator: " ").map { Int(String($0))! }
    }
    let destination = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    var isPossible = false
    dfs(start: home)
    print(isPossible ? "happy" : "sad")
    
    func dfs(start: [Int]) {
        if isPossible { return }
        // 목적지 도착하면 종료
        if canArrive(from: start, to: destination) {
            isPossible = true
            return
        }
        
        for i in 0..<n {
            if visit[i] { continue }
            if canArrive(from: start, to: [cs[i][0], cs[i][1]]) {
                visit[i] = true
                dfs(start: [cs[i][0], cs[i][1]])
            }
        }
    }
}

func canArrive(from: [Int], to: [Int]) -> Bool {
    return abs(from[0] - to[0]) + abs(from[1] - to[1]) <= 1000
}
