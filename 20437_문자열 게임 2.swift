import Foundation

// 20437 문자열 게임 2

// **문제**
// 알파벳 소문자 문자열 W <= 만
// 양의 정수 K <= 만
// 1. 어떤 문자를 딱 K개 포함하는 가장 짧은 연속 문자열의 길이 구하기
// 2. 어떤 문자를 딱 K개 포함하고 시작과 끝이 해당 문자인 가장 긴 연속 문자열 구하기
// 1과 2에서의 문자는 달라도 됨

// **풀이**
// 게임 회수만큼 진행한다.(T)
// 문자열을 하나씩 탐색한다.
// 시작 문자와 같은 문자가 나오면 큐(시작과 동일한 문자의 인덱스 배열)에 추가한다.
// 큐의 크기가 k 이상이라면 큐의 첫 원소를 제거하고 최소 사이즈와 최대 사이즈를 갱신한다.
// 이미 방문한 문자열(중복) 이라면 위 과정을 진행하지 않고 넘어간다.

// 위 풀이법을 슬라이딩 윈도우 풀이법이라 한다.
// 고정 사이즈의 윈도우가 이동하면서 풀이
// 투포인터와 유사하지만 고정 사이즈라는 것에서 차이가 있다.
// O(N)

// **시간복잡도**
// T * 문자열의 문자 종류 * W
// O(T*26*W) = 100 * 26 * 10000 = 26000000 2천6백만

let t = Int(readLine()!)!
for _ in 0..<t {
    let s = readLine()!.map { String($0) }
    let k = Int(readLine()!)!
    var visit = [Bool](repeating: false, count: s.count)
    var flag = false
    var result = (Int.max, 0)
    
    for i in 0..<s.count {
        if visit[i] { continue }
        
        var queue = [Int]()
        var idx = i
        for j in i..<s.count {
            if s[j] == s[i] {
                queue.append(j)
                visit[j] = true
                if queue.count >= k {
                    flag = true
                    idx = queue.removeFirst()
                    result.0 = min(result.0, j-idx+1)
                    result.1 = max(result.1, j-idx+1)
                }
            }
        }
    }
    
    if flag { print(result.0, result.1) }
    else { print(-1) }
}
