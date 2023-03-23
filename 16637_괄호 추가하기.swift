import Foundation

// 16637_괄호 추가하기

// 문제
// 길이가 N인 수식이 있다.
// 수식은 0~9와 +, -, x로 이루어져있다.
// 연산자 우선순위는 모두 동일하다. 왼쪽에서부터 순서대로 계산한다.
// 단, 수식에 연산자 하나만 들어있도록 괄호를 추가할 수 있고 추가하면 괄호 먼저 계산한다.
// 식의 최대값 구하기

// 풀이
// 완전탐색 아니면 dp같은데
// 완전탐색 시간복잡도 먼저 확인 -> 길이 N <= 19
// 괄호는 ceil((N / 2) / 2)개 존재 -> 최대 5개
// 2^5만큼 탐색 -> 되겠네
// dfs로 i번째 열렸을때 -> i + 2번째 열렸을때
//           안열렸을때 -> i + 1번째 열렸을때

// 괄호 위치 먼저 잡아주고
// 괄호 내부 계산 먼저 해주기

// 주의!!!!
// result 초기값은 음수 최소값
// 0 아님

let n = Int(readLine()!)!
let expression = Array(readLine()!).map { String($0) }
var isBracket = [Bool](repeating: false, count: Int(ceil(Double(n) / 2)))
var result = Int.min

dfs(0)
print(result)

func dfs(_ openIdx: Int) {
    if openIdx >= isBracket.count - 1 {
        // max값 초기화
        var nums = [Int]()
        var opr = [String]()
        var i = 0
        while i < isBracket.count {
            if isBracket[i] {
                nums.append(calculate(n1: Int(expression[i * 2])!,
                                      n2: Int(expression[i * 2 + 2])!,
                                      opr: expression[i * 2 + 1]))
                i += 1
                if i * 2 + 1 < expression.count { opr.append(expression[i * 2 + 1]) }
            } else {
                nums.append(Int(expression[i * 2])!)
                if i * 2 + 1 < expression.count { opr.append(expression[i * 2 + 1]) }
            }
            i += 1
        }
        var tmp = nums[0]
        for i in 0..<opr.count {
            tmp = calculate(n1: tmp,
                            n2: nums[i+1],
                            opr: opr[i])
        }
        result = max(result, tmp)
        return
    }
    
    isBracket[openIdx] = true
    dfs(openIdx + 2)
    isBracket[openIdx] = false
    dfs(openIdx + 1)
}

func calculate(n1: Int, n2: Int, opr: String) -> Int {
    switch opr {
    case "+":
        return n1 + n2
    case "-":
        return n1 - n2
    case "*":
        return n1 * n2
    default:
        fatalError()
    }
}
