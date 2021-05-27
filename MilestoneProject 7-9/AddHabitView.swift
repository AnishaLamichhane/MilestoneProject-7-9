//
//  AddHabitView.swift
//  MilestoneProject 7-9
//
//  Created by Anisha Lamichhane on 5/27/21.
//

import SwiftUI

struct AddHabitView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var habit: Habit
    @State private var title = ""
    @State private var description = ""

    
    var body: some View {
        NavigationView {
            Form {
                TextField("Title:", text: $title)
                
                TextField("Description:", text: $description)
                
                
            }
            .navigationBarTitle("Add new Hobby")
            
//            saving the title and description
            .navigationBarItems(trailing: Button("Save") {
                let item = HabitDetails(title: self.title, description: self.description)
                    self.habit.items.append(item)
                    self.presentationMode.wrappedValue.dismiss()

            })
        }
    }
}

struct AddHabitView_Previews: PreviewProvider {
    static var previews: some View {
        AddHabitView(habit: Habit())
    }
}
