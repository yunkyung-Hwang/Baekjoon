import Foundation

let abc = readLine()!.split(separator: " ").map { Int($0)! }

print(bfs(A: abc[0], B: abc[1], C: abc[2]).map{String($0)}.joined(separator: " "))

func bfs(A: Int, B: Int, C: Int) -> [Int] {
    var visit = [[Bool]](repeating: [Bool](repeating: false, count: B+1), count: A+1)
    var q = [(0, 0)]
    while !q.isEmpty {
        let node = q.removeFirst()
        let a = node.0
        let b = node.1
        let c = C - node.0 - node.1
        
        if visit[a][b] { continue }
        visit[a][b] = true
        
        if a > 0 {
            if a >= B-b { q.append((a-B+b, B)) }
            else { q.append((0, b+a))}
            if a >= C-c { q.append((a-C+c, b)) }
            else { q.append((0, b))}
        }
        if b > 0 {
            if b >= A-a { q.append((A, b-A+a)) }
            else { q.append((a+b, 0))}
            if b >= C-c { q.append((a, b-C+c)) }
            else { q.append((a, 0))}
        }
        if c > 0 {
            if c >= B-b { q.append((a, B)) }
            else { q.append((a, b+c))}
            if c >= A-a { q.append((A, b)) }
            else { q.append((a+c, b))}
        }
    }
    var result = Set<Int>()
    for b in 0..<B+1 where visit[0][b] { result.insert(C-b) }
    return Array(result).sorted()
}
