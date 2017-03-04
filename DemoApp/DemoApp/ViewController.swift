//
//  ViewController.swift
//  DemoApp
//
//  Created by Benjamin Emdon on 2017-03-03.
//  Copyright © 2017 Benjamin Emdon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	let label = UILabel()
	let textField = UITextField()
	let button = UIButton(type: .roundedRect)

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .blue

		label.text = "hello!"
		label.frame = CGRect(x: 20, y: 40, width: view.frame.width, height: 20)
		view.addSubview(label)

		textField.borderStyle = .roundedRect
		textField.frame = CGRect(x: 20, y: label.frame.maxY + 10, width: view.frame.width - 40 , height: 30)
		view.addSubview(textField)

		button.setTitle("Set Text", for: .normal)
		button.addTarget(self, action: #selector(ViewController.buttonPressed), for: .touchUpInside)
		button.frame = CGRect(x: 20, y: textField.frame.maxY + 10, width: view.frame.width - 40, height: 30)
		view.addSubview(button)
	}

	func buttonPressed() {
		label.text = textField.text
	}
}

