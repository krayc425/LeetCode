class Solution {
    func findLexSmallestString(_ s: String, _ a: Int, _ b: Int) -> String {
        let numArr = s.map { $0.wholeNumberValue! }
        var visited = Set<[Int]>()
        var nonVisited = Set<[Int]>(arrayLiteral: numArr)
        while !nonVisited.isEmpty {
            var newNonVisited = Set<[Int]>()
            for arr in nonVisited {
                let idx = arr.count - b
                var newNumArr = [Int](arr[idx...] + arr[..<idx])
                for _ in 1...10 {
                    for i in 0..<newNumArr.count {
                        if i % 2 == 1 {
                            newNumArr[i] = (newNumArr[i] + a) % 10
                        }
                    }
                    if !visited.contains(newNumArr) {
                        visited.insert(newNumArr)
                        newNonVisited.insert(newNumArr)
                    }
                }
            }
            nonVisited = newNonVisited
        }
        var strArr = Set<String>()
        for arr in visited {
            strArr.insert(arr.map { String($0) }.reduce("", +))
        }
        return strArr.min()!
    }
}

Solution().findLexSmallestString("5525", 9, 2)
Solution().findLexSmallestString("43987654", 7, 3)
