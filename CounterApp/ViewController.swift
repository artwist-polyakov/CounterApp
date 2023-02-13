//
//  ViewController.swift
//  CounterApp
//
//  Created by Александр Поляков on 12.02.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var counter: Int = 0

    @IBOutlet var swipeLeft: UISwipeGestureRecognizer!
    
    @IBOutlet weak var counterValue: UILabel!


    
    override func viewDidLoad() {
        super.viewDidLoad()
//        print("Запущено, значение сounter = \(counter)")
        if UserDefaults.standard.value(forKey:"counter" ) != nil {
            counter = UserDefaults.standard.value(forKey: "counter") as! Int
        }
        counterValue.text = "\(counter)"
        
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonTap(_ sender: Any) {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.prepare()
        generator.impactOccurred()
        counter+=1
        counterValue.text = "\(counter)"
        UserDefaults.standard.setValue(counter, forKey: "counter")
//        print("Кнопка нажата")
//        print("Значение counter = \(counter)")
    }
    

    @IBAction func swipeLeftAction(_ sender: Any) {
        if (counter > 0) {
            counter-=1
            counterValue.text = "\(counter)"
            UserDefaults.standard.setValue(counter, forKey: "counter")
        }
    }
}

