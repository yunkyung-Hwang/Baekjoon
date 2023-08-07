import Foundation

// 2212_센서

// 문제
// n개의 센서, k개의 집중국

// 풀이
// 1 3 6 7 9
// I   I     I I   I
// 1 2 3 4 5 6 7 8 9

let n = Int(readLine()!)!
let k = Int(readLine()!)!
let sensors = Set(readLine()!.split(separator: " ").map { Int(String($0))! }).map { $0 }.sorted()
var distance = [Int]()
var result = n > 1 ? sensors.last! - sensors.first! : 1

var prev = sensors[0]
for i in 1..<sensors.count {
    distance.append(sensors[i]-prev)
    prev = sensors[i]
}

if n > k {
    distance.sort(by: >)
    for i in 0..<k-1 {
        result -= distance[i]
    }
    print(result)
} else {
    print(0)
}
