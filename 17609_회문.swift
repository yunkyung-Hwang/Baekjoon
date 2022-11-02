import Foundation

let t = Int(readLine()!)!

for _ in 0..<t {
    let input = readLine()!.map { String($0) }
    var p1 = 0
    var p2 = input.count - 1
    var result = 0
    
    while p1 < p2 {
        if input[p1] != input[p2] {
            result += 1
            result += check(p1 + 1, p2, (p2 - p1 + 1)/2) || check(p1, p2 - 1, (p2 - p1 + 1)/2)
            ? 0 : 1
            break
        } else {
            p1 += 1
            p2 -= 1
        }
    }
    
    print(result)
    
    func check(_ p1: Int, _ p2: Int, _ cnt: Int) -> Bool {
        return input[p1...p1+cnt-1].joined() == input[p2-cnt+1...p2].reversed().joined()
    }
}

extension String {
    subscript(_ index: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: index)]
    }
}
