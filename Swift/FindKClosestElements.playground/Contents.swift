class Solution {
    func findClosestElements(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
        var left = 0
        var right = arr.count - 1
        var idx = -1
        while left < right {
            let mid = left + (right - left) / 2
            if arr[mid] > x {
                right = mid - 1
            } else if arr[mid] < x {
                left = mid + 1
            } else {
                idx = mid
                break
            }
        }
        if idx == -1 {
            idx = left
        }
        left = idx - 1
        right = idx
        var res: [Int] = []
        while res.count < k {
            let leftNum = left >= 0 ? arr[left] : Int.max
            let rightNum = right <= arr.count - 1 ? arr[right] : Int.max
            if leftNum != Int.max && rightNum != Int.max {
                if x - leftNum == rightNum - x {
                    if leftNum < rightNum {
                        res.insert(leftNum, at: 0)
                        left -= 1
                    } else {
                        res.append(rightNum)
                        right += 1
                    }
                } else if x - leftNum < rightNum - x {
                    res.insert(leftNum, at: 0)
                    left -= 1
                } else {
                    res.append(rightNum)
                    right += 1
                }
            } else {
                if leftNum == Int.max {
                    res.append(rightNum)
                    right += 1
                } else if rightNum == Int.max {
                    res.insert(leftNum, at: 0)
                    left -= 1
                }
            }
        }
        return res
    }
}

Solution().findClosestElements([0,0,1,2,3,3,4,7,7,8], 3, 5)
Solution().findClosestElements([1,2,3,4,5], 4, 3)
Solution().findClosestElements([1,2,3,4,5], 4, -1)
Solution().findClosestElements([0,0,0,1,3,5,6,7,8,8], 2, 2)
Solution().findClosestElements([1,3], 1, 2)
