class NumArray {
    
    var sum: [Int]
    
    init(_ nums: [Int]) {
        sum = []
        for i in 0..<nums.count {
            if i == 0 {
                sum.append(nums[0])
            } else {
                sum.append(sum[i - 1] + nums[i])
            }
        }
        print(sum)
    }
    
    func sumRange(_ i: Int, _ j: Int) -> Int {
        return sum[j - 1] - sum[i]
    }
    
}

let n = NumArray([-2, 0, 3, -5, 2, -1])

