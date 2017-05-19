//: Playground - noun: a place where people can play

import UIKit

/*
 * 本节内容:
 * 1.if let同时解包多个可选型
 * 2.Nil-Coalescing(nil聚合)用法
 * 3.可选型和元组的结合
 * 4.Optional Chaining(可选型链式表达)
 */


var errorCode: Int? = 404
var errorMsg: String? = "Page not found"

if let errorCode = errorCode, let errorMsg = errorMsg {
    "Error Code:\(errorCode) Error Message:\(errorMsg)"
}

// String? 因为errorMsg本身就是可选类型
let message1 = errorMsg == nil ? "haha" : errorMsg
// String 因为errorMsg本身就是可选类型，但当不为nil时强转了
let message2 = errorMsg == nil ? "haha" : errorMsg!
// String   ?? 空和运算符
let message3 = errorMsg ?? "default value when errorMsg is nil"

// 打印时message1!是可选类型要强转，否则输出是Optional(Page not found)
print("\(message1!) \(message2) \(message3)")

var errorOne:(errorCode: Int, errorMsg: String) = (404, "Not Found")
var errorTwo:(errorCode: Int, errorMsg: String?) = (404, "Not Found")
var errorThree:(errorCode: Int, errorMsg: String)? = (404, "Not Found")
var errorFour:(errorCode: Int, errorMsg: String?)? = (404, "Not Found")

//errorThree?.errorMsg = nil // 元组是可选型, 并不表示元组的分量也是可选择型
errorThree = nil
errorTwo.errorMsg = nil
// 可选链
errorFour?.errorMsg?.lowercased().uppercased()






/*
 * 本节内容:
 * 1.if / else if
 * 2.for循环
 * 3.while循环
 * 4.repeat while循环
 */
// 顺序
for index in 0...5 {
    print(index)
}
// 反转
for index in (0..<5).reversed() {
    print(index)
}
// _ 忽略
var result: Int = 0
for _ in 0...5 {
    result = result + 1
}
print(result)

// 自定义循环步长 区间[0, 10] 步长2 递增
for index in stride(from: 0, to: 10, by: 2) {
    print(index)
}
for index in stride(from: 10, to: 0, by: -2) {
    print(index)
}

// while循环 需求: a和b两个投骰子, 点数大的赢一次, 连续赢三次循环结束
var aWin = 0, bWin = 0
var loopCount = 0 // 循环次数
while aWin < 3 && bWin < 3 {
    loopCount = loopCount + 1
    // 产生2个随机数[1, 6]
    let aNumber = arc4random_uniform(6) + 1
    let bNumber = arc4random_uniform(6) + 1
    if aNumber < bNumber {
        print("a win")
        aWin = aWin + 1
        bWin = 0
    } else if aNumber > bNumber {
        print("b win")
        bWin = bWin + 1
        aWin = 0
    } else {
        print("piece")
        aWin = 0
        bWin = 0
    }
}
let winner = aWin == 3 ? "A" : "B"
print("After \(loopCount) games, \(winner) win")


// repeat while
loopCount = 0
var aNumber: UInt32, bNumber: UInt32
repeat {
    loopCount = loopCount + 1
    aNumber = arc4random_uniform(6) + 1
    bNumber = arc4random_uniform(6) + 1
} while aNumber != bNumber
print("After \(loopCount) times, aNumber=bNumber=\(aNumber)")

while true {
    let aNumber = arc4random_uniform(6) + 1
    let bNumber = arc4random_uniform(6) + 1
    // 死循环，当2个数相等时跳出循环
    if aNumber == bNumber {
        break
    }
}

while true {
    let aNumber = arc4random_uniform(6) + 1
    let bNumber = arc4random_uniform(6) + 1
    if aNumber == bNumber {
        continue
    }
    if aNumber > bNumber {
        print("a win")
        break
    }
}






/*
 * 本节主要内容:
 * 1.switch语句的基本使用
 * 2.switch语句和区间运算符的结合
 * 3.switch语句和元组的结合
 * 4.switch语句和where模式匹配的结合
 * 和C语言基本用法不同:
 * 1.可以判定非整型类型(String)
 * 2.可以不写break;
 * 3.针对不同的case分支, 如果执行同样的逻辑, 只需要使用逗号即可
 */
let rating = "a"
switch rating {
case "a", "A":
    print("Great!")
case "b", "B":
    print("Just so so")
default:
    print("So bad")
}

let grade = 98
switch grade {
case 90...100:
    print("Grate!")
case 70..<90:
    print("Just so so")
default:
    print("Get out")
}

let point = (1, 1)
switch point {
//case let (x, y):
//    print("x=\(x) y=\(y)")
//    fallthrough
case (0, 0):
    print("origin")
case (0, _):
    print("y-axis")
case (_, 0):
    print("x-axis")
case (-1...1, -1...1):
    print("near origin")
case let (x, y) where y == x:
    print("point on line y = x")
case let (x, y) where y == -x:
    print("point on line y = -x")
default:
    print("ordinary point")
}







/*
 * 本节主要内容:
 * 1.数组的声明和初始化
 * 2.数组的遍历for
 * 3.数组的元素(Element)的增/删/改/查
 * 4.验证数组是值类型(数据类型: Data Type)
 * 数组的声明:
 * 1.确定是否可变
 * 2.确定数组中元素的类型
 * 3.初始化
 */

// 声明整形类型的不可变数组（常量）并初始化
let arrayOne = [1, 2, 3]
let arrayTwo: [Int] = [1, 2, 3]
var arrayThree: [String] = ["A", "B", "C"]
// 声明空数组 -> 了解
var arrayFour: [Int] = []       // []
var arrayFive = [Int]()         // []
var arraySix: Array<Int> = []   // []
var arraySeven = Array<Int>()   // []
var arrayEight = [Int](repeatElement(1, count: 3)) // [1, 1, 1]
// 遍历
for element in arrayEight {
    print("\(element) - \(arrayEight[element])") // 两种方法获取元素值
}

// 查
arrayThree[2]
arrayThree[0...2]
arrayThree.max()
arrayThree.min()
arrayThree.startIndex
arrayThree.endIndex
// 增
arrayThree += ["a", "b", "c"]
arrayThree.append("d")
arrayThree.insert("D", at: 3)
// 改
arrayThree[3...4] = ["d", "D"]
arrayThree[0] = "Hello"
arrayThree
// 删
arrayThree.remove(at: 3)
arrayThree.removeFirst()
arrayThree.removeLast()
arrayThree.reverse()
arrayThree.removeAll()









/*
 * 本节主要内容:
 * 1.字典的声明和初始化
 * 2.字典的遍历
 * 3.字典的增/删/改/查
 * 注意Notes:
 * 1.明确可变和不可变
 * 2.明确key的类型(没有要求), value什么类型(没有要求); 一旦指定key/value的类型, 就不可以更改
 */
// 隐式声明可变字典，key/value都是String
var countries = ["US": "United States", "CN": "People Republic of China"]
var countriesTwo: [String: String] = countries
// 声明空的字典(不包含任何的key value) --> 了解
var emptyDicOne: [Int: String] = [:]
var emptyDicTwo = [Int: String]()
var emptyDicThree: Dictionary<Int, String> = [:]
var emptyDicFour = Dictionary<Int, String>()
// 遍历
for (key, value) in countries {
    print("key=\(key) value=\(value)")
}

// 增
countries["UK"] = "United Kindom"
// 改
countries["UK"] = "Britain"
// 删
countries["UK"] = nil
// 查
countries["CN"]





















