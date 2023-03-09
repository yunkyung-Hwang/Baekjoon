import Foundation

// 18428 감시 피하기

// 문제
// N x N으로 이루어진 칸에 선생님(T), 학생(S), 장애물(O)이 위치한다.
// 선생님은 인접한 상하좌우 칸을 감시한다. 장애물 뒤 편은 볼 수 없지만 장애물이나 벽 전까지 모든 칸을 볼 수 있다.
// 복도에 3개의 장애물을 설치하여 모든 학생을 감시로부터 벗어나게 해야한다.
// 가능한지 출력

// 조건
// 3 <= N <= 6
// 선생님 <= 5명
// 전체 학생 수 <= 30명
// 항상 빈칸 3개 이상
// 3 <= 빈칸 수 <= 34

// 조합으로 벽을 설치할 수 있는 모든 경우 구하고
// 해당 경우마다 가능한지 판단 (선생님 기준으로 벽 보기 전까지 학생 보는지 확인)

// 시간복잡도
// 조합 C(n,k) = n Choose k = n! / ((n-k)! * k!)
// 조합 개수: 약 6000
// 조합 * 조합 개수 * 선생님 수
// O(조합 * 6000 * 5)

let n = Int(readLine()!)!
var graph = [[String]](repeating: [String](repeating: "X", count: n), count: n)
var xArr = [[Int]]()
var teachers = [[Int]]()
for i in 0..<n {
    graph[i] = readLine()!.split(separator: " ").map { String($0) }
    for j in 0..<n {
        if graph[i][j] == "X" {
            xArr.append([i, j])
        } else if graph[i][j] == "T" {
            teachers.append([i, j])
        }
    }
}

let dx = [-1, 0, 1, 0]
let dy = [0, -1, 0, 1]

combination(xArr, 3).forEach { x in
    for i in 0..<3 {
        graph[x[i][0]][x[i][1]] = "O"
    }
    var flag = true
    teachers.forEach {
        if !check(x: $0[0], y: $0[1]) { flag = false }
    }
    if flag {
        print("YES")
        exit(0)
    }
    for i in 0..<3 {
        graph[x[i][0]][x[i][1]] = "X"
    }
}

print("NO")

func check(x: Int, y: Int) -> Bool {
    for i in 0..<4{
        var px = x + dx[i], py = y + dy[i]
        while 0..<n ~= px && 0..<n ~= py {
            if graph[px][py] == "S" {
                return false
            } else if graph[px][py] == "O" {
                break
            }
            px += dx[i]
            py += dy[i]
        }
    }

    return true
}

func combination<T>(_ array: [T], _ n: Int) -> [[T]] {
    var result = [[T]]()
    if array.count < n { return result }
    func comb(_ index: Int, _ now: [T]) {
        if now.count == n {
            result.append(now)
            return
        }
        
        for i in index..<array.count {
            comb(i + 1, now + [array[i]])
        }
    }
    
    comb(0, [])
    
    return result
}
