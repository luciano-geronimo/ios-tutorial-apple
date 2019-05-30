import UIKit


@IBDesignable class RatingControl: UIStackView {
    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0) {
        didSet{
            setupButtons()
        }
    }
    @IBInspectable var starCount: Int = 5 {
        didSet {
            setupButtons()
        }
    }
    
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
                                                 constant: starSize.width)
        let heightConstraint = NSLayoutConstraint(item: button,
                                                  attribute: NSLayoutConstraint.Attribute.height,
                                                  relatedBy: NSLayoutConstraint.Relation.equal,
                                                  toItem: nil,
                                                  attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                                                  multiplier: 1,
                                                  constant: starSize.height)
        self.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
        
    }
    
    private func setupButtons(){
        for btn in ratingButtons {
            
            //removeArrangedSubview(btn)
            btn.removeFromSuperview()
        }
        ratingButtons.removeAll()
        for _ in 0..<starCount {
            let button = UIButton()
            button.backgroundColor = UIColor.red
            addSubview(button)
            button.addTarget(self,
                         action: #selector(RatingControl.ratingButtonTapped(button:)),
                         for: .touchUpInside)
            ratingButtons.append(button)
        }
        for i in 0..<starCount {
            if(i==0){
                setButtonConstraint(button: ratingButtons[i])
            }else{
                setButtonConstraint(button: ratingButtons[i], thingToBeAtLeft: ratingButtons[i-1])
            }
        }
        
    }
}
