import Foundation

while true {
    let input = readLine()!.map { String($0) }
    if input.count == 1 && input.first == "." { break }
    var stack: [String] = []
    var result = true
    
    for input in input {
        if input == "(" || input == "[" {
            stack.append(input)
        } else if input == ")" {
            if stack.isEmpty || stack.removeLast() != "(" { result = false }
        } else if input == "]" {
            if stack.isEmpty || stack.removeLast() != "[" { result = false }
        }
    }
    if !stack.isEmpty { result = false }
    print(result ? "yes" : "no")
}
