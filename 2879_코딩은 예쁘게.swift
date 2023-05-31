import Foundation

// 인덴트 고치기
// 한 번의 실행으로 연속된 줄을 그룹으로 선택 & 선택된 줄의 앞에 탭 1개를 추가하거나 삭제
// 선택된 덩어리 중 단 한줄이라도 탭이 없으면 전체 다 삭제 불가
// 최소 몇번만에 고칠 수 있는지 구하기

let n = Int(readLine()!)!
let now = readLine()!.split(separator: " ").map { Int(String($0))! }
let goal = readLine()!.split(separator: " ").map { Int(String($0))! }
var tab = [Int](repeating: 0, count: n)

for i in 0..<n {
    tab[i] = now[i] - goal[i]
}

var result = abs(tab[n-1])
if n > 1 {
    for i in 1..<n {
        if tab[i] ^ tab[i-1] < 0 {
            result += abs(tab[i-1])
        } else if (tab[i] ^ (tab[i] - tab[i-1])) < 0 {
            result += abs(tab[i] - tab[i-1])
        }
    }
}
print(result)
