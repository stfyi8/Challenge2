import SwiftUI

struct PostsView: View {
    let colors: [Color] = [.red, .blue, .green, .orange, .purple]
    
    @State private var currentIndex: Int = 0
    @State private var text = ""
    @State private var counter = 0
    var body: some View {
        VStack(spacing: 20) {
            TabView(selection: $currentIndex) {
                ForEach(0..<counter, id: \.self) { index in
                    Rectangle()
                        .fill(colors[index % colors.count])
                        .cornerRadius(20)
                        .shadow(color: .black.opacity(0.15), radius: 8, x: 0, y: 4)
                        .frame(height: 380)
                        .padding(.horizontal, 40)
                        .tag(index)
                }
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        Text("Card \(currentIndex + 1) of \(colors.count)")

            TextField(
                "Text",
                text: $text
            )
            .border(.black)
            
            HStack{
                Button("Save") {
                    text=""
                    counter+=1
                }
                .padding(.horizontal,30)
                
                Button("Delete") {
                    counter-=1
                }
                .foregroundStyle(.red)
                .padding(.horizontal,30)
        }
        .padding()
    }
}

#Preview {
    PostsView()
}
