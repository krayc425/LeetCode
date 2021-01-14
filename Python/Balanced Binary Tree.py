# Definition for a binary tree node.
class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right


class Solution:
    def isBalanced(self, root: TreeNode) -> bool:
        def helper(node: TreeNode) -> (bool, int):
            if not node:
                return True, 0
            left_balanced, left_height = helper(node.left)
            if not left_balanced:
                return False, 0
            right_balanced, right_height = helper(node.right)
            if not right_balanced:
                return False, 0
            balanced = left_balanced and right_balanced and abs(left_height - right_height) <= 1
            return balanced, max(left_height, right_height) + 1

        return helper(root)[0]
