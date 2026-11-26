# Team Profiles – Mobile Communication CA 02

**Group:** Group 8
**Module:** Mobile Communication – Continuous Assessment 02

---

## Test login \

| Email | Password |
|-------|----------|
| `testuser@group8.com` | `group8@123` |

---

## Group members and the screen each member developed

| # | Name | Student ID | Screen file |
|---|------|-----------|-------------|
| 1 | K M N I Ranasinghe | 23IT0520 | `lib/members/nilanga.dart` |
| 2 | W A C Ramindu | 23IT0519 | `lib/members/ramindu.dart` |
| 3 | V P C Rasanga | 23IT0521 | `lib/members/chamath.dart` |
| 4 | J A N Rashmina | 23IT0522 | `lib/members/rashmina.dart` |
| 5 | G C Rathnayake | 23IT0523 | `lib/members/gimhan.dart` |
| 6 | R M I C Rathnayake | 23IT0524 | `lib/members/isuru.dart` |
| 7 | J B A I Samodee | 23IT0527 | `lib/members/imasha.dart` |
| 8 | J A S Samuditha | 23IT0528 | `lib/members/sahan.dart` |
| 9 | K T S U Senanayaka | 23IT0532 | `lib/members/upadhya.dart` |

---

## Features

- **Login page with Firebase** – `lib/login_page.dart`, `lib/auth_service.dart`
  - Email/password sign-in with `signInWithEmailAndPassword`
  - Input validation (empty fields, email format)
  - Error message for an invalid email or password
  - Loading spinner while signing in
  - Logout button on the Home page returns to the Login page
  - `lib/auth_gate.dart` uses `authStateChanges()` and a `StreamBuilder` to show the right page
- **Home / member list** – `lib/home_page.dart`: grid of all nine members with their photo and full name; tap a card to open that member's bio screen
- **Nine unique member bio screens** – `lib/members/`
- **Photographs** – loaded from `assets/images/` with `Image.asset` / `AssetImage`
- **State management**
  - **Provider** (`ChangeNotifier`): `LoginController` (login form, loading and error state)
    and `FavouritesController` (favourite button on every member screen; a liked member shows a heart on their Home page card)
  - **setState**: local UI state on member screens

---

## How to run

````bash
git clone <repository-url>
cd <repository-folder>
flutter pub get
flutter run
````

Requirements: Flutter SDK (stable) and an Android emulator or phone with internet
access. The Firebase configuration (`lib/firebase_options.dart`,
`android/app/google-services.json`) is included in the repository.

## Project structure

````
lib/
├── main.dart
├── auth_service.dart
├── auth_gate.dart
├── login_controller.dart
├── login_page.dart
├── home_page.dart
├── favourites_controller.dart
├── member.dart
├── member_registry.dart
├── validators.dart
├── custom_text_field.dart
├── firebase_options.dart
├── widgets/
│   └── favourite_button.dart
└── members/
    ├── nilanga.dart
    ├── ramindu.dart
    ├── chamath.dart
    ├── rashmina.dart
    ├── gimhan.dart
    ├── isuru.dart
    ├── imasha.dart
    ├── sahan.dart
    └── upadhya.dart
assets/images/
├── Nilanga.jpeg
├── rashmina.jpg
├── chamath.jpg
├── imasha.jpg
├── ramindu.jpeg
├── 
├── 
├── 
└── 
````
