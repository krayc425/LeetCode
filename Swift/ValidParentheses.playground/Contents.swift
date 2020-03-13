class Solution {
    func isValid(_ s: String) -> Bool {
        var array: [Character] = []
        for char in s {
            if let last = array.last,
                let buddy = buddyParentheses(char), last == buddy {
                array.removeLast()
            } else {
                array.append(char)
            }
        }
        return array.isEmpty
    }
    
    func buddyParentheses(_ char: Character) -> Character? {
        let dict: [Character: Character] = [
            ")": "(",
            "]": "[",
            "}": "{"
        ]
        return dict[char]
    }
}

Solution().isValid("[]([{]}){}")
