//
//  FieldSurveyDetailViewController.swift
//  Field Survey
//
//  Created by Brian Jiang on 7/15/19.
//  Copyright © 2019 Brian Jiang. All rights reserved.
//

import UIKit

class FieldSurveyDetailViewController: UIViewController {
    
    var fieldSurveyEvent: FieldSurveyEvent?
    
    var dateFormatter = DateFormatter()
    
    @IBOutlet weak var animalIconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        
        animalIconImageView.image = fieldSurveyEvent?.title.image
        descriptionLabel.text = fieldSurveyEvent?.description
        
        if let date = fieldSurveyEvent?.date {
            dateLabel.text = dateFormatter.string(from: date)
        }
        else {
            dateLabel.text = ""
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
