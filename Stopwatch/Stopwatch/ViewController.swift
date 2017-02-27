//
//  ViewController.swift
//  Stopwatch
//
//  Created by v2panda on 2017/2/27.
//  Copyright © 2017年 Panda. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {

    fileprivate let mainStopwatch: Stopwatch = Stopwatch()
    fileprivate let lapStopwatch: Stopwatch = Stopwatch()
    fileprivate var isPlay: Bool = false
    fileprivate var laps: [String] = []
    
    //MARK: - disable landscape mode
    override var shouldAutorotate: Bool {
        return false
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    
    @IBAction func playPauseTimer(_ sender: UIButton) {
        
    }
    
    @IBAction func lapResetTimer(_ sender: Any) {
        
    }
    
    @IBOutlet weak var lapResetButton: UIButton!
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var lapTimerLabel: UILabel!
    @IBOutlet weak var lapTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initCircleButton(playPauseButton)
        initCircleButton(lapResetButton)
        
        lapResetButton.isEnabled = false
        
        lapTableView.delegate = self
        lapTableView.dataSource = self
    }

    fileprivate func initCircleButton(_ button: UIButton) {
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.backgroundColor = UIColor.white
    }

}

//MARK: - tableView dataSource
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return laps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier: String = "lapCell"
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        
        if let labelNum = cell.viewWithTag(11) as? UILabel {
            labelNum.text = "Lap\(laps.count - (indexPath.row))"
        }
        
        if let labelTimer = cell.viewWithTag(12) as? UILabel {
            labelTimer.text = laps[laps.count - indexPath.row - 1]
        }
        
        return cell
    }
}

