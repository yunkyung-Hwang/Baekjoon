// swift 시간복잡도
// append() - 평균: O(1), 최악(메모리 재할당): O(N)
// popLast() - O(1) // return optional
// removeLast() - O(1) // not optional
// removeAll() - O(N)
// swapAt(_:_:) - O(1)
// sort(), sorted() - O(NlogN): MergeSort와 InsertionSort를 기반으로 만든 TimeSort 사용
import Foundation

let MAX = 1000000000
var numStack = [CLongLong]()
var command = [String](repeating: "", count: 100000)
var numStorage = [Int](repeating: 0, count: 100000)

var ci = 0, ni = 0
var isError = false

while true {
    ci = 0;
    ni = 0;
    while true {
        let c = readLine()!
        if c == "QUIT" { exit(0) }
        else if c == "END" { break }
        else if c.contains("NUM") {
            let num = c.components(separatedBy: " ")[1]
            numStorage[ni] = Int(num)!
            ni += 1
        }
        command[ci] = c
        ci += 1
    }
    
    let cnt = Int(readLine()!)!
    for _ in 0..<cnt {
        let num = CLongLong(readLine()!)!
        numStack.append(num)
        
        calculate()
        
        if isError || numStack.count != 1 || numStack.last! > MAX || numStack.last! < MAX * -1 {
            print("ERROR")
        } else {
            print(numStack.last!)
        }
        
        numStack.removeAll()
    }
    print()
}

func calculate() {
    ni = 0
    isError = false
    for i in 0..<ci {
        if command[i].contains("NUM") {
            numStack.append(CLongLong(numStorage[ni]))
            ni += 1
        } else if numStack.isEmpty {
            isError = true
            break
        } else if command[i] == "POP" {
            numStack.removeLast()
        } else if command[i] == "INV" {
            numStack.append(numStack.removeLast() * -1)
        } else if command[i] == "DUP" {
            numStack.append(numStack.last!)
        } else if command.count < 2{
            isError = true
            break
        } else if command[i] == "SWP" {
            numStack.swapAt(numStack.count - 2, numStack.count - 1)
        } else if command[i] == "ADD" {
            let n = numStack.removeLast()
            numStack.append(numStack.removeLast() + n)
        } else if command[i] == "SUB" {
            let n = numStack.removeLast()
            numStack.append(numStack.removeLast() - n)
        } else if command[i] == "MUL" {
            let n = numStack.removeLast()
            numStack.append(numStack.removeLast() * n)
        } else if command[i] == "DIV" {
            let n = numStack.removeLast()
            if n == 0 {
                isError = true
                break
            }
            numStack.append(numStack.removeLast() / n)
        } else if command[i] == "MOD" {
            let n = numStack.removeLast()
            if n == 0 {
                isError = true
                break
            }
            numStack.append(numStack.removeLast() % n)
        }
    }
}
