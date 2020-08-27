class Solution {
    func reconstructQueue(_ people: [[Int]]) -> [[Int]] {
        var res = [[Int]]()
        let sorted = people.sorted { (p1, p2) -> Bool in
            return p1[0] == p2[0] ? p1[1] < p2[1] : p1[0] > p2[0]
        }
        for person in sorted {
            res.insert(person, at: person[1])
        }
        return res
    }
}

Solution().reconstructQueue([[7,0], [4,4], [7,1], [5,0], [6,1], [5,2]])
