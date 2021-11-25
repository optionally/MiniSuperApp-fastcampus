//
//  Formatter.swift
//  MiniSuperApp
//
//  Created by hayden on 2021/11/25.
//

import Foundation

struct Formatter {
    static let balanceFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
}
