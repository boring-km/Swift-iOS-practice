//
//  WebViewModel.swift
//  WebKitTest
//
//  Created by kangmin on 2022/03/21.
//

import Foundation
import Combine

class WebViewModel: ObservableObject {
    var foo = PassthroughSubject<Bool, Never>()
    var bar = PassthroughSubject<Bool, Never>()
}
