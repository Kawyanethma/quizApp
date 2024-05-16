# Simple Quiz Game

Mobile application that allows users to play a quiz game using questions fetched from an external API. This game  include a timer for each question, the ability to skip questions.
### Screenshots of the game

<p align="center">
  <img src="https://github.com/Kawyanethma/quizApp/assets/92635894/f633504f-e255-4fad-b851-5466ac27d58d" alt="welcome screen" width="200">
  <img src="https://github.com/Kawyanethma/quizApp/assets/92635894/3caa0bc0-0654-4538-9b48-f8a3a8b6e2f9" alt="game screen" width="200">
  <img src="https://github.com/Kawyanethma/quizApp/assets/92635894/71fe0ccd-20e5-43b9-a444-312071e1e71f" alt="game over screen" width="200">
 <p/>

## How to play ?
You can skip 3 questions and you can give 3 wrong answers. Those details are display as below.
<p align="center">
<img src="https://github.com/Kawyanethma/quizApp/assets/92635894/b5bcfb14-7ecf-4bd4-bd0d-2f82e89d6b1d" alt="dashboard" width="400">
 <p/>

**Step 1: select answer from the numpad. then it's temporary save that answer.**
<p align="center">
  <img src="https://github.com/Kawyanethma/quizApp/assets/92635894/a238b043-71b0-43b2-af3a-765b1142f0a5" alt="numpad" width="200">
 <p/>

**Step 2: Then tap done button to check the answer. If you want to change answer tap close button then select again.**

**After sumbit answer, it shows whether answer is correct or wrong.**
> [!NOTE]
> Press green button to check the answer!

<p align="center">
  <img src="https://github.com/Kawyanethma/quizApp/assets/92635894/28026453-83d2-498f-998a-97f61ae47812" alt="correct" width="200">
  <img src="https://github.com/Kawyanethma/quizApp/assets/92635894/9d4db381-4b77-496d-922c-0510fcdc4ab4" alt="wrong" width="200">
 <p/>

## Errors
App can give no internet error in case your internet connection is not good.
> [!NOTE]
> This app requires an internet connection !

<p align="center">
  <img src="https://github.com/Kawyanethma/quizApp/assets/92635894/df78dcca-c43f-4845-ad86-8f1ff5ffb3af" alt="numpad" width="200">
 <p/>

# Coding 
## Used Packages
### http
his package contains a set of high-level functions and classes that make it easy to consume HTTP resources. It's multi-platform (mobile, desktop, and browser) and supports multiple implementations.
```
flutter pub add http
```
### percent_indicator
Library that allows you to display progress widgets based on percentage, can be Circular or Linear, you can also customize it to your needs.
```
flutter pub add percent_indicator
```
### shared_preferences
Flutter plugin for reading and writing simple key-value pairs. Wraps NSUserDefaults on iOS and SharedPreferences on Android.
```
flutter pub add shared_preferences
```
### fluttertoast
Toast Library for Flutter, Easily create toast messages in single line of code
```
flutter pub add fluttertoast
```

## User Interface
All the user interface components are on the components folder.
```
lib
├── components
    ├── actionbutton.dart
    │── button.dart
    │── numpad.dart
    │── quetion.dart
    └── timer.dart
```
## Game Logic
All the game logic in the `home.dart` file. There are several functions on the file. those are,
  1. `getData()` - Retrive data and assign to local variables.
  2. `checkAnswer(bool done)` - Check answer with actual solution.
  3. `updateAnswer` - Update ansewer variable with user entered value.
  4. `updateScore()` - Update score value if the answer is correct.
  5. `wrongAnswer()` - Define process of if asnwer is wrong.
  6. `endSummery()` -  Summery for user at the end of the game.
