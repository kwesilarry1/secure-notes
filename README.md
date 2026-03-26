#  Secure Notes App

A simple Flutter based note taking application focused on privacy and simplicity develop as my semester project.
This app allows users to securely store personal notes locally on their device using a PIN-based authentication system.

---

## 📱 Features

*  PIN Authentication (first-time setup + login)
*  Create notes with title and content
*  Automatic timestamp for each note
*  Delete notes
*  Local storage using SharedPreferences
*  Clean dark-themed UI
---

## 🧠 Concept

This application demonstrates how to build a lightweight secure note system without relying on external servers.
All user data is stored locally, making it fast, offline-capable, and privacy-friendly.

---

##  Tech Stack

* **Flutter** (UI framework)
* **Dart** (programming language)
* **SharedPreferences** (local storage)
* **intl** (date formatting)

---

## 📂 Project Structure

```
lib/
 ├── main.dart
 ├── models/
 │    └── note.dart
 ├── services/
 │    └── storage_service.dart
 └── screens/
      ├── login_screen.dart
      ├── home_screen.dart
      └── add_note_screen.dart
```

---



##  Disclaimer

This app simulates a secure environment using local storage and PIN authentication.
While it demonstrates core security concepts, it does **not implement real encryption** and should not be used for storing highly sensitive data in production.

---

##  Learning Objectives

* Understanding Flutter app structure
* Implementing local data persistence
* Managing application state
* Building authentication flow (PIN-based)
* Designing clean and responsive UI

---


