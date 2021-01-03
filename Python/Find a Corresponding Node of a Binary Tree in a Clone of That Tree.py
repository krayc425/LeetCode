# Definition for a binary tree node.
class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None


class Solution:
    def getTargetCopy(self, original: TreeNode, cloned: TreeNode, target: TreeNode) -> TreeNode:
        def findNode(root: TreeNode, cloned_root: TreeNode, target: TreeNode) -> (TreeNode, bool):
            if not root:
                return None, False
            if root is target:
                return cloned_root, True
            cloned_left, left_found = findNode(root.left, cloned_root.left, target)
            cloned_right, right_found = findNode(root.right, cloned_root.right, target)
            if left_found:
                return cloned_left, left_found
            elif right_found:
                return cloned_right, right_found
            else:
                return None, False

        found, _ = findNode(original, cloned, target)
        return found
