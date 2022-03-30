//
//  ViewController.swift
//  BarChart
//
//  Created by 김정민 on 2022/03/29.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var barStackView: UIStackView!
    private var values: [CGFloat] = []
    private var horizontalRange = (1...12)
    private var barHeightConstraints: [NSLayoutConstraint] = []
    
    private var barHeightMultipliers:[CGFloat] {
        values.map { $0 / 130 }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        randomizeValue()
        drawBars()
        
        addConstraint()
        
    }
    
    
    @IBAction func touchRandomButton() {
        randomizeValue()
        addConstraint()
        
        UIView.animate(withDuration: 0.3){
            self.view.layoutIfNeeded()
        }
        
                    
    }
    
    private func addConstraint(){
        barHeightConstraints.forEach { constraint in
            constraint.isActive = false
        }
                
        barHeightConstraints = zip(barHeightMultipliers, barStackView.arrangedSubviews).map({
            $1.heightAnchor.constraint(equalTo: barStackView.heightAnchor, multiplier: $0)
        })
        
        NSLayoutConstraint.activate(barHeightConstraints)
    }
    
    
    private func randomizeValue() {
        values = horizontalRange.map({ _ in
            CGFloat.random(in: 0...100)
        })
    }
    
    
    private func drawBars() {
        horizontalRange.forEach { x in
            let bar = UIView()
            bar.backgroundColor = .brown
            barStackView.addArrangedSubview(bar)
        }
    }

}

