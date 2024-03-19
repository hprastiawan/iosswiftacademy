//
//  SecondViewController.swift
//  ProjectPertama
//
//  Created by Macbook on 16/02/24.
//

import UIKit

class SecondViewController: UIViewController {

  @IBOutlet weak var switchButton: UISwitch!
  @IBOutlet weak var horizontalSlider: UISlider!

  @IBOutlet weak var progressView: UIProgressView!

  @IBOutlet weak var descLabel: UILabel!

  override func viewDidLoad() {
        super.viewDidLoad()
        setupProgressView()
        setupHorizontalSlider()
        setupSwitchButton()

    }
  // MARK: handle progress view
  func setupProgressView() {
      progressView.setProgress(0.5, animated: true)
  }

  // MARK: handle slider view
  func setupHorizontalSlider() {
      horizontalSlider.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
  }

  @objc func sliderValueChanged(_ sender: UISlider) {
      let value = sender.value
      print("Slider value: \(value)")
      descLabel.text = String(value)
  }

  // MARK: handle switch view
  func setupSwitchButton() {
      switchButton.addTarget(self, action: #selector(switchValueDidChange(_:)), for: .valueChanged)
  }

  @objc func switchValueDidChange(_ sender: UISwitch) {
      let switchValue = sender.isOn
      if switchValue {
          descLabel.text = "The switch is ON"
          view.backgroundColor = .black
      } else {
          setupProgressView()
          descLabel.text = "The switch is OFF"
         view.backgroundColor = .yellow
      }
  }




}
