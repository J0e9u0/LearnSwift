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



<!--
file:///Users/balelin/Downloads/swift-ios10-book.pdf
P127
-->
