//
//  ContentView.swift
//  BetterRest
//
//  Created by Aman Abraham on 8/28/25.
//

import CoreML
import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    @State private var wakeUp = defaultTime
    
    @State private var alertTitle = ""
    @State private var alertmessage = ""
    @State private var showingAlert = false
    
    static var defaultTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
        
    }
    var body: some View {
        NavigationStack{
            Form{
                VStack(alignment: .leading, spacing: 0) {
                    Text("What time do you want to wake up")
                        .font(.headline)
                    DatePicker("Pick a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                VStack(alignment: .leading, spacing: 0) {
                    
                    Text("Desired amount you want to sleep")
                        .font(.headline)
                    
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                }
                VStack(alignment: .leading, spacing: 0) {
                    
                    Text("Daily Coffe intake?")
                        .font(.headline)
                    
                    Stepper("^[\(coffeeAmount) cup](inflect: true)", value: $coffeeAmount, in: 1...20)
                }
            }
            .navigationTitle("BetterRest")
            .toolbar{
                Button("Calculate"){
                    calculateBedTime()
                }
            }
            .alert(alertTitle, isPresented: $showingAlert){
                Button("OK") { }
            } message: {
                Text(alertmessage)
            }
        }
    }
    
    func calculateBedTime() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            let components = Calendar.current.dateComponents([.hour,.minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            let sleepTime = wakeUp - prediction.actualSleep
            alertTitle = "Youre ideal bedtime is .."
            alertmessage = sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
            alertTitle = "Error"
            alertmessage = "Sorry, there was an error calculating your bedtime"
        }
        showingAlert = true
        
    }
    
}

#Preview {
    ContentView()
}
