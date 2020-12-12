public class Employee {
    public var id: Int
    public var importance: Int
    public var subordinates: [Int]
    public init(_ id: Int, _ importance: Int, _ subordinates: [Int]) {
        self.id = id
        self.importance = importance
        self.subordinates = subordinates
    }
}


class Solution {
    func getImportance(_ employees: [Employee], _ id: Int) -> Int {
        guard !employees.isEmpty else {
            return 0
        }
        var importanceMap: [Int: Int] = [:]
        var subordinateMap: [Int: [Int]] = [:]
        for employee in employees {
            let id = employee.id
            importanceMap[id] = employee.importance
            subordinateMap[id] = employee.subordinates
        }
        var res = importanceMap[id]!
        var queue: [Int] = subordinateMap[id]!
        while !queue.isEmpty {
            let count = queue.count
            for _ in 0..<count {
                let subId = queue.removeFirst()
                res += importanceMap[subId] ?? 0
                queue.append(contentsOf: subordinateMap[subId] ?? [])
            }
        }
        return res
    }
}
