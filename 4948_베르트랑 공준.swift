import Foundation

var n = 1

while true {
    n = Int(readLine()!)!
    if n == 0{
        break
    }
    
    var cnt = 0
    var nums = [Bool](repeating: true, count: 1000001)
    nums[1] = false

    var i = 2
    while i <= n*2 {
        var j = 2
        while i * j <= n*2 {
            nums[i*j] = false
            j += 1
        }
        i += 1
    }

    for i in n+1...n*2 {
        if nums[i]{
            cnt+=1
        }
    }
    print(cnt)
}
