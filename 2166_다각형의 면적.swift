import Foundation

typealias Point = (x: Int64, y: Int64)
/// 벡터의 외적
func ccw(_ p1: Point, _ p2: Point, _ p3: Point) -> Double {
    return Double(p1.x * p2.y + p2.x * p3.y + p1.y * p3.x
    - (p1.y * p2.x + p2.y * p3.x + p3.y * p1.x)) / 2
}

let n = Int(readLine()!)!
var points = [Point](repeating: (0, 0), count: n)
for i in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int64(String($0))! }
    points[i] = (input[0], input[1])
}

var result: Double = 0
for i in 1..<n-1 {
    result += ccw(points[0], points[i], points[i+1])
}
print(String(format: "%.1f", abs(result)))
