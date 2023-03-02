import Foundation

// 4256 트리

// 문제
// 이진트리 - 왼쪽 자식이 순서가 먼저
// BT: 노드 n개로 이루어진 이진트리
// 각 노드는 1부터 n까지 번호
// 리프노드: 자식이 없는 마지막 노드
// 노드 순회 방법
// 1. 전위 순회: 가 왼 오 순서로 방문
// 2. 중위 순회: 왼 가 오 순서로 방문
// 3. 후위 순회: 왼 오 가 순서로 방문
// 전위, 중위순회로 만든 리스트가 주어질 때 이 결과를 가지고 다시 BT를 만들 수 있다.
// 후위 순회했을때의 결과를 출력하시오.

//   3
// 6   7
// 전위: 3 6 7
// 중위: 6 3 7
// 후위: 6 7 3

// 풀이
// 전위: 규칙 파악 (현재 인덱스 + 1 = 현재 왼쪽 트리의 루트)
// 중위: 노드의 순서 파악 (깊이 제외 왼 오)
// 루트 노드 0 부터 왼 오로 트리를 쪼개서 dfs


let t = Int(readLine()!)!

for _ in 0..<t {
    let n = Int(readLine()!)!
    let preorder = readLine()!.split(separator: " ").map { Int(String($0))! }
    let inorder = readLine()!.split(separator: " ").map { Int(String($0))! }
    var result = ""
    dfs(0, 0, n)
    
    func dfs(_ r: Int, _ s: Int, _ e: Int) {
        for i in s..<e{
            if preorder[r] == inorder[i] {  // 현재 루트 노드의 순서를 찾으면
                // 후위 순회: 왼 오 가
                // dfs로 왼쪽 오른쪽 끝까지 돌기
                dfs(r + 1, s, i)                // 루트(r) 왼쪽 / 루트 + 1
                dfs(r + i - s + 1, i + 1, e)    // 루트(r) 오른쪽 / 왼쪽 트리 크기 + 1
                result += "\(preorder[r]) "
            }
        }
    }
    print(result)
}
