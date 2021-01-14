# Definition for a binary tree node.
class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None


class Solution:
    def lowestCommonAncestor(self, root: 'TreeNode', p: 'TreeNode', q: 'TreeNode') -> 'TreeNode':
        self.res = None

        def helper(node: 'TreeNode') -> bool:
            if not node:
                return False
            left = helper(node.left)
            right = helper(node.right)
            mid = node == p or node == q
            if left + mid + right >= 2:
                self.res = node
            return left or mid or right

        helper(root)
        return self.res
