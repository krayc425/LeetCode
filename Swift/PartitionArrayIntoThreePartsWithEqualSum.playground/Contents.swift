class Solution {
    func canThreePartsEqualSum(_ A: [Int]) -> Bool {
        guard let first = A.first else {
            return false
        }
        let eachSum = A.reduce(0, +) / 3
        var prefixSum: [Int] = [first]
        var foundFirst = false
        var indexFirst = 0
        for i in 1..<A.count {
            if prefixSum.last! == eachSum {
                foundFirst = true
                indexFirst = i
                break
            }
            prefixSum.append(prefixSum.last! + A[i])
        }
        if !foundFirst {
            return false
        }
        prefixSum.removeAll()
        prefixSum = [A[indexFirst]]
        foundFirst = false
        for i in (indexFirst + 1)..<A.count {
            if prefixSum.last! == eachSum {
                foundFirst = true
                indexFirst = i
                break
            }
            prefixSum.append(prefixSum.last! + A[i])
        }
        if !foundFirst {
            return false
        } else {
            return A[indexFirst...].reduce(0, +) == eachSum
        }
    }
}

Solution().canThreePartsEqualSum([0,2,1,-6,6,-7,9,1,2,0,1])
