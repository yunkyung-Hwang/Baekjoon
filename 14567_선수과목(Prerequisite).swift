import Foundation

// 14567_선수과목(Prerequisite)

// 문제
// 개설된 전공을 모두 들어야한다.
// 특정 과목들은 선수과목이 존재한다.
// 한 학기에 들을 수 있는 과목 수에는 제한이 없고 모든 과목은 매 학기 개설된다.
// 최소 몇학기가 걸리는지 구하기

// 풀이) 위상정렬
// 특정 노드로 들어오는 개수가 0인 애들부터 시작
// 큐를 돌면서 해당 노드가 가리키는 애들의 inDegree -= 1
// inDegree == 0이면 큐에 넣기

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (nm[0], nm[1])
var inDegree = [Int](repeating: 0, count: n+1)      // n번 노드로 들어오는 간선 개수
var graph = [[Int]](repeating: [Int](), count: n+1) // n번 노드가 가리키고 있는 노드들
var semester = [Int](repeating: 1, count: n+1)

for _ in 0..<m {
    let sbj = readLine()!.split(separator: " ").map { Int(String($0))! }
    inDegree[sbj[1]] += 1
    graph[sbj[0]].append(sbj[1])
}

var queue = [Int]()
for i in 1...n {
    if inDegree[i] == 0 { queue.append(i) }
}

var qIdx = 0
while qIdx < queue.count {
    let node = queue[qIdx]
    qIdx += 1
    
    for i in 0..<graph[node].count {
        inDegree[graph[node][i]] -= 1
        if inDegree[graph[node][i]] == 0 {
            queue.append(graph[node][i])
            semester[graph[node][i]] = semester[node] + 1
        }
    }
}

print(semester[1...n].map { String($0) }.joined(separator: " "))
