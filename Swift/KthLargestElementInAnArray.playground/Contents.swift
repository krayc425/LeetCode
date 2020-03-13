class Solution {
    
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        guard !nums.isEmpty else {
            return 0
        }
        var arr: [Int] = []
        for num in nums {
            if arr.count < k {
                arr.append(num)
                if arr.count == k {
                    arr.sort()
                    arr.reverse()
                }
            } else {
                for i in 0..<arr.count {
                    if arr[i] < num {
                        arr.insert(num, at: i)
                        arr.removeLast()
                        break
                    }
                }
            }
        }
        return arr.last!
    }
    
    func findKthLargest_QuickSelect(_ nums: [Int], _ k: Int) -> Int {
        var nums = nums
        var start = 0
        var end = nums.count-1
        
        while start <= end {
            let position = partition(&nums, start, end)
            if position == nums.count - k {
                return nums[position]
            } else if position < nums.count - k {
                start = position + 1
            } else {
                end = position - 1
            }
        }
        
        return -1
    }
    
    func partition(_ nums: inout [Int], _ start: Int, _ end:  Int) -> Int{
        let index = start
        let pivot = nums[index]
        var start = start
        var end = end
        while start <= end {
            // 找到左边第一个 >= pivot 的
            while start <= end && nums[start] <= pivot {
                start += 1
            }
            // 找到右边第一个 < pivot 的
            while start <= end && nums[end] > pivot {
                end -= 1
            }
            // 交换一下使得顺序保持正确
            if start <= end {
                nums.swapAt(start, end)
            }
        }
        // end 之前多走了一位，现在在 <= 区的最后一位，和 pivot 交换以后 pivot 就到了正确的位置
        nums.swapAt(index, end)
        return end  // end 是 pivot 最后所在的位置
    }
    
}

Solution().findKthLargest([1,7,5,2,4,5,3,7,8,3,6,4,3,5,2,9,1], 4)

// Quick Select : Time Complexity: O(n) - O(n^2)
