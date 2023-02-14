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
//        print("Запущено, значение сounter = \(counter)")
        
        
        //если в памяти устройства есть значение для счетчика
        if UserDefaults.standard.value(forKey:"counter" ) != nil {
            //присваиваем нашему счетчику
            counter = UserDefaults.standard.value(forKey: "counter") as! Int
        }
        counterValue.text = "\(counter)"
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: Selector(("respondToSwipeGesture:")))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
            self.view.addGestureRecognizer(swipeRight)

        let swipeLeft = UISwipeGestureRecognizer(target: self, action: Selector(("respondToSwipeGesture:")))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)

        
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
    
    private func respondToSwipeGesture(gesture: UIGestureRecognizer)
    {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer
        {
            switch swipeGesture.direction
            {
                case UISwipeGestureRecognizer.Direction.right:
                         //write your logic for right swipe
                    counerIncrimention()
                        

                case UISwipeGestureRecognizer.Direction.left:
                         //write your logic for left swipe
                    counterDecrimention ()

                default:
                    break
            }
        }
    }
    
    private func counerIncrimention () {
        counter+=1
        counterValue.text = "\(counter)"
        //сохраняем переменную счетчика в UserDefaults
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

