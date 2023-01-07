//
//  ViewController.swift
//  AsyncAwaitTest
//
//  Created by Tomato on 2021/10/09.
//

import UIKit

class ViewController: UIViewController {
	// MARK: - IBOutlet
	@IBOutlet weak var label: UILabel!
	
	
	// MARK: - IBAction
	@IBAction func buttonTapped(_ sender: UIButton) {
		Task {
			let bool = await readData()
			if bool {
				print("Done!")
			}
		}
	}
	
	
	// MARK: - Life cycle
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	func readData() async -> Bool {
		for i in 0..<10 {
			let text = String(i)
			DispatchQueue.main.async() { [weak self] in
				self?.label.text = text
			}
			print(text)
			sleep(1)
		}
		return true
	}
}

