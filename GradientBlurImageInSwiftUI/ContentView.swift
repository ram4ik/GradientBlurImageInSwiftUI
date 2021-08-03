//
//  ContentView.swift
//  GradientBlurImageInSwiftUI
//
//  Created by ramil on 03.08.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Image("cat")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 400)
            Blur(style: .dark)
                .frame(height: 400)
            Image("cat")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 400)
                .mask(
                    LinearGradient(gradient: Gradient(colors: [
                        Color.white.opacity(0.1),
                        Color.white,
                        Color.white.opacity(0.1)
                        
                    ]), startPoint: .top, endPoint: .bottom)
                )
        }
    }
}

struct Blur: UIViewRepresentable {
    var style: UIBlurEffect.Style = .systemMaterial
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
