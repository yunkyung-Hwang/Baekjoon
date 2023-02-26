import Foundation

// 백트래킹
// 해를 찾는 도중 해가 아니어서 막히면 되돌아가서 다시 해를 찾아가는 기법
// 최적화 문제와 결정 문제를 푸는 방법으로 사용

// 15651 N과 M (3)
// 같은 수를 여러번 골라도 된다.
// 방문 처리 빼기

// 풀이 1) dfs 백트래킹
// 단순히 방문 처리 빼고 다 돌기
// 시간초과
// 해결 -> (구글) 출력문 많이 돌려서 시간초과 / 출력 한 번으로 바꿈
// + map보다 타입 자체를 바꿈

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (nm[0], nm[1])
var result = [String](repeating: "", count: m)
var results = ""

dfs(0)
print(results)

func dfs(_ depth: Int) {
    if depth >= m {
        results += result.joined(separator: " ") + "\n"
        return
    }
    
    for i in 1...n {
        result[depth] = "\(i)"
        dfs(depth + 1)
    }
}
