//
//  Habit.swift
//  MilestoneProject 7-9
//
//  Created by Anisha Lamichhane on 5/27/21.
//

import Foundation

class Habit: ObservableObject {
    @Published var items = [HabitDetails]() {
        didSet {
           let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
            
        }
    }
    
    init() {
        if let items = UserDefaults.standard.data(forKey: "Items") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([HabitDetails].self, from: items){
                self.items = decoded
                return
            }
            
        }
        self.items = []
    }
    func update(activity: HabitDetails) {
        guard let index = getIndex(activity: activity) else { return }

        items[index] = activity
    }
    
    func getActivity(id: UUID) ->  HabitDetails{
        guard let index = getIndex(id: id) else { return HabitDetails(title: "", description: "") }

        return items[index]
    }
    
    private func getIndex(activity: HabitDetails) -> Int? {
        return items.firstIndex(where: { $0.id == activity.id })
    }

    private func getIndex(id: UUID) -> Int? {
        return items.firstIndex(where: { $0.id == id })
    }

}
