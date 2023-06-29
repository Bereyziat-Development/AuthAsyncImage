//
//  ExampleView.swift
//  AuthAsyncImage
//
//  Created and maintained by Bereyziat Development on 29/06/2023.
//

import SwiftUI

struct ExampleView: View {
    let myURL = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTps49CxS3mpmPzrFA4aY6cSRtxjz6BYfdqj00WSqB83urjS-HsMbs3eiXg30iw4tF8BIU&usqp=CAU"
    var body: some View {
        VStack {
            Text("AuthAsyncImage")
            //Auth version with an aditional token parameter (not specified here)
            // Errors for a wrongly formeted URL are handled in the component
            AuthAsyncImage(url: myURL) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .frame(maxWidth: 100, maxHeight: 100)
            } placeholder: {
                ProgressView()
            }
            Text("SwiftUI AsyncImage")
            // Native SwiftUI version
            AsyncImage(url: URL(string: myURL)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .frame(maxWidth: 100, maxHeight: 100)
            } placeholder: {
                ProgressView()
            }
        }
    }
}

struct ExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleView()
    }
}
