class Solution {
    func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
        guard let room0 = rooms.first else {
            return false
        }
        var visited = Set<Int>(arrayLiteral: 0)
        var nextRoom: [Int] = room0
        while !nextRoom.isEmpty {
            var newNextRoom: [Int] = []
            for next in nextRoom {
                if visited.contains(next) {
                    continue
                }
                visited.insert(next)
                newNextRoom.append(contentsOf: rooms[next])
            }
            nextRoom = newNextRoom
        }
        return visited.count == rooms.count
    }
}

Solution().canVisitAllRooms([[1],[2],[3],[]])
Solution().canVisitAllRooms([[1,3],[3,0,1],[2],[0]])
