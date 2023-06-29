//
//  AuthAsyncImage.swift
//  AuthAsyncImage
//
//  Created and maintained by Bereyziat Development on 29/06/2023.
//

import SwiftUI

public struct AuthAsyncImage<Content: View, Placeholder: View>: View {
    @State private var image: Image?
    
    private var token: AccessToken?
    private let url: String
    @ViewBuilder private var content: (Image) -> Content
    @ViewBuilder private let placeholder: () -> Placeholder
    private let errorImage: Image
    // TODO: add placeholder defaultValue to ProgressView
    // Explore _ConditionalContent https://blog.eppz.eu/understanding-swiftui-dsl-conditionalcontent/
    // And see init of the Native SwiftUI AsyncImage
    
    public init(
        url: String,
        content: @escaping (Image) -> Content,
        placeholder: @escaping () -> Placeholder,
        errorImage: Image = Image(systemName: "photo")
    ) {
        self.token = nil
        self.url = url
        self.content = content
        self.errorImage = errorImage
        self.placeholder = placeholder
    }
    
    public init(
        token: AccessToken,
        url: String,
        content: @escaping (Image) -> Content,
        placeholder: @escaping () -> Placeholder,
        errorImage: Image = Image(systemName: "photo")
    ) {
        self.init(url: url, content: content, placeholder: placeholder, errorImage: errorImage)
        self.token = token
    }
    
    public var body: some View {
        Group {
            if let image {
                content(image)
            } else {
                placeholder()
            }
        }
        .task { await loadImage(url) }
        .onChange(of: url) { newValue in
            image = nil
            Task {
                await loadImage(newValue)
            }
        }
    }
    
    private func loadImage(_ url: String) async {
        do {
            guard let url = URL(string: url) else { throw ImageLoadingError.notValidUrlError }
            var request = URLRequest(url: url)
            
            if let token {
                request.setValue(token.headerString, forHTTPHeaderField: "Authorization")
            }
            
            let (data, _) = try await URLSession.shared.data(for: request)
            
            if let uiImage = UIImage(data: data) {
                image = Image(uiImage: uiImage)
            } else {
                throw ImageLoadingError.uiImageConvertionError
            }
            
        } catch {
            print(error.localizedDescription)
            
            // Set placeholder image in case of failure
            image = errorImage
        }
    }
}
