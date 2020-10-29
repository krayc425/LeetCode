class Solution {
    func minKnightMoves(_ x: Int, _ y: Int) -> Int {
        var steps = 0
        var queue: [(Int, Int)] = [(0, 0)]
        var visited: Set<[Int]> = Set(arrayLiteral: [0, 0])
        let directions = [(1,2),(-1,2),(1,-2),(-1,-2),(2,1),(2,-1),(-2,1),(-2,-1)]
        while !queue.isEmpty {
            let size = queue.count
            for _ in 0..<size {
                let first = queue.removeFirst()
                if first.0 == abs(x) && first.1 == abs(y) {
                    return steps
                }
                for direction in directions {
                    let newX = first.0 + direction.0
                    let newY = first.1 + direction.1
                    if !visited.contains([newX, newY]) && newX >= -1 && newY >= -1 {
                        visited.insert([newX, newY])
                        queue.append((newX, newY))
                    }
                }
            }
            steps += 1
        }
        return 0
    }
}
