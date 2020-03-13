class Solution {
    func combinationSum3(_ k: Int, _ n: Int) -> [[Int]] {
        var res: [[Int]] = []
        var temp: [Int] = []
        process(&res, &temp, 1, n, k)
        return res
    }
    
    func process(_ res: inout [[Int]], _ temp: inout [Int], _ start: Int, _ target: Int, _ k: Int) {
        if temp.count == k && target == 0 {
            res.append(temp)
            return
        }
        if start > 9 {
            return
        }
        for i in start...9 {
            temp.append(i)
            process(&res, &temp, i + 1, target - i, k)
            temp.removeLast()
        }
    }
}
