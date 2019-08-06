import UIKit
import XCPlayground

let showView = UIView(frame: <#T##CGRect#>(x: 0, y: 0, width: 300, height: 300))

var window: UIWindow?
window = UIWindow(frame: UIScreen.main.bounds)
window?.backgroundColor = UIColor.white
window?.rootViewController = UIViewController()
window?.makeKeyAndVisible()

let rectangle = UIView(frame: <#T##CGRect#>(x: 0, y: 0, width: 300, height: 300))
