//
//  ViewController.swift
//  PickerTest
//
//  Created by Takuya Aso on 2020/08/27.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dateWheelsTextField: UITextField!
    @IBOutlet weak var dateCompactTextField: UITextField!
    @IBOutlet weak var dateCompactView: UIView!
    @IBOutlet weak var inlineDatePicker: UIDatePicker!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "DatePicker Sample"

        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let toolBarBtn = UIBarButtonItem(title: "DONE", style: .plain, target: self, action: #selector(doneBtn))
        toolBar.items = [toolBarBtn]
        dateWheelsTextField.delegate = self
        dateCompactTextField.delegate = self
        dateWheelsTextField.inputAccessoryView = toolBar
        // Not recommend
        dateCompactTextField.inputAccessoryView = toolBar

        // DatePicker(Compact)
        let datePicker = UIDatePicker()
        datePicker.preferredDatePickerStyle = .compact
        datePicker.datePickerMode = .date
        datePicker.calendar = Calendar.init(identifier: .gregorian)
        self.dateCompactView.addSubview(datePicker)

        // DatePicker(inline)
        self.inlineDatePicker.datePickerMode = .date
        self.inlineDatePicker.preferredDatePickerStyle = .inline
    }

    @objc func doneBtn() {
        self.view.endEditing(true)
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == self.dateWheelsTextField {
            let datePicker = UIDatePicker()
            datePicker.preferredDatePickerStyle = .wheels
            datePicker.datePickerMode = .date
            datePicker.calendar = Calendar.init(identifier: .gregorian)
            dateWheelsTextField.inputView = datePicker
            datePicker.addTarget(self, action: #selector(datePickerValueChanged(sender:)), for: UIControl.Event.valueChanged)
        } else if textField == self.dateCompactTextField {
            // Not recommend
            let datePicker = UIDatePicker()
            datePicker.preferredDatePickerStyle = .compact
            datePicker.datePickerMode = .date
            datePicker.calendar = Calendar.init(identifier: .gregorian)
            dateCompactTextField.inputView = datePicker
            datePicker.addTarget(self, action: #selector(datePickerValueChanged(sender:)), for: UIControl.Event.valueChanged)
        }
    }

    @objc func datePickerValueChanged(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat  = "yyyy年MM月dd日"
        if sender.preferredDatePickerStyle == .wheels {
            dateWheelsTextField.text = dateFormatter.string(from: sender.date)
        } else if sender.preferredDatePickerStyle == .compact {
            dateCompactTextField.text = dateFormatter.string(from: sender.date)
        }
    }
}
