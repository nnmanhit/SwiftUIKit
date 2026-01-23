//
//  ViewState.swift
//  SwiftUIKit
//
//  Created by Manh Nguyen on 1/22/26.
//

import SwiftUI

public enum ViewState<Content> {
    
    case idle
    case loading
    case loaded(Content)
    case failed(Error)
    
}
