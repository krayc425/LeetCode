from typing import List


class Solution:
    def countSmaller(self, nums: List[int]) -> List[int]:
        n = len(nums)
        if n == 0:
            return []
        self.res = [0] * n

        def merge(start, end: int, nums: List[int]):
            # each half of nums is already sorted now
            mid = (start + end) // 2
            temp = []
            left = start
            right = mid + 1
            while left <= mid and right <= end:
                # compare value
                if nums[left][1] > nums[right][1]:
                    temp.append(nums[right])
                    right += 1
                else:
                    temp.append(nums[left])
                    # increase numbers that are greater than current one
                    self.res[nums[left][0]] += right - mid - 1
                    left += 1
            while left <= mid:
                temp.append(nums[left])
                self.res[nums[left][0]] += end - mid
                left += 1
            while right <= end:
                temp.append(nums[right])
                right += 1
            for i in range(start, end + 1):
                nums[i] = temp[i - start]

        def mergesort(start, end: int, nums: List[int]):
            if start == end:
                return []
            mid = (start + end) // 2
            mergesort(start, mid, nums)
            mergesort(mid + 1, end, nums)
            merge(start, end, nums)

        mergesort(0, n - 1, list(enumerate(nums)))
        return self.res
