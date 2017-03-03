# A Swift intro to iOS
### Topics to cover:
1. [Setting up an Xcode Project](setting-up-an-xcode-project)
1. [StoryBoards vs Programmatically]()
1. [What is the `AppDelegate` and a `ViewController` ?]()
1. [Basic View Layout]()

### Prerequisites:
* MacOS - you can only develop for iPhone on a Mac
* Xcode 8.2.1 - the SDK changes pretty dramatically every year

## Setting up an Xcode Project
Here we will set up an Xcode project for development from the ground up! This is a _programmatic environment_ (no StoryBoards).

<img src="/images/XcodeHello.png" height="300"/>

* Open up Xcode and you should be prompted with this screen 👆
* Select **"Create a new Xcode project"**

<img src="/images/SingleViewApplication.png" height="300"/>

* **Pick "Single View Application"**

<img src="/images/FillOutSomeInfo.png" height="300"/>

* Fill out some information and **make sure language is set to Swift**.

<img src="/images/Directory.png" height="300"/>

* From the file selector on the left, **delete** `Main.StoryBoard`.

<img src="/images/RemoveMain.png" height="300"/>

* Click on the project file at the top of the file selector (the blue icon that says "DemoApp"). This should display some app configuration options. Under the Deployment Info section, **change the Main Interface option to be blank**.

#### Alright we are ready to get programming!

![Nice](https://m.popkey.co/a5837f/xMKOr.gif)
