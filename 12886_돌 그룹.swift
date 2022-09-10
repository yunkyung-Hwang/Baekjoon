import Foundation

var rocks = readLine()!.split(separator: " ").map { Int($0)! }

while true {
    let minIdx = rocks.firstIndex(of: rocks.min()!)!
    let maxIdx = rocks.firstIndex(of: rocks.max()!)!
    
    let minTmp = rocks[minIdx]
    let maxTmp = rocks[maxIdx]
    
    rocks[maxIdx] -= rocks[minIdx]
    rocks[minIdx] *= 2
    
    if rocks[maxIdx] == minTmp && rocks[minIdx] == maxTmp {
        print(0)
        break
    } else if rocks[0] == rocks[1] && rocks[1] == rocks[2] {
        print(1)
        break
    }
}
