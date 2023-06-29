// 12904_A와 B

// 문제
// - 문자열 뒤에 A를 추가한다.
// - 문자열을 뒤집고 뒤에 B를 추가한다.
// 위 조건만으로 S를 T로 바꿀 수 있는가 구하기

// 풀이 1) dfs -> 시간초과
// 조건에 추가밖에 없으므로
// s <= t인 동안 dfs

// 풀이 2)
// 두 조건 모두 뒤에 A or B를 붙임
// 그냥 t에서 삭제해나가다가 길이가 같아졌을때 판단만 하면 됨

let s = readLine()!
var t = readLine()!.map { String($0) }

while s.count != t.count {
    let last = t.removeLast()
    if last == "B" {
        t.reverse()
    }
}
print(s == t.joined() ? 1 : 0)
