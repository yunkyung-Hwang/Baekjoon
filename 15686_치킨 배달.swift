import Foundation

// 15686_치킨 배달

// 풀이 1) 시간초과
// 조합으로 치킨집들을 구하기
// bfs 실행해서 거리 구하기
// 시간초과

// 해결
// 치킨 거리를 구하기 위해서 bfs 실행할 필요 없음
// 그냥 집들이랑 거리 계산해서 최솟값 갱신하면 됨. 바ㅏ보

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (nm[0], nm[1])
let dx = [0,0,1,-1]
let dy = [-1,1,0,0]
typealias Position = (x: Int, y: Int)
var chickenStore = [Position]()
var houses = [Position]()
var result = Int.max

for i in 0..<n {
    let map = readLine()!.split(separator: " ").map { Int(String($0))! }
    for j in 0..<n {
        if map[j] == 1 {
            houses.append((i, j))
        } else if map[j] == 2 {
            chickenStore.append((i, j))
        }
    }
}

combination(chickenStore, m).forEach {
    var distance = 0
    for house in houses {
        var tmp = Int.max
        for chicken in $0 {
            tmp = min(tmp, getDistance(chicken, house))
        }
        distance += tmp
    }
    
    result = min(result, distance)
}

print(result)


func getDistance(_ from: (Int, Int), _ to: (Int, Int)) -> Int {
    return abs(from.0 - to.0) + abs(from.1 - to.1)
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


// 풀이 1) bfs 시간초과
// import Foundation

// let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
// let (n, m) = (nm[0], nm[1])
// var graph = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
// let dx = [0,0,1,-1]
// let dy = [-1,1,0,0]
// var chickenStore = [[Int]]()
// var result = Int.max

// for i in 0..<n {
//     graph[i] = readLine()!.split(separator: " ").map { Int(String($0))! }
//     for j in 0..<n { if graph[i][j] == 2 { chickenStore.append([i, j]) } }
// }

// combination(chickenStore, m).forEach {
//     var tmp = 0
//     for i in 0..<n {
//         for j in 0..<n {
//             if graph[i][j] == 1 { tmp += bfs((i, j), $0) }
//         }
//     }
//     result = min(result, tmp)
// }

// print(result)

// func bfs(_ home: (Int, Int), _ store: [[Int]]) -> Int {
//     var queue = [(home.0, home.1)]
//     var visit = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
    
//     while !queue.isEmpty {
//         let node = queue.removeFirst()
//         let x = node.0, y = node.1
        
//         for i in 0..<4 {
//             let px = x + dx[i]
//             let py = y + dy[i]
            
//             if 0..<n ~= px && 0..<n ~= py && !visit[px][py] {
//                 visit[px][py] = true
//                 queue.append((px, py))
//                 if store.contains([px, py]) {
//                     return getDistance(home, (px, py))
//                 }
//             }
//         }
//     }
//     return 0
// }

// func getDistance(_ from: (Int, Int), _ to: (Int, Int)) -> Int {
//     return abs(from.0 - to.0) + abs(from.1 - to.1)
// }

// func combination<T>(_ array: [T], _ n: Int) -> [[T]] {
//     var result = [[T]]()
//     if array.count < n { return result }
//     func comb(_ index: Int, _ now: [T]) {
//         if now.count == n {
//             result.append(now)
//             return
//         }
        
//         for i in index..<array.count {
//             comb(i + 1, now + [array[i]])
//         }
//     }
    
//     comb(0, [])
    
//     return result
// }
