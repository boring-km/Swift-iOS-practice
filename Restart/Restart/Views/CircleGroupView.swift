  //
  //  CircleGroupView.swift
  //  Restart
  //
  //  Created by kangmin on 2022/09/28.
  //

import SwiftUI

struct CircleGroupView: View {
  
  @State var ShapeColor: Color
  @State var ShapeOpacity: Double
  
  var body: some View {
    ZStack {
      Circle()
        .stroke(ShapeColor.opacity(0.2), lineWidth: 40)
        .frame(width: 260, height: 260, alignment: .center)
      Circle()
        .stroke(ShapeColor.opacity(0.2), lineWidth: 80)
        .frame(width: 260, height: 260, alignment: .center)
    }
  }
}

struct CircleGroupView_Previews: PreviewProvider {
  static var previews: some View {
    ZStack {
      Color("ColorBlue")
        .ignoresSafeArea(.all, edges: .all)
      
      CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
    }
  }
}
