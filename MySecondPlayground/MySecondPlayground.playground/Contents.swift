import UIKit

var str = "Hello, playground"

// 函数

func sayHello(name: String) -> String{
    return "Hello " + name
}

sayHello(name: "Joe")

func printHello() -> Void{
    print("Hello")
}

func findMaxAndMin(numbers: [Int]) -> (max: Int, min: Int){
    var minValue = numbers[0]
    var maxValue = numbers[0]
    for number in numbers{
        minValue = minValue < number ? minValue : number
        maxValue = maxValue > number ? maxValue : number
    }
    return (maxValue, minValue)
}

var scores: [Int] = [2,5,6,99,1,6,5]
let scoreResult = findMaxAndMin(numbers: scores)
print("max:\(scoreResult.max),min:\(scoreResult.min)")

// 函数参数名

func sayHelloTo(name: String, withGreetingWord greeting: String = "Hello") -> String {
    return "\(greeting), \(name)!"
}

sayHelloTo(name: "Joe", withGreetingWord: "Hi")

// 变长参数

func mean(numbers: Double ...) -> Double{
    var sum: Double = 0
    for number in numbers{
        sum += number
    }
    return sum / Double(numbers.count)
}

mean(numbers: 2,3,4,5)

// 按引用传参
func swapTwoInts( _ a: inout Int, _ b: inout Int){
   (a,b) = (b,a)
}
var x: Int = 1
var y: Int = 2
swapTwoInts(&x, &y)
x
y

// 函数引用
let sayHello1 = sayHello
let sayHello2: (String) -> String = sayHello
sayHello1("Joe")

// 排序
func biggerNumberFirst(_ a:Int, _ b:Int) -> Bool{
    return a > b
}
scores.sort(by: biggerNumberFirst)

// 函数式编程初步
func changeScores(scores: inout [Int], by changeScore: (Int)->Int){
    for (index,score) in scores.enumerated(){
        scores[index] = changeScore(score)
    }
}

func changeScore1(score: Int) -> Int{
    return Int(sqrt(Double(score))*10)
}

func changeScore2(score: Int) -> Int{
    return Int((Double(score)) / 150.0 * 10)
}

changeScores(scores: &scores, by: changeScore1)
changeScores(scores: &scores, by: changeScore2)

// map
scores.map(changeScore2)

func isPassOrFail(score: Int) -> String{
    return score < 60 ? "Fail" : "Pass"
}

scores = [72,85,60,99,1,6,5]
scores.map(isPassOrFail)

// filter
func fail(score: Int) -> Bool{
    return score < 60
}
scores.filter(fail)

// reduce
func add(_ num1: Int, _ num2: Int) -> Int{
    return num1 + num2
}
scores.reduce(0, add) // (初值，聚合函数)
scores.reduce(0, +) // swift中计算符号也是函数

//------------------------------------------

// 闭包

var arr:[Int] = []
var g = SystemRandomNumberGenerator()
for _ in 0..<100{
    arr.append(Int.random(in: 1...1000, using: &g))
}

arr.sort(by: biggerNumberFirst)

arr.sort(by: { (a:Int, b:Int) -> Bool in
    return a > b
})

arr.sort(by: { (a, b) in
    a > b
})

arr.sort(by:{ $0 > $1 })

arr.sort(by:>)

// Trailing Closure

arr.sort(){ (a, b) in a > b }

arr.sort{ (a, b) in a > b }

// 内容捕获

var num = 700
arr.sort{ a, b in
    abs(a-num) < abs(b-num)
}

// 返回函数

func runningMetersWithMetersPerDay( metersPerDay: Int) -> () -> Int {
    var totalMeters = 0
    return {
        totalMeters += metersPerDay
        return totalMeters
    }
}

var planA = runningMetersWithMetersPerDay(metersPerDay: 2000)
planA()
planA()
var anotherPlan = planA
anotherPlan()
planA()
