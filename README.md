# A Swift intro to iOS
### Topics to cover:
1. [Setting up an Xcode Project](#setting-up-an-xcode-project)
1. [StoryBoards vs Programmatically](#storyboards-vs-programmatically)
1. [What is the `AppDelegate` and a `ViewController`?](#what-is-the-appdelegate-and-a-viewcontroller-)
1. [Basic View Layout](#basic-view-layout)

### Prerequisites:
* MacOS - you can only develop for iPhone on a Mac
* Xcode 8.2.1 - the SDK changes pretty dramatically every year

## Setting up an Xcode Project
Here we will set up an Xcode project for development from the ground up! This is a _programmatic environment_ (no StoryBoards).



1. Open up Xcode and you should be prompted with this screen 👇

  <img src="/images/XcodeHello.png" height="300"/>

1. Select **"Create a new Xcode project"**

1. **Pick "Single View Application"**

  <img src="/images/SingleViewApplication.png" height="300"/>

1. Fill out some information and **make sure language is set to Swift**.

  <img src="/images/FillOutSomeInfo.png" height="300"/>

1. From the file selector on the left, **delete** `Main.StoryBoard`.

  <img src="/images/Directory.png" height="300"/>

1. Click on the project file at the top of the file selector (the blue icon that says "DemoApp"). This should display some app configuration options. Under the Deployment Info section, **change the Main Interface option to be blank**.

  <img src="/images/RemoveMain.png" height="300"/>

#### Alright we are ready to get programming!

![Nice](https://m.popkey.co/a5837f/xMKOr.gif)

## StoryBoards vs Programmatically
Why the heck would I not just drag and drop? Isn't that easier?

* Storyboards are more prone to version conflicts due to their complex XML structure. This makes merging much harder than with code.
* It's easier to structure and reuse views in code, thereby keeping your codebase DRY (DON'T REPEAT YOURSELF). StoryBoards are less component oriented therefore making your WET (WASTING EVERYBODY'S TIME).
* All information is in one place. In Interface Builder you have to click through all the inspectors to find what you're looking for.
* Storyboards introduce coupling between your code and UI, which can lead to crashes e.g. when an outlet or action is not set up correctly. These issues are not detected by the compiler.

## What is the `AppDelegate` and a `ViewController`?
#### Quick definitions:

`AppDelegate` is entry point to your app. It receives all sorts of events regarding the apps running state like:
* `didFinishLaunchingWithOptions`
* `applicationDidEnterBackground`
* `applicationWillTerminate`

(just some of them)

A `ViewController` is just a container for you views. It will bring your views onto the canvas that is the screen and manage them by providing them with data. It receives view related events:
* `ViewDidLoad`
* `ViewDidAppear`
* `ViewWillDisappear`

(just some, there are a bunch)

## Basic View Layout
1. To start we are going to get our `ViewController` on screen. Inside the `AppDelegate` inside `didFinishLaunchingWithOptions` put the following:
```Swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
	// Override point for customization after application launch.

	let rootViewController = ViewController()
	window = UIWindow(frame: UIScreen.main.bounds)
	window?.rootViewController = rootViewController
	window?.makeKeyAndVisible()

	return true
}
```
All that is happening here is you are creating a `Window` object which is basically a canvas to put your views on.

1. Then inside your `ViewController` lets change the `view` property's `backgroundColor` inside `ViewDidLoad` like so:

  ```Swift
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .blue

  }
  ```
  If you run your app you should see a blue screen (if you've used windows this might look familiar)

1. Now lets add some words to our canvas. Create a label property and add it to the class. Then we want to give the label a frame and add it as a subview to our `ViewController` in our `ViewDidLoad` like so:

  ```Swift
  let label = UILabel()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .blue

    label.text = "hello!"
    label.frame = CGRect(x: 20, y: 40, width: view.frame.width, height: 20)
    view.addSubview(label)
  }
  ```
  If you run the app now you should see your cool first app that does a thing (good for you 🎉).
1. Now lets go the extra mile and add a button and some cool stuff. Heres the code:
```Swift
class ViewController: UIViewController {

	let label = UILabel()
	let textField = UITextField()
	let button = UIButton(type: .roundedRect)

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .blue

		label.text = "hello!"
		label.frame = CGRect(x: 20, y: 40, width: view.frame.width, height: 20)
		view.addSubview(label)

		textField.borderStyle = .roundedRect
		textField.frame = CGRect(x: 20, y: label.frame.maxY + 10, width: view.frame.width - 40 , height: 30)
		view.addSubview(textField)

		button.setTitle("Set Text", for: .normal)
		button.addTarget(self, action: #selector(ViewController.buttonPressed), for: .touchUpInside)
		button.frame = CGRect(x: 20, y: textField.frame.maxY + 10, width: view.frame.width - 40, height: 30)
		view.addSubview(button)
	}

	func buttonPressed() {
		label.text = textField.text
	}
}
```
