//
//  FourthViewController.swift
//  TestAplikasi
//
//  Created by Macbook on 31/10/23.
//

import UIKit


class FourthViewController: UIViewController {

    @IBOutlet weak var horizontalSlider: UISlider!
    @IBOutlet weak var switchBtn: UISwitch!

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var progressView: UIProgressView!

    @IBOutlet weak var stepper: UIStepper!

    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var dataPickerView: UIDatePicker!

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!


    var hours: [String] = []
    let minutes = Array(0...59).map { String(format: "%02d", $0) }
    let ampm = ["AM", "PM"]


    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    func setup() {
        navigationItem.title = "Test Picker View"
        titleLabel.text = "Test Hasil :"

        setupHorizontalSlider()
        setupSwitchButton()
        setupProgressView()
        setupPickerView()
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
        switchBtn.addTarget(self, action: #selector(switchValueDidChange(_:)), for: .valueChanged)
    }

    @objc func switchValueDidChange(_ sender: UISwitch) {
        let switchValue = sender.isOn
        if switchValue {
            descLabel.text = "The switch is ON"
//            setupProgressViewForLongTask()
            setupProgressDownloadTask()
        } else {
            setupProgressView()
            descLabel.text = "The switch is OFF"
        }
    }


    // MARK: handle progress view
    func setupProgressView() {
        progressView.setProgress(0.0, animated: true)
        progressView.layer.cornerRadius =  4
    }

    func setupProgressViewForLongTask() {
        // Inside your long-running task or operation
        let totalBytes: Float = 1000 // Total bytes to be downloaded
        var downloadedBytes: Float = 0 // Current bytes downloaded

        while downloadedBytes < totalBytes {
            // Simulate downloading a chunk of data
            let chunkSize: Float = 10
            downloadedBytes += chunkSize

            // Calculate progress and update the UIProgressView
            let progress = downloadedBytes / totalBytes
            progressView.setProgress(progress, animated: true)
        }
    }


  func setupProgressDownloadTask() {
      // Inside your long-running task or operation
      let totalBytes: Float = 100 // Total bytes to be downloaded
      var downloadedBytes: Float = 0 // Current bytes downloaded

      while downloadedBytes <= totalBytes {
              // Update UI on the main thread
              DispatchQueue.main.async {
                  let progress = Float(downloadedBytes) / Float(totalBytes)
                  self.progressView.setProgress(progress, animated: true)
//                  self.progressLabel.text = "\(Int(progress * 100))%"
              }

              // Simulate download time
              usleep(100000) // Sleep for 0.1 seconds (100000 microseconds)

              downloadedBytes += 5
          }
    }

    func setupPickerView() {
        hours.append(contentsOf: ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"])
        pickerView.delegate = self
        pickerView.dataSource = self
    }

}

extension FourthViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    // Assuming you have a 12-hour clock with hours, minutes, and AM/PM
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return hours.count
        } else if component == 1 {
            return minutes.count
        } else {
            return ampm.count
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return hours[row]
        } else if component == 1 {
            return minutes[row]
        } else {
            return ampm[row]
        }
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedHour = hours[pickerView.selectedRow(inComponent: 0)]
        let selectedMinute = minutes[pickerView.selectedRow(inComponent: 1)]
        let selectedAMPM = ampm[pickerView.selectedRow(inComponent: 2)]

        let selectedTime = "\(selectedHour):\(selectedMinute) \(selectedAMPM)"
        // Update a label or other UI element with the selected time
        print(selectedTime)
        descLabel.text = selectedTime
    }
}

