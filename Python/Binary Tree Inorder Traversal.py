from typing import List


# Definition for a binary tree node.
class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right


class Solution:
    def inorderTraversal(self, root: TreeNode) -> List[int]:
        def inorder(root: TreeNode, res: List[int]):
            if root is None:
                return
            inorder(root.left, res)
            res.append(root.val)
            inorder(root.right, res)

        if root is None:
            return []
        res = []
        inorder(root, res)
        return res
