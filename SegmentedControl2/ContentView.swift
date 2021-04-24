import SwiftUI

struct ContentView: View {
  
  @State var index = 0
  let model = DataModel()
  
  var body: some View {
    VStack(spacing: 0) {
    
      MySegmentControl(index: self.$index)
        .environmentObject(self.model)
        .frame(height: 30)
      Spacer()
        .frame(height: 5)
      Color.black.opacity(0.15)
        .frame(height: 1)
      MyPageControlView(index: self.$index)
        .environmentObject(self.model)
        .frame(width: APPWidth)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
