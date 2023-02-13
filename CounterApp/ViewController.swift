//
//  ViewController.swift
//  CounterApp
//
//  Created by Александр Поляков on 12.02.2023.
//

import UIKit

extension UINavigationController {
    //блокируем переход в портретный режим
    override open var shouldAutorotate: Bool {
        return false
    }
}

class ViewController: UIViewController {
    
    var counter: Int = 0
    @IBOutlet var swipeLeft: UISwipeGestureRecognizer!
    @IBOutlet weak var counterValue: UILabel!

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    
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

    @IBAction func buttonTap(_ sender: Any) {
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
    

    @IBAction func swipeLeftAction(_ sender: Any) {
        if (counter > 0) {
            counter-=1
            counterValue.text = "\(counter)"
            //сохраняем переменную счетчика в UserDefaults
            UserDefaults.standard.setValue(counter, forKey: "counter")
        }
    }
}

