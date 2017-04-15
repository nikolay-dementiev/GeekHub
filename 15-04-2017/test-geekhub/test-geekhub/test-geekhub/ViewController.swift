//
//  ViewController.swift
//  test-geekhub
//
//  Created by Nikolay Dementiev on 15.04.17.
//  Copyright © 2017 mc373. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var graphView: GraphView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

//        setupGraphDisplay()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//    func setupGraphDisplay() {
//
//        //Use 7 days for graph - can use any number,
//        //but labels and sample data are set up for 7 days
//        let noOfDays:Int = 7
//
//        //1 - replace last day with today's actual data
//        graphView.graphPoints[graphView.graphPoints.count-1] = 4//counterView.counter
//
//        //2 - indicate that the graph needs to be redrawn
//        graphView.setNeedsDisplay()
//
////        maxLabel.text = "\(graphView.graphPoints.max()!)"
//
//        //3 - calculate average from graphPoints
//        let average = graphView.graphPoints.reduce(0, +)
//            / graphView.graphPoints.count
////        averageWaterDrunk.text = "\(average)"
//
//        //set up labels
//        //day of week labels are set up in storyboard with tags
//        //today is last day of the array need to go backwards
//
//        //4 - get today's day number
//        let dateFormatter = DateFormatter()
//        let calendar = Calendar.current
//        let componentOptions:NSCalendar.Unit = .CalendarUnitWeekday
//        let components = (calendar as NSCalendar).components(componentOptions,
//                                                             from: Date())
//        var weekday = components.weekday
//
//        let days = ["S", "S", "M", "T", "W", "T", "F"]
//
//        //5 - set up the day name labels with correct day
//        for i in reverse(1...days.count) {
//            if let labelView = graphView.viewWithTag(i) as? UILabel {
//                if weekday == 7 {
//                    weekday = 0
//                }
//                labelView.text = days[weekday--]
//                if weekday < 0 {
//                    weekday = days.count - 1
//                }
//            }
//        }
//    }

}

