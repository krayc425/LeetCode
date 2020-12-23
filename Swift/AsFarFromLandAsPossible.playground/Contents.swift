class Point: Equatable, Hashable {
    var x: Int
    var y: Int
    
    init(_ x: Int, _ y: Int) {
        self.x = x
        self.y = y
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(x)
        hasher.combine(y)
    }
    
    static func ==(_ lhs: Point, _ rhs: Point) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }
    
    static func +(_ lhs: Point, _ rhs: Point) -> Point {
        return Point(lhs.x + rhs.x, lhs.y + rhs.y)
    }
}


class Solution {
    private let direction = [Point(-1, 0), Point(1, 0), Point(0, -1), Point(0, 1)]
    
    func maxDistance(_ grid: [[Int]]) -> Int {
        guard let first = grid.first, !first.isEmpty else {
            return -1
        }
        var queue: [Point] = []
        for i in 0..<grid.count {
            for j in 0..<first.count {
                if grid[i][j] == 1 {
                    queue.append(Point(i, j))
                }
            }
        }
        if queue.isEmpty || queue.count == grid.flatMap { $0 }.count {
            return -1
        }
        var step = 0
        var visited = Set<Point>()
        while !queue.isEmpty {
            let count = queue.count
            for _ in 0..<count {
                let point = queue.removeFirst()
                visited.insert(point)
                for d in direction {
                    let newPoint = point + d
                    let newX = newPoint.x
                    let newY = newPoint.y
                    if newX >= 0 && newY >= 0 && newX < grid.count && newY < first.count
                        && grid[newX][newY] == 0 && !visited.contains(newPoint) {
                        queue.append(newPoint)
                        visited.insert(newPoint)
                    }
                }
            }
            step += 1
        }
        return step - 1
    }
}
