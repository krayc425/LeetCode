class Solution {
    func minimumAbsDifference(_ arr: [Int]) -> [[Int]] {
        var results: [[Int]] = []
        var minAbs = Int.max
        let arr = arr.sorted()
        for i in 0..<arr.count - 1 {
            let j = i + 1
            let currAbs = abs(arr[i] - arr[j])
            if currAbs < minAbs {
                minAbs = currAbs
                results = [[arr[i], arr[j]]]
            } else if currAbs == minAbs {
                results.append([arr[i], arr[j]])
            }
        }
        return results
    }
}

Solution().minimumAbsDifference([4,1,3,2])
