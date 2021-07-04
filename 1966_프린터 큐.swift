import Foundation

let t = Int(readLine()!)!

for _ in 0..<t {
    let nm = (readLine()!.split(separator: " ").map{ Int($0)! })
    let m = nm[1]

    var importance = (readLine()!.split(separator: " ").map{ Int($0)! })
    var index  = Array(0...importance.count-1)
    var cnt = 0

    while true {  // while importance.count > 0
        if importance[0] == importance.max() {  // 첫번째 요소가 최대값인가
            if index[0] == m {  // 찾는 값인가
                print(cnt+1)
                break
            }
            else {  // 아님
                cnt += 1
                importance.removeFirst()
                index.removeFirst()
            }
        }
        else {  // 최대값 아님
            importance.append(importance[0])
            importance.removeFirst()
            index.append(index[0])
            index.removeFirst()
        }
    }
}
