# Definition for a binary tree node.
class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right


class Solution:
    def isSymmetric(self, root: TreeNode) -> bool:
        def isMirror(node1: TreeNode, node2: TreeNode) -> bool:
            if not node1 and not node2:
                return True
            if not node1 or not node2:
                return False
            return node1.val == node2.val \
                   and isMirror(node1.left, node2.right) \
                   and isMirror(node1.right, node2.left)

        return isMirror(root, root)
