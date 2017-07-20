//
//  FieldViewController.swift
//  Field Survey
//
//  Created by Bruce Thomson on 7/19/17.
//  Copyright © 2017 Bruce Thomson. All rights reserved.
//

import UIKit

class FieldViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var fieldTableView: UITableView!
   
    var fieldEvents: [FieldEvent]?
    let fieldEventsJSONFile = "field_observations"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fieldTableView.delegate = self
        fieldTableView.dataSource = self
        
        fieldEvents = FieldEventsJSONLoader.load(fileName: fieldEventsJSONFile)
        self.title = "Field Events"
        
    }  
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let fieldEvents = fieldEvents {
            return fieldEvents.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "fieldcell", for: indexPath) as! FieldTableViewCell
        
        var index = 0
 
        let myField = fieldEvents?[indexPath.row]
        
        cell.topLabel.text = myField?.title
//        classification: String, title: String, description: String, date: Date
        let fieldIcon = FieldEvent.init(classification: (myField?.classification)!, title: (myField?.title)!, description: (myField?.description)!, date: (myField?.date)!)
        switch fieldIcon.classification{
            case .amphibian:
                cell.fieldImage.image = #imageLiteral(resourceName: "amphibian.png")
            case .bird:
                cell.fieldImage.image = #imageLiteral(resourceName: "bird.png")
            case .fish:
                cell.fieldImage.image = #imageLiteral(resourceName: "fish.png")
            case .insect:
                cell.fieldImage.image = #imageLiteral(resourceName: "insect.png")
            case .mammal:
                cell.fieldImage.image = #imageLiteral(resourceName: "mammal.png")
            case .plant:
                cell.fieldImage.image = #imageLiteral(resourceName: "plant.png")
            case .reptile:
                cell.fieldImage.image = #imageLiteral(resourceName: "reptile.png")
        }
        
        
        
        
        let formatter = DateFormatter()
        formatter.dateStyle = DateFormatter.Style.long
        formatter.timeStyle = .short
        
        let dateString = formatter.string(from: (myField?.date)!)
        
        cell.bottomLabel.text = dateString
        index += 1
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let row = tableView.indexPathForSelectedRow?.row {
            let field = fieldEvents?[row]
        }
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailViewController,
            let row = fieldTableView.indexPathForSelectedRow?.row {
            destination.field = (fieldEvents?[row])!
        }
        
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
