class Solution {
    func nextGreatestLetter(_ letters: [Character], _ target: Character) -> Character {
        var l = 0
        var r = letters.count - 1
        while l < r {
            let mid = l + (r - l) / 2
            if letters[mid] <= target {
                l = mid + 1
            } else {
                r = mid
            }
        }
        return letters[l] > target ? letters[l] : letters[0]
    }
}
