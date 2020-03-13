class Solution {
    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        var inDegree: [Int] = [Int](repeating: 0, count: numCourses)
        var dict: [Int: [Int]] = [:]
        for prerequisite in prerequisites {
            inDegree[prerequisite[0]] += 1
            dict[prerequisite[1], default: []].append(prerequisite[0])
        }
        var queue: [Int] = []
        for (idx, val) in inDegree.enumerated() {
            if val == 0 {
                queue.append(idx)
            }
        }
        
        var res: [Int] = []
        while !queue.isEmpty {
            let num = queue.removeFirst()
            res.append(num)
            if let courses = dict[num] {
                for course in courses {
                    inDegree[course] -= 1
                    if inDegree[course] == 0 {
                        queue.append(course)
                    }
                }
            }
        }
        return res.count == numCourses ? res : []
    }
}
