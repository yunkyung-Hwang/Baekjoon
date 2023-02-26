import Foundation

// **백트래킹**
// 해를 찾는 도중 해가 아니어서 막히면 되돌아가서 다시 해를 찾아가는 기법
// 최적화 문제와 결정 문제를 푸는 방법으로 사용

// 15649 N과 M (1)
// 1부터 N까지 자연수 중에서 중복 없이 M개를 고른 수열
// 사전순으로 출력
// N , M <= 8

// **풀이**
// dfs를 통한 순열 구현
// 어차피 길이가 m으로 정해져있으니 result 배열을 만들고 dfs로 해당 depth값을 초기화

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (nm[0], nm[1])
var result = [Int](repeating: -1, count: m)
var visit = [Bool](repeating: false, count: n+1)

dfs(0)

func dfs(_ depth: Int) {
    if depth >= m {
        print(result.lazy.map { String($0) }.joined(separator: " "))
        return
    }
    
    for i in 1...n {
        if visit[i] { continue }
        visit[i] = true
        result[depth] = i
        dfs(depth + 1)
        visit[i] = false
    }
}
