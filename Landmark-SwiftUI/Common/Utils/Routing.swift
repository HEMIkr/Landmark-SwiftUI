
import SwiftUI

enum PresentationType {
    case present, push
}

protocol Destination: Equatable {
    associatedtype Body : View
    @ViewBuilder var destinationView: Self.Body { get }
    var presentation: PresentationType { get }
}

struct Router<D: Destination>: ViewModifier {
    @Binding var destination: D?
    @State private var shouldRoute = false
    func body(content: Content) -> some View {
        VStack {
            if let destination = destination {
                let destinationView = destination.destinationView
                    .onDisappear {
                        self.destination = nil
                    }
                switch destination.presentation {
                case .push:
                    NavigationLink(
                        destination: destinationView,
                        isActive: $shouldRoute,
                        label: { EmptyView() })
                    content
                case .present:
                    content.sheet(isPresented: $shouldRoute) { destinationView }
                }
            } else {
                content
            }
        }.onChange(of: destination) { value in
//            isPresented = value != nil
        }
    }
}

extension View {
    func routing<D: Destination>(_ destination: Binding<D?>) -> some View {
        modifier(Router(destination: destination))
    }
}
