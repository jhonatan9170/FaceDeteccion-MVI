//
//  MainView.swift
//  FaceDeteccion
//
//  Created by jhonatan on 25/11/25.
//

import SwiftUI

struct MainView: View {
    
    private let image: UIImage
    private let text: String
    private let button: TwoStateButton
    
    init(image: UIImage, text: String, button: () -> TwoStateButton) {
        self.image = image
        self.text = text
        self.button = button()
    }
    
    var body: some View {
        VStack {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Spacer()
            Text(text).font(.title).bold()
            Spacer()
            self.button
        }
    }
    
}
