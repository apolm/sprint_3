import UIKit

class ViewController: UIViewController {

    @IBOutlet weak private var counterLabel: UILabel!
    @IBOutlet weak private var logTextView: UITextView!
    private var count: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabelText()
        logTextView.text = "История изменений:"
    }

    @IBAction private func plusDidTap(_ sender: Any) {
        count += 1
        setLabelText()
        addToLog(text: "значение изменено на +1")
    }
    
    @IBAction private func minusDidTap(_ sender: Any) {
        if count == 0 {
            addToLog(text: "попытка уменьшить значение счётчика ниже 0")
        } else {
            count -= 1
            setLabelText()
            addToLog(text: "значение изменено на -1")
        }
    }
    
    @IBAction private func clearDidTap(_ sender: Any) {
        count = 0
        setLabelText()
        addToLog(text: "значение сброшено")
    }
    
    private func setLabelText() {
        counterLabel.text = (count == 0) ? "0" : "Значение счетчика: \(count)"
    }
    
    private func addToLog(text: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .medium
        let currentDate = dateFormatter.string(from: Date())
        
        logTextView.text = logTextView.text + "\n\(currentDate): \(text)"
        
        let range = NSMakeRange(logTextView.text.count-1, 1)
        logTextView.scrollRangeToVisible(range)
    }
}

