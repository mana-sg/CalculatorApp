
import UIKit

class ViewController: UIViewController {
    
    var result: String = "0"
    var expressionEntered: String = ""

    
    @IBOutlet weak var labelDisplay: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        labelDisplay.text = "0"
    }


    @IBAction func buttonPressed(_ sender: UIButton) {
        let labelPressed = sender.currentTitle!
        
        if labelPressed == "AC" {
            labelDisplay.text = "0"
            result = "0"
            expressionEntered = ""
        }
        
        else if labelPressed == "%" {
            if result != "0"{
                labelDisplay.text = String(Int(result)!*100) + "%"
                result = "0"
            }
            else {
                return
            }
        }
        
        else if (sender.tag == 11) {
            if result != "0" {
                if result.first == "-" {
                    result = result.replacingCharacters(in: ...result.startIndex, with: "")
                }
                else {
                    result = "-" + result
                }
            }
            labelDisplay.text = result
        }
        else if labelPressed == "=" {
            let expression = NSExpression(format: expressionEntered)
            result = "\(expression.expressionValue(with: nil, context: nil) ?? 0)"
            labelDisplay.text = "\(result)"
            expressionEntered = result
        }
        
        else {

            if labelDisplay.text == "0" {
                labelDisplay.text = labelPressed
                expressionEntered += labelPressed
            }
            else {
                if sender.tag == 14 {
                    expressionEntered += "*"
                    print(expressionEntered)
                }
                else if sender.tag == 13 {
                    expressionEntered += "/"
                    print(expressionEntered)
                }
                else {
                    expressionEntered += labelPressed
                }
                labelDisplay.text! += labelPressed
            }
        }
    }
}

