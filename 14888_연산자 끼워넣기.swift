import Foundation

let n = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").map{ Int($0)! }
var opr = readLine()!.split(separator: " ").map{ Int($0)! }
var maxResult = 1000000001 * -1
var minResult = 1000000001

func dfs(add:Int, sub: Int, mul: Int, div: Int, sum: Int, cnt: Int) {
    if cnt == n {
        maxResult = max(maxResult, sum)
        minResult = min(minResult, sum)
    }
    
    if add > 0 {
        dfs(add: add - 1, sub: sub, mul: mul, div: div, sum: sum + nums[cnt], cnt: cnt + 1)
    }
    if sub > 0 {
        dfs(add: add, sub: sub - 1, mul: mul, div: div, sum: sum - nums[cnt], cnt: cnt + 1)
    }
    if mul > 0 {
        dfs(add: add, sub: sub, mul: mul - 1, div: div, sum: sum * nums[cnt], cnt: cnt + 1)
    }
    if div > 0 {
        dfs(add: add, sub: sub, mul: mul, div: div - 1, sum: sum / nums[cnt], cnt: cnt + 1)
    }
}

dfs(add: opr[0], sub: opr[1], mul: opr[2], div: opr[3], sum: nums[0], cnt: 1)

print(maxResult)
print(minResult)
