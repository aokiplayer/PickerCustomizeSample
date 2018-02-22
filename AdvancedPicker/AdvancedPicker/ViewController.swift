import UIKit

class ViewController: UIViewController {

    let data1: [(left: String, right: String)] = [
        ("A", "AAAAAA"),
        ("B", "BBBBBB"),
        ("C", "CCCCCC"),
        ("D", "DDDDDD"),
        ("E", "EEEEEE"),
        ("F", "FFFFFF"),
        ("G", "GGGGGG"),
        ("H", "HHHHHH"),
        ("I", "IIIIII"),
        ("J", "JJJJJJ"),
        ("K", "KKKKKK"),
        ("L", "LLLLLL"),
        ("M", "MMMMMM"),
        ("N", "NNNNNN"),
        ("O", "OOOOOO"),
    ]

    let data2: [String] = [
        "aaaaa",
        "bbbbb",
        "ccccc",
        "ddddd",
        "eeeee",
        "fffff",
        "ggggg",
        "hhhhh",
        "iiiii",
        "jjjjj",
        "kkkkk",
        "lllll",
        "mmmmm",
        "nnnnn",
        "ooooo",
    ]

    @IBOutlet weak var picker1: UIPickerView!
    @IBOutlet weak var picker2: UIPickerView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set same dataSource and delegate for two picker views
        picker1.dataSource = self
        picker1.delegate = self
        
        picker2.dataSource = self
        picker2.delegate = self
    }
}

// MARK: - UIPickerViewDataSource

extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if pickerView == picker1 {
            return 2
        } else {
            return 1
        }
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == picker1 {
            return data1.count
        } else {
            return data2.count
        }
    }
}

// MARK: - UIPickerViewDelegate

extension ViewController: UIPickerViewDelegate {

    // This method returns picker view's cell
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {

        let label = UILabel()

        if pickerView == picker1 {
            label.frame = CGRect(x: 0, y: 0, width: pickerView.frame.width / 2, height: 0)

            if component == 0 {
                label.textAlignment = .center
                label.textColor = .brown
                label.font = .systemFont(ofSize: 25, weight: .heavy)
                label.text = data1[row].left
            } else {
                label.textAlignment = .left
                label.textColor = UIColor.blue
                label.font = UIFont.italicSystemFont(ofSize: 18)
                label.text = data1[row].right
            }
        } else {
            label.frame = CGRect(x: 0, y: 0, width: pickerView.frame.width, height: 0)
            label.backgroundColor = .green
            label.font = .monospacedDigitSystemFont(ofSize: 12, weight: .medium)
            label.textAlignment = .center
            label.textColor = .white
            label.text = data2[row]
        }

        return view ?? label
    }

    // This method returns height of picker view
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        if pickerView == picker1 {
            return 50
        } else {
            return 20
        }
    }
 }
