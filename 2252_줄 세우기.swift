import Foundation

// 2252 줄 세우기

// 문제
// n명의 학생을 키 순서대로 줄을 세울 것이다.
// 일부 두 학생의 키를 비교하는 방법으로 줄 세울것

// 풀이
// 위상정렬: 순환이 없는 방향성 있는 그래프
// 대학의 선수과목 처럼 순서가 정해져있는 작업을 차례로 수행할 때 순서를 결정해주는 알고리즘
// inDegree(해당 노드로 들어오는 간선의 개수)가 0인 노드를 큐에 넣는다.
// n개의 노드를 모두 방문한다. n개를 모두 방문하기 전에 큐가 비어버리면 사이클이 발생한 것

// 시간복잡도
// O(V+E): 정점의 개수 + 간선의 개수

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (nm[0], nm[1])
var graph = [[Int]](repeating: [Int](), count: n+1)
var inDegree = [Int](repeating: 0, count: n+1)
var result = ""

for _ in 0..<m {
    let line = readLine()!.split(separator: " ").map { Int(String($0))! }
    graph[line[0]].append(line[1])
    inDegree[line[1]] += 1
}

var queue = [Int]()

for i in 1...n {
    // 들어오는 간선의 개수가 0인 노드들, 제일 작은 노드들
    if inDegree[i] == 0 { queue.append(i) }
}

// n번만 전체 탐색하면 됨. visit 선언할 필요 X
for _ in 0..<n {
//    n개를 모두 방문하기 전에 큐가 비어있으면 사이클 존재
//    애초에 위상 정렬 문제니까 필요 없음
//    if queue.isEmpty { break }
    
    // 들어오는 간선의 개수가 0개인 애들 중
    let node = queue.removeFirst()
    result += "\(node) "
    
    // 들어오는 간선의 개수가 0개인 애들과 연결 된 애들의 inDegree 값을 -1
    // 해당 노드의 inDegree가 0이라면 큐에 추가
    for i in 0..<graph[node].count {
        inDegree[graph[node][i]] -= 1
        if inDegree[graph[node][i]] == 0 { queue.append(graph[node][i]) }
    }
}

print(result)
