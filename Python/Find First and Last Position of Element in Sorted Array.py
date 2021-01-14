from typing import List


class Solution:
    def searchRange(self, nums: List[int], target: int) -> List[int]:
        result = [-1, -1]
        n = len(nums)
        if n == 0:
            return result
        left, right = 0, n - 1
        while left < right:
            mid = left + (right - left) // 2
            if nums[mid] < target:
                left = mid + 1
            else:
                right = mid
        if nums[left] == target:
            result[0] = left
        else:
            return result
        left, right = 0, n - 1
        while left < right:
            mid = left + (right - left) // 2 + 1
            if nums[mid] > target:
                right = mid - 1
            else:
                left = mid
        result[1] = right
        return result
