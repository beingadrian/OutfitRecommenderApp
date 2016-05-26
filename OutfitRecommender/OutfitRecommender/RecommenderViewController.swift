//
//  RecommenderViewController.swift
//  OutfitRecommender
//
//  Created by Adrian Wisaksana on 5/26/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit

class RecommenderViewController: UIViewController {

    // MARK: - Properties
    
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var bottomImageView: UIImageView!
    
    let outfitRecommender = OutfitRecommender(eventType: .Formal)
    
    var eventTypes: [EventType] = [.Formal, .Casual, .Sports]
    var currentEventIndex = 0
    var currentEventType: EventType = .Casual {
        didSet {
            navBar.topItem?.title = currentEventType.rawValue
            outfitRecommender.eventType = currentEventType
        }
    }
    
    // MARK: - Main methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }
    
    // MARK: - Actions 
    
    @IBAction func onRecommendButtonTap(sender: UIButton) {
     
        let (top, bottom) = outfitRecommender.findPossibleOutfit()
        
        Swift.print(top, bottom)
        
        topImageView.image = UIImage(named: top)
        bottomImageView.image = UIImage(named: top)
        
    }

    @IBAction func onNextEventTypeButtonTap(sender: UIBarButtonItem) {
        
        currentEventIndex += 1
        
        // prevent currentEventIndex from becoming less than 0
        if currentEventIndex == 3 { currentEventIndex = 0 }
        
        currentEventType = eventTypes[currentEventIndex]
        
    }
    
    @IBAction func onPrevEventTypeButtonTap(sender: UIBarButtonItem) {
        
        currentEventIndex -= 1
        
        // prevent currentEventIndex from becoming less than 0
        if currentEventIndex == -1 { currentEventIndex = 2 }
        
        currentEventType = eventTypes[currentEventIndex]
        
    }
    
}
