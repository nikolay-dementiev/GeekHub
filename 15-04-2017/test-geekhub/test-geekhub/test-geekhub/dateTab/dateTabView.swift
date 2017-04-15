//
//  dateTabView.swift
//  test-geekhub
//
//  Created by Nikolay Dementiev on 15.04.17.
//  Copyright © 2017 mc373. All rights reserved.
//

import UIKit

@IBDesignable class dateTabView: UIView {

    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */

    let label: ToolTip?
    var labelTransform:CGAffineTransform!

    let tapGestureForToolTip = UITapGestureRecognizer()

    var currentHeight: Int {
        return Int(arc4random_uniform(40))
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        setSettings()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        setSettings()
    }


    func setSettings() {
        backgroundColor = UIColor.red

        setLabetToolTit()
        tapGestureForToolTip.addTarget(self, action: #selector(dateTabView.tappedView))

        self.addGestureRecognizer(tapGestureForToolTip)
        self.isUserInteractionEnabled = true
    }


    //--------------------------------------------------------
    // MARK: Local Methods
    //--------------------------------------------------------

    func setLabetToolTit() {
        let label = ToolTip()

        insertSubview(label, belowSubview: self)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor.constraint(equalToConstant: self.frame.height).isActive = true
        label.widthAnchor.constraint(equalToConstant: self.frame.width).isActive = true


        label.bottomAnchor.constraint(equalTo: self.topAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        label.text = String(self.currentHeight)
        label.textColor = UIColor.white
        label.textAlignment = .center
        let trans1 =  CGAffineTransform(scaleX: 0, y: 0)
        let trans2 =  CGAffineTransform(translationX: 0, y: CGFloat(currentHeight))

        labelTransform = trans1.concatenating(trans2)
        label.transform = labelTransform
    }

    func tappedView(){

        if (label?.transform.ty)! > CGFloat(0) {

//            animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .CurveEaseInOut, animations: { () -> Void in
//
//                self.label?.transform = CGAffineTransformIdentity
//
//            }, completion:    nil)

            animate(withDuration: 0.75, delay: 0, animations: { () -> Void in

                self.label?.transform = CGAffineTransformIdentity

            }, completion: nil)
        }

        else {
            UIView.animate(withDuration: 0.5, delay: 0, options: .CurveEaseInOut, animations:  { () -> Void in
                self.label?.alpha = 0

            }, completion:    {_ in
                self.label?.transform = self.labelTransform
                self.label?.alpha = 1
            })
        }
        
        
        
    }
    
}
