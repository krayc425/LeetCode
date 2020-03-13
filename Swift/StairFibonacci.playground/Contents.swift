func stairFibonacci(_ n: Int) -> Int {
    if n <= 1 {
        return 0
    }
    if n == 2 || n == 3 {
        return 1
    }
    return stairFibonacci(n - 2) + stairFibonacci(n - 3)
}

func stairFibonacci2(_ n: Int64) -> Int64 {
    if n <= 1 {
        return 0
    }
    if n == 2 || n == 3 {
        return 1
    }
    var f_n_1   : Int64 = 0
    var f_n_2   : Int64 = 1
    var f_n_3   : Int64 = 1
    var tmp     : Int64 = 0
    for _ in (4...n) {
        tmp = f_n_1 + f_n_2
        f_n_1 = f_n_2
        f_n_2 = f_n_3
        f_n_3 = tmp
    }
    return f_n_3
}

stairFibonacci(10)

stairFibonacci2(10)
