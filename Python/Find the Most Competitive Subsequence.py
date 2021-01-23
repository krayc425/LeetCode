from typing import List


class Solution:
    def mostCompetitive(self, nums: List[int], k: int) -> List[int]:
        stack = []
        attempt = len(nums) - k
        for idx, num in enumerate(nums):
            while len(stack) > 0 and attempt > 0 and num < stack[-1]:
                stack.pop()
                attempt -= 1
            stack.append(num)
        return stack[:k]
