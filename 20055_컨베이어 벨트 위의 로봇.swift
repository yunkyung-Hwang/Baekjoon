import Foundation

let nk = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nk[0]
let k = nk[1]
var a = readLine()!.split(separator: " ").map { Int(String($0))! }
var isRobotOn = [Bool](repeating: false, count: 2 * n)
var result = 0
var cnt = 0

while cnt < k {
    result += 1
    rotateBelt()
    if moveRobot() { break }
    if putRobot() { break }
}
print(result)

func rotateBelt() {
    a.insert(a.removeLast(), at: 0)
    isRobotOn.insert(false, at: 0)
    isRobotOn.removeLast()
}

func moveRobot() -> Bool {
    isRobotOn[n-1] = false
    for i in 0..<n-1 {
        if isRobotOn[n-2-i] && a[n-1-i] > 0 && !isRobotOn[n-i-1] {
            isRobotOn[n-1-i] = true
            isRobotOn[n-2-i] = false
            a[n-i-1] -= 1
            if a[n-i-1] == 0 { cnt += 1 }
        }
    }
    
    return cnt >= k
}

func putRobot() -> Bool {
    if a[0] != 0 {
        isRobotOn[0] = true
        a[0] -= 1
        if a[0] == 0 { cnt += 1 }
    }
    
    return cnt >= k
}
