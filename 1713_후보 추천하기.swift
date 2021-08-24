import Foundation

let n = Int(readLine()!)!
let recommend = Int(readLine()!)!
let studentNum = (readLine()!.split(separator: " ")).map{ Int($0)! }

var candidate = [[Int]]()

Loop1 :
for rec in studentNum {
    Loop2 :
    for i in 0..<candidate.count {
        if rec == candidate[i][0] { // 겹치는게 존재하면
            candidate[i][1] += 1
            continue Loop1
        }
    }
    
    if candidate.count >= n {    // 넘칠때 삭제
        let min = candidate.sorted(by: {$0[1] < $1[1]})[0]
        candidate.remove(at: candidate.firstIndex(of: min)!)
    }
    
    candidate.append([rec,1])
}


candidate = candidate.sorted(by: {$0[0] < $1[0]})
for i in 0..<candidate.count {
    print(candidate[i][0], terminator: " ")
}
