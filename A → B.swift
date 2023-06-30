// 16953_A → B

let ab = readLine()!.split(separator: " ").map { Int(String($0))! }
let a = ab[0]
var b = ab[1]

print(solve())

func solve() -> Int {
    var result = 1

    while b > a {
        result += 1
        if b % 2 == 0 {
            b /= 2
        } else if let last = String(b).last,
                  last == "1" {
            b /= 10
        } else {
            break
        }
    }
    return a == b ? result : -1
}
