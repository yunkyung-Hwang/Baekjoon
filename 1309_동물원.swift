// 1309_동물원
// 문제
// 2 * n우리에 사자를 배치하는데 가로, 세로로 붙어 배치할 수 없다.
// 사자를 배치하는 경우의 수가 몇가지인지 구하기

// dp
// x x 1 3 7 17
// x o 1 2 5 12
// o x 1 2 5 12

let n = Int(readLine()!)!
var cage = [[Int]](repeating: [Int](repeating: 0, count: 3), count: n)
for i in 0..<3 { cage[0][i] = 1 }
for i in 1..<n {
    cage[i][0] = (cage[i-1][0] + cage[i-1][1] + cage[i-1][2]) % 9901
    cage[i][1] = (cage[i-1][0] + cage[i-1][2]) % 9901
    cage[i][2] = (cage[i-1][0] + cage[i-1][1]) % 9901
}
print(cage[n-1].reduce(0, +) % 9901)
