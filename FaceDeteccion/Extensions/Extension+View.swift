//
//  Extension+View.swift
//  FaceDeteccion
//
//  Created by jhonatan on 11/12/25.
//

import SwiftUI

extension View {
    func showLoading(_ isLoading: Bool) -> some View {
        self.modifier(LoadingModifier(isLoading: isLoading))
    }
}
