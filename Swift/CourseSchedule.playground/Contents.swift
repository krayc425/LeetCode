class Solution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var inDegree: [Int] = [Int](repeating: 0, count: numCourses)
        var dict: [Int: [Int]] = [:]
        for prerequisite in prerequisites {
            inDegree[prerequisite[0]] += 1
            dict[prerequisite[1], default: []].append(prerequisite[0])
        }
        var count = 0
        var queue: [Int] = []
        for (idx, val) in inDegree.enumerated() {
            if val == 0 {
                queue.append(idx)
            }
        }
        while !queue.isEmpty {
            count += 1
            let num = queue.removeFirst()
            if let courses = dict[num] {
                for course in courses {
                    inDegree[course] -= 1
                    if inDegree[course] == 0 {
                        queue.append(course)
                    }
                }
            }
        }
        return count == numCourses
    }
}
