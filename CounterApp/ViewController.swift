//
//  ViewController.swift
//  CounterApp
//
//  Created by Александр Поляков on 12.02.2023.
//

import UIKit


class ViewController: UIViewController {
    
    private var counter: Int = 0
    @IBOutlet weak private var counterValue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //если в памяти устройства есть значение для счетчика
        if UserDefaults.standard.value(forKey:"counter" ) != nil {
            //присваиваем нашему счетчику
            counter = UserDefaults.standard.value(forKey: "counter") as! Int
        }
        counterValue.text = "\(counter)"
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(onSwipeRight))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)

        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(onSwipeLeft))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
    }

    @IBAction private func buttonTap(_ sender: Any) {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.prepare()
        generator.impactOccurred()
        counterIncrimention ()
    }
    
    private func counterIncrimention () {
        counter+=1
        counterValue.text = "\(counter)"
        UserDefaults.standard.setValue(counter, forKey: "counter")
    }
    
    private func counterDecrimention () {
        if counter > 0 {
            counter -= 1
            counterValue.text = "\(counter)"
            UserDefaults.standard.setValue(counter, forKey: "counter")
        }
        
    }
    
}

private extension ViewController {
  @objc
  func onSwipeRight() {
      counterIncrimention ()
  }

  @objc
  func onSwipeLeft() {
      counterDecrimention ()
  }
}

