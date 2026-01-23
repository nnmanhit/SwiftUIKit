//
//  ViewModelProtocol.swift
//  SwiftUIKit
//
//  Created by Manh Nguyen on 1/22/26.
//

import SwiftUI

@MainActor
public protocol ViewModelProtocol : ObservableObject {
    
    associatedtype Content
    var state : ViewState<Content> { get set }
    
}
