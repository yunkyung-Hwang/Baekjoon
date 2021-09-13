import Foundation

let nm = (readLine()!.split(separator: " ")).map { Int($0)! }
let n = nm[0]
let m = nm[1]

let rcd = (readLine()!.split(separator: " ")).map { Int($0)! }
var r = rcd[0]
var c = rcd[1]
var d = rcd[2]

let dir = [[-1,0],[0,1],[1,0],[0,-1]]   // 북동남서
var area = Array(repeating: Array(repeating: 1, count: m), count: n)

for i in 0..<n {
    area[i] = (readLine()!.split(separator: " ")).map{ Int($0)! }
}

var cnt = 1
area[r][c] = 2

var tmp = 0
var check = 0

while true {
    // 방향 d 설정
    if d == 0 { tmp = 3 }
    else { tmp = d - 1 }
    
    if area[r+dir[tmp][0]][c+dir[tmp][1]] == 0 {    // 현재의 왼쪽이 청소가 안되어있으면
        // 이동후
        check = 0
        d = tmp
        r += dir[d][0]
        c += dir[d][1]
        // 청소
        cnt += 1
        area[r][c] = 2  // 청소 완료    // 0 : 청소 안된 빈칸, 1 : 벽, 2 : 청소 된 빈칸
    } else {    // 청소 되어있거나 벽이면 회전
        if check != 4 { // 한 바퀴 돌기 전
            if d == 0 { d = 3 }
            else { d -= 1 }
            check += 1
        } else {    // 한 바퀴 돌았는데 빈칸 없으면
            if area[r-dir[d][0]][c-dir[d][1]] == 1 {    // 뒤에가 벽이면 끝
                break
            } else {    // 아니면 후진 후 반복
                check = 0
                r -= dir[d][0]
                c -= dir[d][1]
            }
        }
    }
}

print(cnt)
