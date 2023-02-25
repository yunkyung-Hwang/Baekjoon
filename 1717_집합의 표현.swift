import Foundation

// **문제 조건**
// 합집합: a가 포함된 집합과 b가 포함된 집합을 합친다.
// 0, a, b
// 같은 집합에 있는가?
// 1, a, b

// **개념**
// 분리 집합
// 서로 중복되지 않는 부분 집합들로 나누어진 원소들에 대한 정보를 저장하고 조작하는 자료구조이다.
// 트리(배열, 연결리스트 등이 있지만 가장 효율적) 구조를 통해 구현한다.

// 유니온 파인드
// 두 노드가 같은 노드인지 판단하고
// 합집합 연산을 실행한다.

// 풀이 1)
// 시간 초과
// findParent: O(N)
// 최악 시간복잡도: O(NM) 100000000000 (천억)

// **해결**
// findParent의 시간복잡도를 줄인다. 경로를 압축한다.

//참고 https://velog.io/@mu1616/%EB%B6%84%EB%A6%AC%EC%A7%91%ED%95%A9Disjoint-set

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (nm[0], nm[1])
var parent = Array(0...n)

for _ in 0..<m {
    let cmd = readLine()!.split(separator: " ").map { Int(String($0))! }
    if cmd[0] == 0 {
        union(cmd[1], cmd[2])
    } else {
        print(findParent(cmd[1]) == findParent(cmd[2]) ? "YES" : "NO")
    }
}

func findParent(_ e: Int) -> Int {
    if parent[e] != e {
        parent[e] = findParent(parent[e])
    }
    return parent[e]
}

// 시간초과
// 재귀 O(n-1)
// func findParent(_ e: Int) -> Int {
//     if parent[e] != e {
//         return findParent(parent[e])
//     } else {
//         return e
//     }
// }

func union(_ n1: Int, _ n2: Int) {
    let p1 = findParent(n1)
    let p2 = findParent(n2)
    if p1 < p2 {
        parent[p2] = p1
    } else {
        parent[p1] = p2
    }
}
