//
//  ViewController.swift
//  CounterApp
//
//  Created by Александр Поляков on 12.02.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var counter: Int = 0

    @IBOutlet weak var counterValue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        print("Запущено, значение сounter = \(counter)")
        counterValue.text = "\(counter)"
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonTap(_ sender: Any) {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.prepare()
        generator.impactOccurred()
        counter+=1
        counterValue.text = "\(counter)"
//        print("Кнопка нажата")
//        print("Значение counter = \(counter)")
    }
    
}

