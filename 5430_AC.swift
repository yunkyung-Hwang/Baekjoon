import Foundation

let t = Int(readLine()!)!
for _ in 0..<t {
    let command = Array(readLine()!)
    let n = Int(readLine()!)!
    var x = readLine()!
    x.removeFirst()
    x.removeLast()
    var nums = x.split(separator: ",").map { Int($0)! }
    var start = 0
    var removeLast = false
    var isError = false
    
    for c in command {
        if c == "R" {
            removeLast.toggle()
        } else { // "D"
            if nums.count == 0 {
                isError = true
                break
            } else if removeLast { nums.removeLast() }
            else { start += 1 }
        }
    }
    
    // output
    if start <= nums.count && !isError {
        if start == nums.count {
            print("[]")
        } else {
            let tmp = removeLast
            ? nums.reversed()[0..<nums.count - start]
            : nums[start..<nums.count]
            
            print("["+tmp.map { String($0) }.joined(separator: ",") + "]")            
        }
    } else {
        print("error")
    }
}
