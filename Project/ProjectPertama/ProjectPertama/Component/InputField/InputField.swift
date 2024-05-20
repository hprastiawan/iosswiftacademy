//
//  InputField.swift
//  ProjectPertama
//
//  Created by Macbook on 17/02/24.
//

import Foundation
import UIKit

@IBDesignable
class InputField: UIView {


    @IBOutlet weak var titleField: UILabel!
    @IBOutlet weak var formView: UIView!
    @IBOutlet weak var errorField: UILabel!
    @IBOutlet weak var inputTextTapRadius: UIButton!
    @IBOutlet weak var inputText: UITextField!

    // MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
    }

    // MARK: - Functions
    private func configureView() {
        let view = self.loadNib()
        view.frame = self.bounds
        view.backgroundColor = .white
        inputTextTapRadius.setTitle("", for: .normal)
        self.addSubview(view)
    }

    @IBAction func inputTapTextArea(_ sender: Any) {
        inputText.becomeFirstResponder()
    }

    func setup(title: String, placeholder: String) {
      // Pastikan bahwa outlet-outlet terhubung sebelum mengaksesnya
        if let titleField = titleField {
            titleField.text = title
        }
        if let inputText = inputText {
            inputText.placeholder = placeholder
        }

    }

}
