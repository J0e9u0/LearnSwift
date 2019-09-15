# Hello World App

## Chapter 3: Hello World! Build your first app in swift

- How does the View Controller in the storyboard link up with the ViewController class in the ViewController.swift file?

![](event&#32;flow&#32;in&#32;app.png)

- What does the block of code inside the showMessage() method mean? How does it tell iOS to show a Hello World message?

![](showMessage&#32;Method.png)

- What does @IBAction keyword mean?

This keyword allows you to connect your source code to user interface objects in Interface Builder. When it is inserted in the method declaration, it indicates the method can be exposed to Interface Builder. 

- What is behind the "Hello World" button? How can the button detect tap and trigger the showMessage() method?

Go to Main.storyboard , select View Controller in the document outline view. In the Utility area, select the Identity inspector icon and you'll find that ViewController is set as the custom class. This is how the objects in Interface Builder associate with the classes in Swift code.

- How does the Run button in Xcode work? What do you mean by "compile an app"?

The entire process can be broken into three phases: compile, package and run.
- Compile – You probably think iOS understands Swift code. In reality, iOS only reads machine code. The Swift code is for developer to write and read. To make iOS understand the source code of the app, it has to go through a translation process to translate the Swift code into machine code. This process is referred as "compile". Xcode already comes with a built-in compiler to compile the source code.
- Package – Other than source code, an app usually contains resource files such as images, text files, sound files, etc. All these resources are packaged to make up the final app. We used to refer to these two processes as the "build" process.
- Run – This actually launches the simulator and loads your app.

## Chapter 5: Introduction to Auto Layout

Auto layout is a constraint-based layout system. It allows developers to create an adaptive UI that responds appropriately to changes in screen size and device orientation. Some beginners find it hard to learn and avoid using it. Some developers even avoid using it. But believe me, you won't be able to live without it when developing an app today.

![](auto&#32;layout&#32;bar.png)

- Align – Create alignment constraints, such as aligning the left edges of two views.
- Pin – Create spacing constraints, such as defining the width of a UI control.
- Issues – Resolve layout issues.
- Stack – Embed views into a stack view. Stack view is a new feature since Xcode 7. We will further discuss about it in the next chapter.

## Chapter 6: Designing UI Using Stack Views

The stack view provides a streamlined interface for laying out a collection of views in either a column or a row.

In each Xcode project, it includes an asset catalog (i.e. Assets.xcassets) for managing images and icons that are used by your app.

## Chapter 8 Creating a Simple Table Based App


## Chapter 9

In Swift, you use @IBOutlet keyword to indicate a property of a class, that can be exposed to Interface Builder. For properties annotated with the IBOutlet keywords, we call it outlets.

### @IBAction vs @IBOutlet

We've used @IBAction to indicate action methods when developing the HelloWorld app. What's the difference between @IBAction and @IBOutlet? @IBOutlet is used to indicate a property that can be connected with a view object in a storyboard. For example, if the outlet is connected with a button, you can use the outlet to change the color or title of the button. On the other hand, @IBAction is used to indicate an action method that can be triggered by a certain event. For example, when a user taps a button, it can trigger an action method to do something.

### as! and as?

Downcasting allows you to convert a value of a class to its derived class. For example, RestaurantTableViewCell is a child class of UITableViewCell. The dequeueReusableCellWithIdentifier method always returns a UITableViewCell object. If a custom cell is used, this object can be converted to the specific cell type (e.g. RestaurantTableViewCell). Prior to Swift 1.2, you can just use the as operator for downcasting. However, sometimes the object may not be converted to a specified type. Therefore, from Swift 1.2 and onwards, Apple introduced two more operators: as! and as?. If you're quite sure that the downcasting can perform correctly, use as! to perform the conversion. In case you're not sure if the value of one type can be converted to another, use as? to perform an optional downcasting. You're required to perform additional checking to see if the downcasting is successful or not.

<!--
file:///Users/balelin/Downloads/swift-ios10-book.pdf
P173
-->

---

# Q & A

## Q

```
2019-09-15 15:33:23.965765+0800 FoodPin[19744:330045] *** Terminating app due to uncaught exception 'NSInternalInconsistencyException', reason: '-[UITableViewController loadView] instantiated view controller with identifier "UIViewController-BYZ-38-t0r" from storyboard "Main", but didn't get a UITableView.'
```

在Main.storyboard里有一个RestaurantTableViewController下的子元素是UIView，应该改成UITableView