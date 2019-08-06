import UIKit

// 常量
let str = "Hello, playground"
// 变量
var str1 = "Hello, "
str1 += "Joe"

// 显示声明一个变量
let webSite: String = "https://github.com/liuyubobobo/Play-with-Swift-2"

//------------------------------------

// 基本数据类型
var myInt: Int = 80
Int.max // 9223372036854775807 64bit
var myuInt: UInt = 90
UInt.max
print(UInt.max) //18446744073709551615
UInt.min

let binaryInt: Int = 0b1001
let octalInt: Int = 0o21
let hexInt: Int = 0x11
let bigNum: Int = 1_000_000

let imFloat: Float = 3.1415926535
let imDouble: Double = 3.1415926535
var imTestDou = 3.1415926535

// 不会隐式转换数据类型
let imSum = imDouble + Double(myInt)

let red: CGFloat = 0.2
let green: CGFloat = 0.5
let blue: CGFloat = 0.4
UIColor(red: red, green: green, blue: blue, alpha: 1.0)

// Bool
let imTrue: Bool = true
// if 语句
if imTrue {
    print("Im true")
} else {
    print("Im false")
}

// Tuple
var point = (5, 2)
point.0
var httpCode = (404, "Not Found")
var point2: (Int, Int, Int) = (10, 5, 2)
let (x, y) = point
let point3 = (x: 3, y: 4)
point3.x
let point4: (x: Int, y: Int) = (7, 9) // 解包
let loginResult = (true, "welcome")
let (isLoginSuccess, _) = loginResult // 部分解包

//------------------------------------

// 可以用Unicode字符串来做变量名
var 中文变量 = "可以中文啊"
print(中文变量)
var 😱 = "吃鲸🐳"
print(😱)
print(x, y, terminator: ";")
print(x, y, separator: "-")
print("y=\(y)")

//------------------------------------
let z = 1
let zz = +z

for index in 1...10{
    index
}

for index in 1..<10{
    index
}

for var index in stride(from: -20, to: 20, by: 2){
    index*index
}

func checkMyInt(myInt: Int) {
    guard myInt > 0 else {
        print("a<0")
        return
    }
    print(myInt)
}

checkMyInt(myInt: myInt)


var str2 = ""
var str3 = String()
str3.isEmpty

for c in str.characters{
    print(c)
}

// 在swift中 中文和表情都可以算做一个字符
let mark: Character = "!"
let mark1: Character = "中"
let mark2: Character = "🐶"
let coolGuy: Character = "\u{1F60E}"
let cafe = "cafe\u{0301}"

// NSString 桥接 String
let s = "one third is \(1.0/3.0)"
let s1: String = NSString(format: "one third is %.2f", 1.0/3.0) as String

//------------------------------------
// 第二季
//------------------------------------

// 可选型
var errorCode: Int? = 404 // 整型的可选型，可选nil
errorCode = nil
errorCode = 404

// Unwrap
var error: String? = "404"
"The errorCode is " + error! // 强制解包, 有风险
// 判断解包
if error != nil {
    "The errorCode is " + error!
} else {
    "no error"
}
// if let 解包, 解包的值只能在此代码块中使用
if let error = error {
    "The errorCode is " + error
} else {
    // is nil
}

var errorMsg: String? = "Not Found"
// 同时解包多个变量
if let error = error , let errorMsg = errorMsg {
    "The errorCode is " + error + errorMsg
}
// Optional Chainning
errorMsg?.uppercased()

// 隐式可选型
var warnMessage: String! = nil
warnMessage = "warn: "

//------------------------------------

// 数组

var numbers = [0,1,2,3,4,5]
var numbers1 = [Int]()
var vowels: [String] = ["A", "E", "I", "O", "U"]
var word: Array<String> = []
var allZero = [Int](repeating: 0, count: 5)

for index in 0..<numbers.count{
    numbers[index]
}
for number in numbers{
    number
}
for (i,vowel) in vowels.enumerated(){
    print("\(i):\(vowel)")
}
// add
numbers.append(6)
// remove
numbers.remove(at: 4)
// edit
numbers[3] = 9

//------------------------------------

// 字典

var dict = ["swift": "快速的", "python": "蟒蛇"]
var dict1: Dictionary<String, String> = ["swift": "快速的", "python": "蟒蛇"]
var dict2 = [String:String]()
var dict3 = Dictionary<String, Int>()

dict["swift"]

if let value = dict["swift"]{
    print(value)
}

dict.count
dict.isEmpty
Array(dict.keys)
Array(dict.values)

for (key,value) in dict{
    print("(\(key):\(value)")
}

dict["python"] = "大蟒"

let old = dict.updateValue("🐍", forKey: "python")
dict.removeValue(forKey: "python")

//------------------------------------

// 集合

var skillsOfA: Set<String> = ["swift", "OC"]
var skillsOfB: Set = ["drive", "cook"]
skillsOfB.isEmpty
skillsOfB.first // 随机取出元素
skillsOfB.insert("running")
skillsOfB.remove("drive")
if let skill = skillsOfA.remove("OC"){
    print("\(skill) remove success")
}
// 集合计算
var skillsOfC: Set = ["drive", "cook"]
var skillsOfD: Set = ["walk", "cook"]
skillsOfC.union(skillsOfD) // 并集
skillsOfC.intersection(skillsOfD) // 交集
skillsOfC.subtract(skillsOfD) // 减法
skillsOfC.isSubset(of: skillsOfD) // 是否子集
skillsOfC.isSuperset(of: skillsOfD) // 是否超集
skillsOfC.isDisjoint(with: skillsOfA) // 是否相离


