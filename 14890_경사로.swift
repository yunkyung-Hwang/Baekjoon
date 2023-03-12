import Foundation

// 14890 경사로

// 문제
// 칸의 높이가 적힌 N x N 지도가 주어진다.
// 한 쪽 끝에서 다른 쪽 끝까지 지나갈 수 있는 길
// 높이가 다를 경우 경사로가 필요하다
// 경사로의 높이는 항상 1이며 길이는 L로 고정이고 경사로를 설치하려면 L만큼의 높이가 모두 동일해야한다.
// 경사로는 겹쳐서 두거나 넘쳐서 둘 수 없다.
// 경사로의 개수는 제한이 없다.
// 지나갈 수 있는 길의 개수 구하기

// 풀이
// 지나갈 수 있는 길의 개수를 구하래 not 최대 개수 -> 그럼 경사로를 겹쳐서 놓는 경우를 고려 안해도 되나?
// 놓을 수 있는 곳에 다 놓아보기
// 가로 줄, 세로 줄 따로 탐색
// 단순 구현

let nl = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, l) = (nl[0], nl[1])
var hMap = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
var vMap = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
for i in 0..<n {
    hMap[i] = readLine()!.split(separator: " ").map { Int(String($0))! }
    for j in 0..<n { vMap[j][i] = hMap[i][j] }
}
var result = 0

calculate(map: hMap)
calculate(map: vMap)

print(result)

func calculate(map: [[Int]]) {
    for i in 0..<n {
        var height = map[i][0]
        var cnt = 1
        var flag = true
        var j = 1
        while j < n {
            if map[i][j] == height {
                cnt += 1
            } else if map[i][j] - height == 1 {
                if cnt < l {
                    flag = false
                    break
                } else {
                    height = map[i][j]
                    cnt = 1
                }
            } else if height - map[i][j] == 1 {
                cnt = 0
                height = map[i][j]
                while j < n && map[i][j] == height {
                    cnt += 1
                    j += 1
                    if cnt >= l { break }
                }
                if cnt < l {
                    flag = false
                    break
                }
                j -= 1
                cnt = 0
            } else {
                flag = false
                break
            }
            j += 1
        }
        if flag {
            result += 1
        }
    }
}
