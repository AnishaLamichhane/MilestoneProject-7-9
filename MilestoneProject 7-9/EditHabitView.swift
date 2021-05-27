//
//  EditHabitView.swift
//  MilestoneProject 7-9
//
//  Created by Anisha Lamichhane on 5/27/21.
//

import SwiftUI

struct EditHabitView: View {
    @ObservedObject var habit : Habit
    @State private var completedTimes: Int = 0
    var habitId: UUID

    var activity: HabitDetails {
        habit.getActivity(id: habitId)
    }
    
    var body: some View {
        Form {
            Text(activity.title)
            Text(activity.description)
            Stepper(
                onIncrement: { self.updateActivity(by: 1) },
                onDecrement: { self.updateActivity(by: -1) },
                label: { Text("Completed \(activity.completedTimes) times") }
            )
        }
        .navigationBarTitle("Edit Hobby")
    
    }
    
    
    func updateActivity(by change: Int) {
        var activity = self.activity
        activity.completedTimes += change
        self.habit.update(activity: activity)
    }
}

struct EditHabitView_Previews: PreviewProvider {
    static var previews: some View {
        EditHabitView(habit: Habit(), habitId: UUID())
    }
}
