import Foundation

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nm[0]
let m = nm[1]
var party = [[Int]](repeating: [Int](repeating: 0, count: n+1), count: n+1)

for i in 1...n {
    let tmp = readLine()!.split(separator: " ").map { Int(String($0))! }
    for j in 1...n {
        party[i][j] = tmp[j-1]
    }
}

for k in 1...n {
    for i in 1...n {
        for j in 1...n {
            party[i][j] = min(party[i][j], party[i][k] + party[k][j])
        }
    }
}

for _ in 0..<m {
    let people = readLine()!.split(separator: " ").map { Int(String($0))! }
    print(party[people[0]][people[1]] <= people[2] ? "Enjoy other party" : "Stay here")
}
