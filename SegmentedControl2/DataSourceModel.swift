import Foundation
import SwiftUI

struct Item: Hashable, Codable, Identifiable {
  var id: Int = 0
  var title: String = ""
}

struct Model: Hashable, Codable, Identifiable {
  var id: Int = 0
  var title: String = ""
  var list:[Item] = [Item(id: 0, title: "one"),
                     Item(id: 1, title: "two"),
                     Item(id: 2, title: "three")]
  
}

final class DataModel: ObservableObject {
  
  @Published var sections:[Model] = [Model(id: 0, title: "one"),
                                     Model(id: 1, title: "two"),
                                     Model(id: 2, title: "three")]
  
  
}

let APPWidth = UIScreen.main.bounds.width
