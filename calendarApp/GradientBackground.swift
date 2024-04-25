import SwiftUI

struct GradientBackground: View {
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color.blue, Color.white, Color.green.opacity(0.4)]),
                       startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
    }
}
