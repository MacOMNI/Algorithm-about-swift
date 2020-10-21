//
//  TowSum.swift
//  LeetCode
//
//  Created by MacOMNI on 2020/4/3.
//  Copyright © 2020 Xcode. All rights reserved.
//

import UIKit
class ListNode {
    var val:Int = 0
    var next:ListNode?
    init(val:Int) {
        self.val = val
        self.next = nil
    }
    init(val:Int,next:ListNode?) {
        self.val = val
        self.next = next
    }
}
class Solution {
    func removeNthNumber( head:ListNode?, n:Int) -> ListNode? {
        var headTmp = head
        var preTmp = head
        for _ in 0..<n {
            headTmp = headTmp?.next
        }
        if headTmp == nil {
           return head?.next
        }
        while headTmp?.next != nil {
            headTmp = headTmp?.next
            preTmp = preTmp?.next
        }
       
        preTmp?.next = preTmp?.next?.next
        return head
    }
    
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var map = [Int:Int]()
        for index in (0..<nums.count).reversed() {
            map[nums[index]] = index
        }
        for index in 0..<nums.count {
            if map[target - nums[index]] != nil  && index != map[target - nums[index]]{
                return [index,map[target - nums[index]]!]
            }
        }
        return []
    }
    
    func lengthOfLongSubString(str:String) -> Int {
        var subLength = 0 ;
        let len = str.count
        let array = Array<Character>(str)
        
        var hashMap = [Character:Int]()
        var preIndex = -1
        for index in 0..<len {
            let curCharacter =  array[index]
            if let curPrexIndex = hashMap[curCharacter] {
                preIndex = max(curPrexIndex, preIndex)
            } else {
                
            }
            hashMap[curCharacter] = index
            subLength = max(subLength, index - preIndex)
        }
        return subLength
    }
}
