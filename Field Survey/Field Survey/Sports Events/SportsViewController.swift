//
//  SportsViewController.swift
//  Sports Events
//
//  Created by Bruce Thomson on 3/1/17.
//  Copyright © 2017 Tech Innovator. All rights reserved.
//

import UIKit
import Foundation

class SportsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var sportTableView: UITableView!
 
        var sportingEvents: [SportingEvent]?
        let sportingEventsJSONFile = "sporting_events"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sportTableView.delegate = self
        sportTableView.dataSource = self
        
        sportingEvents = SportingEventsJSONLoader.load(fileName: sportingEventsJSONFile)
        self.title = "Sporting Events"
        
    }
    
    
//    func addSports() -> SportingEvent{
//        var index: Int = 0
//        //var sportList: SportingEvent
//        if let sportingEvents = sportingEvents {
//            var index = sportingEvents.count
//            while index <= sportingEvents.count {
//                let sportList: SportingEvent = SportingEvent.init(sport: sportingEvents[index].sport, matchup: sportingEvents[index].matchup, date: sportingEvents[index].date)
//                index += 1
//            }
//        }
//        return sportList
//    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

 func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sportingEvents = sportingEvents {
            return sportingEvents.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "sportCell", for: indexPath) as! SportTableViewCell
        
        var index = 0
//        while index < (sportingEvents?.count)! {
        let mySports = sportingEvents?[indexPath.row]
        
       cell.sportLabel.text = mySports?.matchup
        let sportIcon = SportingEvent.init(sport: (mySports?.sport)!, matchup: (mySports?.matchup)!, date: (mySports?.date)!)
            switch sportIcon.sport{
            case .baseball:
                 cell.sportImage.image = #imageLiteral(resourceName: "baseballIcon")
            case .basketball:
                cell.sportImage.image = #imageLiteral(resourceName: "basketballIcon")
            case .football:
                cell.sportImage.image = #imageLiteral(resourceName: "footballIcon")
            case .hockey:
                cell.sportImage.image = #imageLiteral(resourceName: "hockeyIcon")
            case .soccer:
                cell.sportImage.image = #imageLiteral(resourceName: "soccerIcon")
          
            }
            
       
      
        
        let formatter = DateFormatter()
        formatter.dateStyle = DateFormatter.Style.long
        formatter.timeStyle = .short
        
        let dateString = formatter.string(from: (mySports?.date)!)
        
         cell.sportSublabel.text = dateString
        index += 1
            
//       }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let row = tableView.indexPathForSelectedRow?.row {
            let sport = sportingEvents?[row]
            print("Selected cell \(sport)")
        }
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailViewController,
            let row = sportTableView.indexPathForSelectedRow?.row {
            destination.sport = (sportingEvents?[row])!
        }
       
    }
       //  return cell
    
   

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
