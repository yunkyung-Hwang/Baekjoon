import Foundation

let mn = readLine()!
let mnArr = mn.components(separatedBy: " ")

let m = Int(mnArr[0])!
let n = Int(mnArr[1])!

var nums = [Bool](repeating: true, count: 1000001)
nums[1] = false

var i = 2
while i <= n {
    var j = 2
    while i * j <= n {
        nums[i*j] = false
        j += 1
    }
    i += 1
}

for i in m...n {
    if nums[i]{
        print(i)
    }
}
