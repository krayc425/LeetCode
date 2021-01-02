import math


# Definition for a binary tree node.
class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right


class Solution:
    def isValidBST(self, root: TreeNode) -> bool:
        def validate(root: TreeNode, low: int, high: int) -> bool:
            if not root:
                return True
            if root.val <= low or root.val >= high:
                return False
            return validate(root.left, low, root.val) and validate(root.right, root.val, high)

        return validate(root, -math.inf, math.inf)
