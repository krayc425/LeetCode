from typing import List


# Definition for a binary tree node.
class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right


class Solution:
    def sortedArrayToBST(self, nums: List[int]) -> TreeNode:
        def helper(l, r: int) -> TreeNode:
            if l > r:
                return None
            mid = l + (r - l) // 2
            root = TreeNode(nums[mid])
            root.left = helper(l, mid - 1)
            root.right = helper(mid + 1, r)
            return root

        n = len(nums)
        if n == 0:
            return None
        return helper(0, n - 1)
