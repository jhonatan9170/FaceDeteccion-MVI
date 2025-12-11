//
//  Extension+View.swift
//  FaceDeteccion
//
//  Created by jhonatan on 11/12/25.
//

import SwiftUI

extension View {
    func showLoading(_ isLoading: Bool, text: String = "Cargando...") -> some View {
        self.modifier(LoadingModifier(isLoading: isLoading, text: text))
    }
}
