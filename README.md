# AuthAsyncImage

The AuthenticatedAsyncImage struct allows you to load images asynchronously with authentication support. It provides a customizable progress view and a default image in case of errors or when the image is not available.



## Features

<img width="357" alt="Screenshot 2023-06-26 at 15 21 58" src="https://github.com/Bereyziat-Development/AuthAsyncImage/assets/101000022/f355cc94-84e3-4da1-9dda-26662f2023e6">





- Load images asynchronously with autethication support based on iOS 15 or later
- Customizable appearance and behavior

## Requirements

- iOS 15 or later
- Swift 5.5 or later

## Installation

### Swift Package Manager

To install the AuthAsyncImage library using Swift Package Manager, follow these steps:

1. In Xcode, open your project.
2. Go to **File** > **Swift Packages** > **Add Package Dependency**.
3. Enter the repository URL: `https://github.com/Bereyziat-Development/AuthAsyncImage.git`.
4. Click **Next** and follow the remaining steps to add the package to your project.

## Usage

1. Import the necessary modules:

```swift
import SwiftUI
import AuthAsyncImage

```
2. Create an instance of ImageData with the required parameters:
 ```swift
let imageData = ImageData(token: token, url: imageURL)
```
3. Use AuthenticatedAsyncImage in your SwiftUI view:
 ```swift
   AuthenticatedAsyncImage(imageData: imageData, defaultImage: defaultImage, progressView: progressView)
```

4. Customization

The SwiftUIAdaptiveActionSheet you can customize the defaultImage and progressView properties to match your app's design.

Example
Here's an example of customizing the component:

```swift
import SwiftUI
import AuthAsyncImage

struct ContentView: View {
    let myURL = URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTps49CxS3mpmPzrFA4aY6cSRtxjz6BYfdqj00WSqB83urjS-HsMbs3eiXg30iw4tF8BIU&usqp=CAU")
    var body: some View {
        HStack {
            AuthenticatedAsyncImage(imageData: ImageData(token: nil, url: myURL!), progressView: AnyView(ProgressView()))
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .scaledToFill()
                .clipped()
                .frame(maxWidth: 100, maxHeight: 100)
                .cornerRadius(12)
            Text("Hello, world!")
        }
        .padding()
    }
}
```
## License
This library is available under the MIT license. See the LICENSE file for more information.

