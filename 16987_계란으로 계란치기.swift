import Foundation

// 16987_계란으로 계란치기

// 문제
// 계란마다 내구도와 무게가 정해져있다.
// 계란으로 계란을 치면 상대 계란의 무게만큼 내구도가 깎이고 내구도가 0이하가 되면 깨진다.
// 가장 왼쪽부터 차례로 한 번 씩만 다른 계란을 친다.
// 집은 계란으로 오른쪽 애들 중 하나를 친다.
// 집은 계란의 바로 오른쪽 계란을 들고 오른쪽 애들 중 하나를 친다.
// 최대한 많은 계란을 쳐야한다.

// 풀이
// 완전 탐색 dfs
// 하나 잡고 하나 깨고 ... 맨 오른쪽 계란 잡을때까지
// 맨 오른쪽 계란까지 오면 깨진 계란 수 세서 result 갱신
// 주의사항
// 깰 계란이 없을 때에도 dfs(idx: idx+1) 실행 -> 종료 조건까지 가서 개수 세야함

let n = Int(readLine()!)!
typealias Egg = (d: Int, w: Int)
var eggs = [Egg](repeating: (0, 0), count: n)
var result = 0
for i in 0..<n {
    let egg = readLine()!.split(separator: " ").map { Int(String($0))! }
    eggs[i] = (egg[0], egg[1])
}

dfs(idx: 0)
print(result)

// 집은 계란의 index
func dfs(idx: Int) {
    // 종료 조건. 마지막 계란을 잡았으면 종료
    if idx == n {
        var tmp = 0
        for i in 0..<n {
            if eggs[i].d <= 0 {
                tmp += 1
            }
        }
        result = max(result, tmp)
        return
    }
    
    var flag = false
    for i in 0..<n {
        if i != idx && eggs[idx].d > 0 && eggs[i].d > 0 {
            flag = true
            
            // 침
            eggs[i].d -= eggs[idx].w
            eggs[idx].d -= eggs[i].w
            
            // dfs
            dfs(idx: idx+1)
            
            // 취소
            eggs[i].d += eggs[idx].w
            eggs[idx].d += eggs[i].w
        }
    }
    
    if !flag { dfs(idx: idx+1) }
}
