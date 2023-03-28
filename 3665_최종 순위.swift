import Foundation

// 3665_최종 순위

// 문제
// 대회에 작년과 동일한 n개의 팀이 참가했다.
// 예선 결과를 작년 순위와 작년에 비해 상대적인 순위가 바뀐 팀들만 알려준다.
// 이 순위를 보고 올해 순위를 만드는 프로그램을 구하시오
// 순환이 있을 수 있거나 순위를 만들 수 없는 경우도 주어진다.

// 풀이
// 누가 누구보다 앞섰는지 정보를 줌 -> 위상정렬
// 항상 옳은 정보만 주어지는 것은 아님.
// 확실한 순위를 찾을 수 없다 -> 누가 먼저인지 모르는 애들이 존재한다.
// 일관성이 없어서 순위를 정할 수 없다 -> 순환이 존재한다.

let t = Int(readLine()!)!
for _ in 0..<t {
    let n = Int(readLine()!)!
    let lastYear = readLine()!.split(separator: " ").map { Int(String($0))! }
    let m = Int(readLine()!)!
    var graph = [[Bool]](repeating: [Bool](repeating: false, count: n+1), count: n+1)
    var inDegree = [-1] + [Int](repeating: 0, count: n)

    for i in 0..<n-1 {
        for j in i+1..<n {
            graph[lastYear[i]][lastYear[j]] = true
            inDegree[lastYear[j]] += 1
        }
    }

    for _ in 0..<m {
        let line = readLine()!.split(separator: " ").map { Int(String($0))! }
        let a = line[0], b = line[1]
        if graph[a][b] {
            graph[a][b] = false
            graph[b][a] = true
            inDegree[a] += 1
            inDegree[b] -= 1
        } else {
            graph[a][b] = true
            graph[b][a] = false
            inDegree[a] -= 1
            inDegree[b] += 1
        }
    }

    var queue = [Int]()
    for i in 1...n {
        if inDegree[i] == 0 {
            queue.append(i)
        }
    }

    var result = ""
    for _ in 0..<n {
        if queue.isEmpty {
            result = "IMPOSSIBLE"
            break
        }

        if queue.count > 1 {
            result = "?"
            break
        }

        let node = queue.removeFirst()
        result += "\(node) "

        for i in 1...n {
            if graph[node][i] {
                inDegree[i] -= 1
                if inDegree[i] == 0 { queue.append(i) }
            }
        }
    }
    print(result)
}
