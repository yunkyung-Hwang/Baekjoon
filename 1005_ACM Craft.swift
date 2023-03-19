import Foundation

// 1005_ACM Craft

// 문제
// ACM Craft라는 게임이 발매되었다.
// 건물을 지어야하는 선행 순서가 주어진다.
// 건물 짓기는 동시에 진행될 수 있으며 바로 이전 선행 순서의 애들이 모두 끝날때까지 기다려야한다.
// 특정 건물을 짓기까지 걸리는 최소 시간 구하기

// 풀이 1) 위상정렬
// W건물을 짓기 위한 최소 시간 구하기
// 건설 규칙 K개 존재
// D: i번째 건물 건설 소요 시간
// 건설 소요 시간을 DP로 저장, 현재 노드로 들어오는 노드들 중 최대 시간을 

// 시간초과)
// w까지 가는 길 말고 모든 길을 다 봤더니 시간초과
// w에 도착하면 종료 -> 54% 시간초과
// 거지같은 입출력시간, FileIO 추가

final class FileIO {
    private let buffer:[UInt8]
    private var index: Int = 0

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        
        buffer = Array(try! fileHandle.readToEnd()!)+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }

        return buffer[index]
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45 { isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }

    @inline(__always) func readString() -> String {
        var now = read()

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
        let beginIndex = index-1

        while now != 10,
              now != 32,
              now != 0 { now = read() }

        return String(bytes: Array(buffer[beginIndex..<(index-1)]), encoding: .ascii)!
    }

    @inline(__always) func readByteSequenceWithoutSpaceAndLineFeed() -> [UInt8] {
        var now = read()

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
        let beginIndex = index-1

        while now != 10,
              now != 32,
              now != 0 { now = read() }

        return Array(buffer[beginIndex..<(index-1)])
    }
}

let fileIO = FileIO()
let t = fileIO.readInt()
for _ in 0..<t {
    var nk = [0, 0]
    for i in 0..<2 { nk[i] = fileIO.readInt() }
    let (n, k) = (nk[0], nk[1])
    typealias Building = (num: Int, cost: Int)
    // i번째 노드와 연결된(가리키는) 노드들
    var graph = [[Building]](repeating: [Building](), count: n+1)
    // i번째 노드로 들어오는 간선의 개수
    var inDegree = [Int](repeating: 0, count: n+1)
    var costDP = [Int](repeating: 0, count: n+1)
    for i in 1...n { costDP[i] = fileIO.readInt() }
    for _ in 0..<k {
        var line = [0, 0]
        for i in 0..<2 { line[i] = fileIO.readInt() }
        graph[line[0]].append((line[1], costDP[line[1]]))
        inDegree[line[1]] += 1
    }
    let w = fileIO.readInt()
    
    var queue = [Int]()
    for i in 1...n {
        // 시작 노드 찾기
        if inDegree[i] == 0 { queue.append(i) }
    }
    
    for _ in 0..<n {
        let node = queue.removeFirst()
        
        for i in 0..<graph[node].count {
            inDegree[graph[node][i].num] -= 1
            if inDegree[graph[node][i].num] == 0 {
                queue.append(graph[node][i].num)
            }
            
            costDP[graph[node][i].num] = max(costDP[graph[node][i].num],
                                             graph[node][i].cost + costDP[node])
        }
        if node == w { break }
    }
    
    print(costDP[w])
}
