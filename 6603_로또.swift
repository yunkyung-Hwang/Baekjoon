import Foundation

while true {
    let test = readLine()!.split(separator: " ").map { Int($0)! }
    if test[0] == 0 { break }
    
    var visit = [Bool](repeating: false, count: test[0])
    var result = [Int]()
    
    comb(cnt: 0, start: 0)
    print()

    func comb(cnt: Int, start: Int) {
        if cnt == 6 { print(result.map { String($0)}.joined(separator: " ")) }
        else {
            for i in start..<test[0] {
                if visit[i] { continue }
                visit[i] = true
                result.append(test[i + 1])
                comb(cnt: cnt+1, start: i)
                result.removeLast()
                visit[i] = false
            }
        }
    }
}
