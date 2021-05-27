//
//  HabitDetails.swift
//  MilestoneProject 7-9
//
//  Created by Anisha Lamichhane on 5/27/21.
//

import Foundation
struct HabitDetails: Identifiable, Codable {
    var id = UUID()
    var title: String
    var description: String
    
    var completedTimes: Int = 0 {
        didSet {
            if completedTimes < 0 {
                completedTimes = 0
            }
        }
    }
}
