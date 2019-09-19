//
//  ViewController.swift
//  UIkitExampleApp
//
//  Created by Alexey Efimov on 19/09/2019.
//  Copyright © 2019 Alexey Efimov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var slider: UISlider!
    @IBOutlet var textField: UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var hideSwitch: UISwitch!
    @IBOutlet var switchLabel: UILabel!
    @IBOutlet var doneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    @IBAction func segmentedControlAction() {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            mainLabel.text = "The first segment is selected"
            mainLabel.textColor = .red
        case 1:
            mainLabel.text = "The second segment is selected"
            mainLabel.textColor = .blue
        case 2:
            mainLabel.text = "The third segment is selected"
            mainLabel.textColor = .yellow
        default: break
        }
    }
    
    @IBAction func sliderAction() {
        mainLabel.text = String(slider.value)
        
        let backgoundColor = view.backgroundColor
        view.backgroundColor = backgoundColor?.withAlphaComponent(CGFloat(slider.value))
    }
    
    @IBAction func donePressed() {
        guard let inputText = textField.text, !inputText.isEmpty else { return }
        
        if let _ = Double(inputText) {
            showAlert(title: "Wrong format!", message: "Pleas enter your name")
        } else {
            mainLabel.text = inputText
            textField.text = nil
        }
    }
    
    @IBAction func changeDate() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.locale = Locale(identifier: "ru_RU")
        
        let currentDate = dateFormatter.string(from: datePicker.date)
        mainLabel.text = currentDate
    }
    
    @IBAction func switchAction() {
        
        segmentedControl.isHidden.toggle()
        mainLabel.isHidden.toggle()
        slider.isHidden.toggle()
        textField.isHidden.toggle()
        doneButton.isHidden.toggle()
        datePicker.isHidden.toggle()
        
        switchLabel.text = hideSwitch.isOn ? "Скрыть все элементы" : "Отобразить все элементы"
    }
}

extension ViewController {
    private func setupView() {
        mainLabel.font = mainLabel.font.withSize(35)
        mainLabel.textAlignment = .center
        mainLabel.numberOfLines = 2
        
        segmentedControl.insertSegment(withTitle: "Third", at: 2, animated: false)
        
        slider.value = 1
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.minimumTrackTintColor = .yellow
        slider.maximumTrackTintColor = .red
        slider.thumbTintColor = .blue
        
        mainLabel.text = String(slider.value)
        
        datePicker.locale = Locale(identifier: "ru_RU")
//        datePicker.locale = Locale.current
        
        hideSwitch.onTintColor = .red
        switchLabel.text = "Скрыть все элементы"
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.textField.text = nil
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
