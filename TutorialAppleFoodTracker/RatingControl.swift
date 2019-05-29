import UIKit


@IBDesignable class RatingControl: UIStackView {
    private var ratingButtons = [UIButton]()
    var rating = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder:coder)
        setupButtons()
    }
    
    @objc func ratingButtonTapped(button:UIButton){
        print("Button pressed 👍")
    }
    
    private func setButtonConstraint(button:UIButton, thingToBeAtLeft:UIView? = nil){
        button.translatesAutoresizingMaskIntoConstraints = false
        var horizontalConstraint : NSLayoutConstraint
        if(thingToBeAtLeft == nil){
            horizontalConstraint = NSLayoutConstraint(item: button,
                                    attribute: NSLayoutConstraint.Attribute.leading,
                                    relatedBy: NSLayoutConstraint.Relation.equal,
                                    toItem: self,
                                    attribute: NSLayoutConstraint.Attribute.leading,
                                    multiplier: 1,
                                    constant: 8)
        }else{
            horizontalConstraint = NSLayoutConstraint(item: button,
                                    attribute: NSLayoutConstraint.Attribute.leading,
                                    relatedBy: NSLayoutConstraint.Relation.equal,
                                    toItem: thingToBeAtLeft,
                                    attribute: NSLayoutConstraint.Attribute.trailing,
                                    multiplier: 1,
                                    constant: 8)
        }

        let verticalConstraint = NSLayoutConstraint(item: button,
                                                    attribute: NSLayoutConstraint.Attribute.top,
                                                    relatedBy: NSLayoutConstraint.Relation.equal,
                                                    toItem: self,
                                                    attribute: NSLayoutConstraint.Attribute.top,
                                                    multiplier: 1,
                                                    constant: 0)
        let widthConstraint = NSLayoutConstraint(item: button,
                                                 attribute: NSLayoutConstraint.Attribute.width,
                                                 relatedBy: NSLayoutConstraint.Relation.equal,
                                                 toItem: nil,
                                                 attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                                                 multiplier: 1,
                                                 constant: 44.0)
        let heightConstraint = NSLayoutConstraint(item: button,
                                                  attribute: NSLayoutConstraint.Attribute.height,
                                                  relatedBy: NSLayoutConstraint.Relation.equal,
                                                  toItem: nil,
                                                  attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                                                  multiplier: 1,
                                                  constant: 44.0)
        self.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
        
    }
    
    private func setupButtons(){
        for _ in 0..<5 {
            let button = UIButton()
            button.backgroundColor = UIColor.red
            addSubview(button)
            button.addTarget(self,
                         action: #selector(RatingControl.ratingButtonTapped(button:)),
                         for: .touchUpInside)
            ratingButtons.append(button)
        }
        setButtonConstraint(button: ratingButtons[0])
        setButtonConstraint(button: ratingButtons[1], thingToBeAtLeft: ratingButtons[0])
        setButtonConstraint(button: ratingButtons[2], thingToBeAtLeft: ratingButtons[1])
        setButtonConstraint(button: ratingButtons[3], thingToBeAtLeft: ratingButtons[2])
        setButtonConstraint(button: ratingButtons[4], thingToBeAtLeft: ratingButtons[3])
        

    }
}
