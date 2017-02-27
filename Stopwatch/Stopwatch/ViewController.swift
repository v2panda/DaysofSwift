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

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    @IBAction func playPauseTimer(_ sender: UIButton) {
        lapResetButton.isEnabled = true
        changeButton(lapResetButton, title: "Lap", titleColor: .black)
        
        if !isPlay {
            mainStopwatch.timer = Timer.scheduledTimer(timeInterval: 0.035, target: self, selector: Selector.updateMainTimer, userInfo: nil, repeats: true)
            lapStopwatch.timer = Timer.scheduledTimer(timeInterval: 0.035, target: self, selector: Selector.updateLapTimer, userInfo: nil, repeats: true)
            isPlay = true
            changeButton(playPauseButton, title: "Stop", titleColor: UIColor.red)
        } else {
            mainStopwatch.timer.invalidate()
            lapStopwatch.timer.invalidate()
            isPlay = false
            changeButton(playPauseButton, title: "Start", titleColor: UIColor.green)
            changeButton(lapResetButton, title: "Reset", titleColor: UIColor.black)
            
            if let timerLabelText = timeLabel.text {
                laps.append(timerLabelText)
            }
            lapTableView.reloadData()
        }
        
    }
    
    @IBAction func lapResetTimer(_ sender: Any) {
        if !isPlay {
            resetMainTimer()
            resetLapTimer()
            changeButton(lapResetButton, title: "Lap", titleColor: UIColor.lightGray)
            lapResetButton.isEnabled = false
        } else {
            resetLapTimer()
            lapStopwatch.timer = Timer.scheduledTimer(timeInterval: 0.035, target: self, selector: Selector.updateLapTimer, userInfo: nil, repeats: true)
        }

    }
    
    fileprivate func changeButton(_ button: UIButton, title: String, titleColor: UIColor) {
        button.setTitle(title, for: UIControlState())
        button.setTitleColor(titleColor, for: .normal)
    }
    
    // MARK: reset timer seperately
    fileprivate func resetMainTimer() {
        resetTimer(mainStopwatch, label: timeLabel)
        laps.removeAll()
        lapTableView.reloadData()
    }
    
    fileprivate func resetLapTimer() {
        resetTimer(lapStopwatch, label: lapTimerLabel)
    }
    
    fileprivate func resetTimer(_ stopwatch: Stopwatch, label: UILabel) {
        stopwatch.timer.invalidate()
        stopwatch.counter = 0.0
        label.text = "00:00:00"
    }

    
    //MARK: - update two timer labels seperately
    func updateMainTimer() {
        updateTimer(mainStopwatch, label: timeLabel)
    }

    func updateLapTimer() {
        updateTimer(lapStopwatch, label: lapTimerLabel)
    }
    
    func updateTimer(_ stopwatch: Stopwatch, label: UILabel) {
        stopwatch.counter = stopwatch.counter + 0.035
        
        var minutes: String = "\((Int)(stopwatch.counter / 60))"
        if (Int)(stopwatch.counter / 60) < 10 {
            minutes = "0\((Int)(stopwatch.counter / 60))"
        }
        
        var seconds: String = String(format: "%.2f", (stopwatch.counter.truncatingRemainder(dividingBy: 60)))
        if stopwatch.counter.truncatingRemainder(dividingBy: 60) < 10 {
            seconds = "0" + seconds
        }
        
        label.text = minutes + ":" + seconds
    }
}

//MARK: - tableView dataSource
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        NSLog("laps:%@", laps);
        return laps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier: String = "lapCell"
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        
        if let labelNum = cell.viewWithTag(11) as? UILabel {
            labelNum.text = "Lap\(laps.count - (indexPath.row))"
        }
        
//        cell.textLabel?.text = "Lap\(laps.count - (indexPath.row))"
//        
//        cell.detailTextLabel?.text = laps[laps.count - indexPath.row - 1]
        
        if let labelTimer = cell.viewWithTag(12) as? UILabel {
            labelTimer.text = laps[laps.count - indexPath.row - 1]
        }
        
        return cell
    }
}

fileprivate extension Selector {
    static let updateMainTimer = #selector(ViewController.updateMainTimer)
    static let updateLapTimer = #selector(ViewController.updateLapTimer)
}

