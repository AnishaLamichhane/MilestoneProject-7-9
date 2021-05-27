//
//  ContentView.swift
//  MilestoneProject 7-9
//
//  Created by Anisha Lamichhane on 5/26/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var habit = Habit()
    @State private var showingSheet = false
    
    var body: some View {
        NavigationView{
            List {
// this tells the forEach to identify habit.items  uniquely by its id, then prints the name out in each row
                ForEach(habit.items){ item in
                    NavigationLink(destination: EditHabitView(habit: self.habit, habitId: item.id)) {
                        VStack(alignment: .leading){
                            Text(item.title)
                                .font(.headline)
                            Text(item.description)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            HStack {
                                Text("Completed \(item.completedTimes) times")
                            }
                            .font(.subheadline)
                        }
                    }
                }
                .onDelete(perform: removeItems)
                
            }
            .navigationBarTitle("Habit Tracker")

            .navigationBarItems(leading: EditButton(),trailing: Button(action: {
                    self.showingSheet = true
                }) {
                    Image(systemName: "plus")
                
                }
            )
        }
            
        
        
            .sheet(isPresented: $showingSheet) {
//                show an AddView here
                AddHabitView(habit: self.habit)
                
                }
    }
    
    func removeItems(at offsets: IndexSet){
        habit.items.remove(atOffsets: offsets)
        showingSheet = false
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
