# BetterRest 💤

**BetterRest** is an iOS app built with **SwiftUI** and **Core ML** that helps users determine the best time to go to sleep in order to wake up refreshed. By taking into account the desired wake-up time, preferred hours of sleep, and daily coffee intake, the app uses a trained machine learning model to recommend the ideal bedtime.

---

## 🚀 Features

* 📅 **Wake-up time selection** with a simple `DatePicker`.
* ⏰ **Desired sleep amount** adjustment with a stepper.
* ☕ **Coffee intake tracker** with dynamic pluralization (1 cup / 2 cups, etc.).
* 🧠 **Core ML integration** (`SleepCalculator.mlmodel`) for predicting optimal bedtime.
* 🔔 **Interactive alerts** that display the recommended sleep time.
* 🖌️ Built entirely with **SwiftUI** for a clean and modern interface.

---

## 🖼️ How It Works

1. User selects the time they want to wake up.
2. Sets the number of hours they wish to sleep.
3. Inputs their average daily coffee intake.
4. Taps **Calculate** in the toolbar.
5. The app uses the `SleepCalculator` CoreML model to predict how caffeine and sleep preferences affect bedtime.
6. The result is shown in an alert with the **ideal bedtime**.

---

## 📂 Project Structure

* `ContentView.swift` → Main UI and state management.
* `SleepCalculator.mlmodel` → CoreML model used for predictions.
* SwiftUI `@State` properties handle form input and alert presentation.

---

## 🛠️ Technologies

* **Swift 5**
* **SwiftUI** for UI components
* **CoreML** for predictions
* **Xcode** (with built-in ML model integration)

---

## ▶️ Getting Started

1. Clone this repository:

   ```bash
   git clone https://github.com/yourusername/BetterRest.git
   cd BetterRest
   ```
2. Open `BetterRest.xcodeproj` in Xcode.
3. Make sure `SleepCalculator.mlmodel` is included in the project.
4. Run the app on a simulator or device.

---

## 🎯 Example

If you want to wake up at **7:00 AM**, sleep for **8 hours**, and drink **2 cups of coffee per day**, BetterRest will recommend the optimal bedtime (e.g., **10:45 PM**) so you can feel rested.


https://github.com/user-attachments/assets/9da013b5-0aa7-44e7-8d7c-0d9be7e45d78




---

## 📌 Notes

* The machine learning model was trained on real-world sleep data.
* This project is a great demonstration of CoreML + SwiftUI for practical health-related apps.
* The focus is on **learning ML integration with SwiftUI**, not on perfect accuracy of predictions.

---

## 📜 License

This project is for educational and personal use. You are free to use and modify it.

---
