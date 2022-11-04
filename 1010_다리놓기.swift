import Foundation

let t = Int(readLine()!)!

for _ in 0..<t {
    let nm = readLine()!.split(separator: " ").map { Int($0)! }
    let n = nm[0]
    let m = nm[1]
  
    //mCn
    var result = 1
    for i in 0..<n {
        result *= (m-i)
        result /= i+1
    }
    print(result)
}
