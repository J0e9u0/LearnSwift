import UIKit

var str = "Hello, playground"

// 枚举

enum Month{
    case Janary
    case February
    case March
    case April
}

var curMonth = Month.Janary
curMonth = .March

// Raw Value
enum Day: Int{
    case Monday = 1
    case Tuesday = 2
}

let day = Day(rawValue: 2)

// Associate Value
enum ATMStatus{
    case Success(Int)
    case Error(String)
    case Waiting
}

// 可选型实质是枚举
var age: Int? = 17
print(age)

age = nil

var website: Optional<String> = Optional.some("imooc.com")// 等价 String?

// 递归枚举变量, indirect允许递归
indirect enum ArithmeticExpression{
    case Number(Int)
    case Addition(ArithmeticExpression, ArithmeticExpression)
    case Multiplication(ArithmeticExpression, ArithmeticExpression)
}
// (5+4)*2
let five = ArithmeticExpression.Number(5)
let four = ArithmeticExpression.Number(4)
let sum = ArithmeticExpression.Addition(five, four)
let two = ArithmeticExpression.Number(2)
let product = ArithmeticExpression.Multiplication(sum, two)

func evaluate(expression: ArithmeticExpression) -> Int{
    switch expression {
    case let .Number(value):
        return value
    case let .Addition(left, right):
        return evaluate(expression: left) + evaluate(expression: right)
    case let .Multiplication(left, right):
        return evaluate(expression: left) * evaluate(expression: right)
    }
}
evaluate(expression: product)

//------------------------------

// 结构体

struct Location{
    let latitude: Double
    let longitude: Double
}

let appleLocation = Location(latitude: 37.3230, longitude: -122.0322)

appleLocation.latitude

struct Location1{
    var latitude: Double
    var longitude: Double
    var placeName: String?
    
    init(coordinateString: String){
        latitude = 0.0
        self.longitude = 0.0 // self相当于Java里的this，用法也差不多，若无歧义可省略
    }
    
    init?(latitude: Double, longitude: Double){
        self.latitude = latitude
        self.longitude = longitude
    }
}

let loc = Location1(coordinateString: "fefefefe")

// 枚举可以有方法

enum Shape{
    case Square(side: Double)
    case Rectangle(width: Double, height: Double)
    case Circle(centerx: Double, centery: Double, radius: Double)
    case Point
    
    func area() -> Double{
        switch self {
        case let .Square(side):
            return side * side
        case let .Rectangle(width, height):
            return width * height
        case let .Circle(_, _, r):
            return Double.pi * r * r
        case .Point:
            return 0
        }
    }
}

let square = Shape.Square(side: 10)
let circle = Shape.Circle(centerx: 0, centery: 0, radius: 15)
square.area()
circle.area()

// 结构体是值类型，即赋值即为拷贝

//-------------------------------

// 类

class Person{
    var firstname: String
    var lastName: String
    
    init(firstName: String, lastName: String) {
        self.firstname = firstName
        self.lastName = lastName
    }
    
    
}

let person1 = Person(firstName: "Joe", lastName: "Guo")
person1.firstname = "Jojo"

let person2 = person1
person1 === person2

// 结构体内存空间开在系统的栈中，类开在堆中

// 计算属性

struct Point{
    var x=0.0
    var y=0.0
}

struct Size{
    var width=0.0
    var height=0.0
}

class Rectangle{
    var origin = Point()
    var size = Size()
    var center: Point{
        // getter
        get{
            let centerX = origin.x + size.width/2
            let centerY = origin.y + size.height/2
            return Point(x: centerX, y: centerY)
        }
        // setter
        set(newValue){
            origin.x = newValue.x - size.width/2
            origin.y = newValue.y - size.height/2
        }
    }
    
    var area: Double{
        return size.width * size.height
    }
    
    init(origin: Point, size: Size){
        self.origin
        self.size = size
    }
}

var rect = Rectangle(origin: Point(), size: Size(width: 10, height: 5))
rect.center
rect.center = Point()
rect

