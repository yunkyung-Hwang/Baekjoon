import Foundation

// 17471_게리맨더링

// 문제
// 백준시는 N개의 구역으로 나뉘어있다.
// N개의 구역을 두 개로 나누어야한다.
// 각 그룹은 모두 연결되어있어야한다.
// 두 그룹의 인구 차이의 최소값을 구해라

// 풀이
// N <= 10, 각 구역 인구 수 <= 100
// 조합으로 t개 뽑고
// t개와 n-t개가 각각 연결되어있다면
// result = min(result, t개의 인구수 합 - (sum - t개의 인구수 합))

// 시간복잡도
// 조합 전체 경우를 구하는건 2^N이지만 N이 10이니까 ㄱㅊ
// k명(1..<n)을 뽑고 O(min(n^k, n^(n-k)))
// k명에 대해서 bfs 돌리고
// n-k명에 대해서 bfs 돌리고
// 값 초기화
// O(n * n + n^2 * n + n^3 * n + .. + n^5 * n)
// O(n^(n/2)*n) = O(10^6) = O(1000000)

let n = Int(readLine()!)!
let population = [0] + readLine()!.split(separator: " ").map { Int(String($0))! }
let sum = population.reduce(0, +)
var graph = [[Int]](repeating: [Int](), count: n+1)
var result = Int.max

for i in 1...n {
    let tmp = readLine()!.split(separator: " ").map { Int(String($0))! }
    if tmp[0] == 0 { continue }
    for j in 1...tmp[0] {
        graph[i].append(tmp[j])
    }
}

for i in 1..<n {
    let group1 = combination(Array(1...n), i)
    for j in 0..<group1.count {
        let cnt1 = isConnected(group1[j])
        if cnt1 == -1 { continue }
        
        var group2 = [Int]()
        for k in 1...n { if !group1[j].contains(k) { group2.append(k) } }
        
        let cnt2 = isConnected(group2)
        if cnt2 == -1 { continue }
        
        result = min(result, abs(cnt1 - cnt2))
    }
}
print(result == Int.max ? -1 : result)

// 연결되어있다면 연결된 구역의 인구수를, 연결안되어있으면 -1을 반환
func isConnected(_ group: [Int]) -> Int {
    var queue = [group[0]]
    var visit = [Bool](repeating: false, count: n+1)
    var cnt = 0
    var qIdx = 0
    var peopleCnt = 0
    while qIdx < queue.count {
        let node = queue[qIdx]
        qIdx += 1
        visit[node] = true
        cnt += 1
        peopleCnt += population[node]
        
        for i in 0..<graph[node].count {
            if !visit[graph[node][i]] && group.contains(graph[node][i]) {
                visit[graph[node][i]] = true
                queue.append(graph[node][i])
            }
        }
    }
    
    return cnt == group.count ? peopleCnt : -1
}

func combination<T: Comparable>(_ array: [T], _ n: Int) -> [[T]] {
    var result = [[T]]()
    if array.count < n { return result }
    func comb(_ index: Int, _ now: [T]) {
        if now.count == n {
            result.append(now)
            return
        }
        
        for i in index..<array.count {
            comb(i + 1, now + [array[i]])
        }
    }
    
    comb(0, [])
    
    return result
}
