import Foundation

let ns = readLine()!.split(separator: " ").map{ Int($0)! }
let n = ns[0]
let s = ns[1]
let nums = readLine()!.split(separator: " ").map{ Int($0)! }
var visit = [Bool](repeating: false, count: nums.count)
var result = 0
var sum = 0

dfs(cnt: 0, idx: 0)
print(result)

func dfs(cnt: Int, idx: Int) {
    if sum == s && cnt > 0 {
        result += 1
    }
    
    for i in idx..<n {
        if visit[i] { continue }
        visit[i] = true
        sum += nums[i]
        dfs(cnt: cnt + 1, idx: i)
        visit[i] = false
        sum -= nums[i]
    }
}

