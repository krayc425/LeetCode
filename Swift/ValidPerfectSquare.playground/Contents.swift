/**
 Given a positive integer num, write a function which returns True if num is a perfect square else False.
 
 Note: Do not use any built-in library function such as sqrt.
 
 Example 1:
 
 Input: 16
 Returns: True
 Example 2:
 
 Input: 14
 Returns: False
 */

class Solution {
    func isPerfectSquare(_ num: Int) -> Bool {
        var tempNum = num
        var i = 1
        while tempNum > 0 {
            tempNum -= i
            i += 2
        }
        return tempNum == 0
    }
    
    func isPerfectSquare_binarySearch(_ num: Int) -> Bool {
        if num <= 2 {
            return false
        }
        var l = 1
        var r = Int(num / 2)
        while l <= r {
            let mid = l + (r - l) / 2
            let squared = mid * mid
            if squared == num {
                return true
            } else if squared > num {
                r = mid - 1
            } else {
                l = mid + 1
            }
        }
        return false
    }
}

Solution().isPerfectSquare(16)
Solution().isPerfectSquare_binarySearch(4)
