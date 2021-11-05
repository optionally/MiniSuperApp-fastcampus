//
//  SuperPayDashBoardViewController.swift
//  MiniSuperApp
//
//  Created by teamwink on 2021/11/05.
//

import ModernRIBs
import UIKit

protocol SuperPayDashBoardPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class SuperPayDashBoardViewController: UIViewController, SuperPayDashBoardPresentable, SuperPayDashBoardViewControllable {

    weak var listener: SuperPayDashBoardPresentableListener?
}
