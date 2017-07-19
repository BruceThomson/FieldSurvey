//
//  DetailViewController.swift
//  Sports Events
//
//  Created by Bruce Thomson on 3/10/17.
//  Copyright © 2017 Tech Innovator. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var SportImage: UIImageView!
    @IBOutlet weak var SportLabel: UILabel!
    @IBOutlet weak var SportSublabel: UILabel!

     var sport: SportingEvent?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        SportLabel.text = sport?.matchup
        
      
        switch sport!.sport{
        case .baseball:
             SportImage.image = #imageLiteral(resourceName: "baseballIcon")
        case .basketball:
             SportImage.image = #imageLiteral(resourceName: "basketballIcon")
        case .football:
             SportImage.image = #imageLiteral(resourceName: "footballIcon")
        case .hockey:
             SportImage.image = #imageLiteral(resourceName: "hockeyIcon")
        case .soccer:
             SportImage.image = #imageLiteral(resourceName: "soccerIcon")
        
        }
        
        
        let formatter = DateFormatter()
        formatter.dateStyle = DateFormatter.Style.long
        formatter.timeStyle = .short
        
        let dateString = formatter.string(from: (sport!.date))
        
        SportSublabel.text = dateString
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
