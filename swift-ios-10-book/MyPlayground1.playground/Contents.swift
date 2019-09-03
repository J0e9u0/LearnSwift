import UIKit

var str = "Hello, playground begin at PDF P24"

// UILabel
let cg = CGRect(x: 0, y: 0, width: 300, height: 50)
let messageLabel = UILabel(frame: cg)
messageLabel.text = str
messageLabel.backgroundColor = UIColor.orange
messageLabel.textAlignment = NSTextAlignment.center
messageLabel.layer.cornerRadius = 10.0
messageLabel.clipsToBounds = true
messageLabel
