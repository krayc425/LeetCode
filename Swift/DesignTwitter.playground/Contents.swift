
class Twitter {

    var tweets: [(Int, Int)]
    var follows: [Int: Set<Int>]
    
    /** Initialize your data structure here. */
    init() {
        tweets = []
        follows = [:]
    }
    
    /** Compose a new tweet. */
    func postTweet(_ userId: Int, _ tweetId: Int) {
        tweets.append((userId, tweetId))
    }
    
    /** Retrieve the 10 most recent tweet ids in the user's news feed. Each item in the news feed must be posted by users who the user followed or by the user herself. Tweets must be ordered from most recent to least recent. */
    func getNewsFeed(_ userId: Int) -> [Int] {
        let following = follows[userId] ?? Set<Int>()
        return [Int](tweets.reversed().filter({ $0.0 == userId || following.contains($0.0) }).map({ $0.1 }).prefix(10))
    }
    
    /** Follower follows a followee. If the operation is invalid, it should be a no-op. */
    func follow(_ followerId: Int, _ followeeId: Int) {
        guard followerId != followeeId else {
            return
        }
        follows[followerId, default: Set<Int>()].insert(followeeId)
    }
    
    /** Follower unfollows a followee. If the operation is invalid, it should be a no-op. */
    func unfollow(_ followerId: Int, _ followeeId: Int) {
        guard followerId != followeeId else {
            return
        }
        follows[followerId]?.remove(followeeId)
    }
}

let obj = Twitter()
obj.postTweet(1, 1)
let ret_2: [Int] = obj.getNewsFeed(1)
obj.follow(1, 2)
obj.unfollow(2, 1)
