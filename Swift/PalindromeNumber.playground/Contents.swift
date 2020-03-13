func isPalindrome(_ x: Int) -> Bool {
    var x = x
    if x < 0 {
        return false
    }
    var digits: Int = 1
    while digits * 10 <= x {
        digits *= 10
    }
    if x < 10 {
        return true
    }
    while digits > 1 {
        if x % 10 == x / digits {
            x = ((x - (x / digits) * digits) - x % 10) / 10
            digits /= 100
        } else {
            return false
        }
    }
    return true
}

isPalindrome(10)
