import UIKit

class ViewController: UIViewController {

    @IBOutlet weak private var label: UILabel!
    @IBOutlet weak private var log: UITextView!
    private var count: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabelText()
        log.text = "История изменений:"
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
        label.text = (count == 0) ? "0" : "Значение счетчика: \(count)"
    }
    
    private func addToLog(text: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .medium
        let currentDate = dateFormatter.string(from: Date())
        
        log.text = log.text + "\n\(currentDate): \(text)"
        
        let range = NSMakeRange(log.text.count-1, 1)
        log.scrollRangeToVisible(range)
    }
}

