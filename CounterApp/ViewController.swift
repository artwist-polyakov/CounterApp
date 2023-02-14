//
//  ViewController.swift
//  CounterApp
//
//  Created by Александр Поляков on 12.02.2023.
//

import UIKit


class ViewController: UIViewController {
    
    private var counter: Int = 0
    @IBOutlet private var swipeLeft: UISwipeGestureRecognizer!
    @IBOutlet private var swipeRight: UISwipeGestureRecognizer!
    @IBOutlet weak private var counterValue: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
//        print("Запущено, значение сounter = \(counter)")
        
        
        //если в памяти устройства есть значение для счетчика
        if UserDefaults.standard.value(forKey:"counter" ) != nil {
            //присваиваем нашему счетчику
            counter = UserDefaults.standard.value(forKey: "counter") as! Int
        }
        counterValue.text = "\(counter)"
        
    }

    @IBAction private func buttonTap(_ sender: Any) {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.prepare()
        generator.impactOccurred()
        counter+=1
        counterValue.text = "\(counter)"
        //сохраняем переменную счетчика в UserDefaults
        UserDefaults.standard.setValue(counter, forKey: "counter")
//        print("Кнопка нажата")
//        print("Значение counter = \(counter)")
    }
    

    @IBAction private func swipeLeftAction(_ sender: Any) {
        if (counter > 0) {
            counter-=1
            counterValue.text = "\(counter)"
            //сохраняем переменную счетчика в UserDefaults
            UserDefaults.standard.setValue(counter, forKey: "counter")
        }
    }
    
    
    @IBAction private func swipeRightAction(_ sender: Any) {
        
        counter+=1
        counterValue.text = "\(counter)"
        UserDefaults.standard.setValue(counter, forKey: "counter")
    }
    
}

