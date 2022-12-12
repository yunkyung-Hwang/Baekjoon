import Foundation

let n = Int(readLine()!)!
var town: [(Int, Int)] = []
var total = 0
var people = 0
for _ in 0..<n {
    let info = readLine()!.split(separator: " ").map { Int(String($0))! }
    town.append((info[0], info[1]))
    total += info[1]
}

for house in town.sorted(by: { $0.0 < $1.0 }) {
    people += house.1
    
    if people > total / 2 {
        print(house.0)
        break
    }
}
