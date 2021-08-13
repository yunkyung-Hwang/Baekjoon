import Foundation

let nk = readLine()!.split(separator: " ").map{ Int($0)! }

let n = nk[0]
let k = nk[1]

var cnt = 0
var nums = [Bool](repeating: true, count: n+1)

var i = 2
Loop1 :
while i <= n {
    var j = 1
    Loop2 :
    while i * j <= n {
        if nums[i*j] {
            cnt += 1
        }
        nums[i*j] = false

        if cnt == k {
            print(i*j)
            break Loop1
        }
        j += 1
    }
    i += 1
}
