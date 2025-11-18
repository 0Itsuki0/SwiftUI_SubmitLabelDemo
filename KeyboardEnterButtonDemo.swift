
import SwiftUI

struct KeyboardEnterButtonDemo: View {
    @State private var submittedField: SubmitLabel? = nil
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    Text("Not just for appearance, but also for controlling submission action using the `onSubmit(of:_:)` modifier")
                        .foregroundStyle(.secondary)
                        .fontWeight(.semibold)
                    
                    ForEach(SubmitLabel.allCases) { submitLabel in
                        TextField("", text: .constant(submitLabel.label))
                            .padding(.vertical, 8)
                            .padding(.horizontal, 16)
                            .background(RoundedRectangle(cornerRadius: 8).fill(.clear).stroke(.gray.opacity(0.7), style: .init()))
                            .submitLabel(submitLabel)
                    }
                }
                .padding()
                .scrollTargetLayout()
            }
            .scrollDismissesKeyboard(.immediately)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .background(.yellow.opacity(0.1))
            .navigationTitle("Submit Label")

        }
    }
}


extension SubmitLabel: @retroactive Equatable, @retroactive Identifiable {
    public static func == (lhs: SubmitLabel, rhs: SubmitLabel) -> Bool {
        String(describing: lhs) == String(describing: rhs)
    }
    
    public var id: String {
        return String(describing: self)
    }
    
    static let allCases: [SubmitLabel] = [
        .continue,
        .next,
        .done,
        .go,
        .join,
        .search,
        .return,
        .route,
        .send,
    ]
    
    var label: String {
        return switch self {
        case .continue:
            "Continue"
        case .next:
            "Next"
        case .done:
            "Done"
        case .go:
            "Go"
        case .join:
            "Join"
        case .search:
            "Search"
        case .return:
            "Return"
        case .route:
            "Route"
        case .send:
            "Send"
        default:
            ""
        }
    }
}

#Preview {
    KeyboardEnterButtonDemo()
}
