import Foundation

// 백트래킹
// 해를 찾는 도중 해가 아니어서 막히면 되돌아가서 다시 해를 찾아가는 기법
// 최적화 문제와 결정 문제를 푸는 방법으로 사용

// 15650 N과 M (2)
// N과 M (1) + 결과를 오름차순으로 정렬

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (nm[0], nm[1])
var result = [Int](repeating: -1, count: m)
var visit = [Bool](repeating: false, count: n+1)

dfs(0)

func dfs(_ depth: Int) {
    if depth >= m {
        print(result.map { String($0) }.joined(separator: " "))
        return
    }
    
    for i in 1...n {
        if visit[i] || (depth > 0 && result[depth - 1] > i) { continue }
        visit[i] = true
        result[depth] = i
        dfs(depth + 1)
        visit[i] = false
    }
}
