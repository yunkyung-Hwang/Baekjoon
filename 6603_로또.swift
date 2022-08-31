import Foundation

var test = readLine()!.split(separator: " ").map { Int($0)! }
var visit = [Bool]()
var result = [Int]()

while test[0] != 0 {
    let k = test[0]
    for _ in 0..<k {
        visit.append(false)
    }
    test.removeFirst()
    comb(r: 0, n: 0)
    
    print()
    
    test.removeAll()
    visit.removeAll()
    test = readLine()!.split(separator: " ").map { Int($0)! }
}

func comb(r: Int, n: Int) {
    if r == 6 {
        print(result.map { String($0) }.joined(separator: " "))
    }
    
    for i in n..<test.count {
        if visit[i] { continue }
        visit[i] = true
        result.append(test[i])
        comb(r: r+1, n: i)
        result.removeLast()
        visit[i] = false
    }
}
