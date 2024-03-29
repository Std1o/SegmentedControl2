import SwiftUI

struct MySegmentControl: View {
  
  @Binding var index: Int
  @EnvironmentObject var model:DataModel
  @State private var frames:[Int:CGFloat] = [:]
  
  var body: some View {
    GeometryReader { geometry in
      ScrollView(.horizontal, showsIndicators: false) {
        HStack {
            HStack(spacing: 40) {
            ForEach(self.model.sections) { section in
              VStack(spacing: 0) {
                Text("\(section.title)")
                  .overlay(MoveUnderlineButton(){
                    withAnimation {
                      self.index = self.model.sections.firstIndex(of: section) ?? 0
                    }
                  })
                  .frame(height: 17)
                  .background (
                    GeometryReader { geo in
                      Color.clear.onAppear {
                        let index = self.model.sections.firstIndex(of: section) ?? 0
                        self.frames[index] = geo.frame(in: .global).midX - 11.5
                      }
                    }
                )
                Spacer()
              }
            }
          }.frame(width: geometry.size.width,
                  height: nil,
                  alignment: .center)
          Spacer()
            .frame(width: 24)
        }
        .coordinateSpace(name: "container")
        .overlay(self.underline, alignment: .bottomLeading)
        .animation(.spring())
      }
    }
  }
  
  var underline: some View {
    Color.red
      .frame(width: 23, height: 5)
      .padding(.leading, self.frames[self.index] ?? 0)
  }
}

struct MoveUnderlineButton: View {
  
  let action: () -> Void
  
  var body: some View {
    GeometryReader { geometry in
      Button(action: {
        self.action()
      }) {
        Rectangle().foregroundColor(.clear)
      }
    }
  }
}