// Type Property

class Play{
    var name: String
    var score = 0
    static var highestScore = 0
    
    init(name: String){
        self.name = name
    }
    
    func play(){
        if self.score > Play.highestScore{
            Play.highestScore = self.score
        }
    }
}

// Property Obsever
class LightBulb{
    static let maxCurrent = 30
    var current = 0 {
        didSet{
            // 当新的值赋值给current时x运行
            if current == LightBulb.maxCurrent{
                print("current == LightBulb.maxCurrent")
            }else if current > LightBulb.maxCurrent{
                print("current > LightBulb.maxCurrent")
                current = oldValue
            }
        }
    }
}

let bulb = LightBulb()
bulb.current = 20
bulb.current = 40


import UIKit

enum Theme{
    case DayMode
    case NightMode
}

public class UI{
    var fontColor: UIColor! // 不希望为nil, 但是根据themeMode来决定其值，在初始化时为nil
    var backgroundColor: UIColor!
    var themeMode: Theme = .DayMode{
        didSet{
            switch(themeMode){
            case .DayMode:
                fontColor = UIColor.black
                backgroundColor = UIColor.white
            case .NightMode:
                fontColor = UIColor.white
                backgroundColor = UIColor.black
            }
            
        }
    }
    
    init(themeMode: Theme){
        self.themeMode = themeMode
    }
}

let ui = UI(themeMode: .DayMode) // init里的赋值不会触发didSet
ui.themeMode
ui.fontColor
ui.backgroundColor
ui.themeMode = .NightMode
ui.themeMode
ui.fontColor
ui.backgroundColor

// Lazy Property
class ClosedRange{
    let start: Int
    let end: Int
    lazy var sum: Int = { // 计算一次就不再计算，不加lazy每次调用sum都会重新计算
        var res = 0
        for index in self.start..<self.end{
            res += index
        }
        return res
    }()
    
    var width: Int{
        return end - start + 1
    }
    
    init?(start: Int, end: Int){
        if start > end{
            return nil
        }
        self.start = start
        self.end = end
    }
}

if let range = ClosedRange(start: 0, end: 1000){
    range.width
    range.sum
}

class Web{
    let url: String
    lazy var html: String? = {
        return nil
    }()
    
    init(url: String){
        self.url = url
    }
}

// 访问控制

class Account{
    var username: String
    var password: String
    
    init(username: String, password: String) {
        self.username = username
        self.password = password
    }
    
    private func changePwd(password: String){
        self.password = password
    }
}

var account1 = Account(username: "J0e", password: "Password2")
account1.password
// account1.changePwd("Tuesday2")
account1.password

//-------------------------------
/**
 Root class for user, worrier
 */
class Avatar{
    var name: String
    var life: Int = 100
    
    var description: String{
        return "I'm Avatar \(name)."
    }
    
    init(name: String){
        self.name = name
    }
    
    var isAlive: Bool = true
    
    /// attack this object
    func beAttacked(attack: Int){
        self.life -= attack
    }
}

class User: Avatar{
    var score = 0
    var level = 0
    override var description: String{
        return "I'm Avatar \(name)."
    }
    
    var group:String
    
    init(name: String, group: String) {
        // 构造初值
        self.group = group
        super.init(name: name)
        // 进一步完善
        if group == ""{
            self.getScore(score: -10)
        }
    }
    
    final func getScore(score: Int){
        self.score += score
        if score > level * 100 {
            level += 1
        }
    }
}

let user = User(name: "Joe", group: "MBC")
user.name
user.group

final class Warrior: User{
    var weapon: String
    
    init(name: String, group: String, weapon: String) {
        self.weapon = weapon
        super.init(name: name, group: group)
    }
    
    override var description: String{
        return "I'm Warrior \(name)"
    }
    
    override func beAttacked(attack: Int){
        self.life -= attack/2
    }
}

let player1 = Warrior(name: "Jack", group: "Hunter", weapon: "Laser Gun")
player1.weapon
player1.name

