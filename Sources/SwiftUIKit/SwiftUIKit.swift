// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

public struct SkeletonView<S: Shape> : View {
    
    private let shape : S
    private let color : Color
    
    @State private var isAnimating : Bool = false
    
    init(shape: S, _color: Color = .gray.opacity(0.3)) {
        self.shape = shape
        self.color = _color
    }
    
    public var body: some View {
        shape
            .fill(color)
            .overlay {
                GeometryReader {
                    let size = $0.size
                    let skeletonWidth = size.width / 2
                    let blurRadius = max(skeletonWidth/2, 30)
                    let blurDiameter = blurRadius * 2
                    
                    let minX = -(skeletonWidth+blurDiameter)
                    let maxX = size.width + skeletonWidth + blurDiameter
                    
                    Rectangle()
                        .fill(.gray)
                        .frame(width: skeletonWidth, height: size.height * 2)
                        .frame(height: size.height)
                        .blur(radius: blurRadius)
                        .rotationEffect(Angle(degrees: rotation))
                        .blendMode(.softLight)
                        .offset(x: isAnimating ? maxX : minX)
                }
            }
            .clipShape(shape)
            .compositingGroup()
            .onAppear {
                guard isAnimating == false else {
                    return
                }
                
                withAnimation(animation) {
                    isAnimating = true
                }
            }
            .onDisappear {
                self.isAnimating = false
            }
            .transaction {
                if $0.animation != animation {
                    $0.animation = .none
                }
            }
    }
    
    var rotation : Double {
        return 5
    }
    
    var animation : Animation {
        return .easeIn(duration: 1.5).repeatForever(autoreverses: false)
    }
    
}

#Preview {
    SkeletonView(shape: .circle)
        .frame(width: 100, height: 100)
}

