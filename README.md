
# Simple Travel Agency Booking App

A mobile app built with Flutter to simulate a simple travel agency booking system. This project demonstrates a booking form with multi-language support (Arabic and English), RTL and LTR layout switching, and a results screen.

---

## Table of Contents
- [Simple Travel Agency Booking App](#simple-travel-agency-booking-app)
  - [Table of Contents](#table-of-contents)
  - [How to Run the Project](#how-to-run-the-project)
  - [How to Run Tests](#how-to-run-tests)
  - [Introduction](#introduction)
  - [Scope of Work](#scope-of-work)
  - [Time Estimate](#time-estimate)
  - [Risk Assessment](#risk-assessment)
  - [Project Plan](#project-plan)
    - [Phase 1: Core Features](#phase-1-core-features)
    - [Phase 2: Trip Results](#phase-2-trip-results)
  - [Future Improvements](#future-improvements)

---

## How to Run the Project

1. Clone the repository:
   ```bash
   git clone https://github.com/mustafa7ibrahim/samh_task.git
   ```
2. Navigate to the project directory:
   ```bash
   cd samh_task
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Run build_runner:
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```
5. Generate localization files:
   ```bash
   flutter gen-l10n
   ```
6. Run the app:
   ```bash
   flutter run
   ```

---

## How to Run Tests

1. To run unit tests, use the following command:
   ```bash
   flutter test
   ```

---

## Introduction

This project is designed to simulate booking functionality for a travel agency with the following features:
- Multi-language support with RTL/LTR switching
- Booking form including inputs for "From", "To", "Departure Date", "Ticket Class", "Trip Type", and "Passengers"
- Calendar selection for departure date
- Three ticket classes: Economy, Business, and First Class
- Displaying booking results
- Unit tests for critical features

---

## Scope of Work

The project includes two main screens:
1. **Booking Form**:
   - From and To destinations.
   - Departure date (calendar view).
   - Ticket class (Economy, Business, First).
   - Trip type (One-way, Round-trip).
   - Passengers count (Adults, Children).

2. **Results Screen**:
   - Shows the available trips based on user input from the booking form.
   - Displays ticket prices based on class, trip type, and passenger count.

---

## Time Estimate

| Phase     | Task Description                                                      | Estimated Time (Hours) |
| --------- | --------------------------------------------------------------------- | ---------------------- |
| 1         | Project Setup, Dependencies, Folder Structure                         | 2                      |
| 2         | Multi-language Setup (AR/EN) and RTL/LTR Switching                    | 3                      |
| 3         | UI Development: Booking Form Screen                                   | 5                      |
| 4         | UI Development: Results Screen                                        | 4                      |
| 5         | API Integration and Data Parsing (using JSONPlaceholder or mock data) | 3                      |
| 6         | Unit Tests                                                            | 3                      |
| 8         | Documentation and Code Cleanup                                        | 2                      |
| **Total** | **Estimated Hours**                                                   | **22 hours**           |

---

## Risk Assessment

| Risk Description           | Potential Impact                             | Mitigation Strategy                                                                                       |
| -------------------------- | -------------------------------------------- | --------------------------------------------------------------------------------------------------------- |
| Complex RTL/LTR Support    | UI layout issues, alignment problems         | Implement thorough testing with both languages (AR and EN) and on various screen sizes.                   |
| Calendar Widget Complexity | Improper date selection or validation errors | Use a reliable date picker package like `flutter_form_builder` or `intl` for robust handling.             |
| Multi-language Strings     | Incorrect translations or missing labels     | Ensure thorough proofreading of all Arabic and English texts; use automated translation validation tools. |
| Time Constraints           | Delays in delivering a complete app          | Prioritize core functionality (booking form and results screen) before implementing bonus features.       |

---

## Project Plan

### Phase 1: Core Features
1. Set up project and dependencies (Flutter localization, RTL/LTR support, etc.).
2. Build the booking form UI with inputs for "From", "To", "Departure Date", "Ticket Class", and "Passengers".
3. Integrate calendar widget for date selection.
4. Handle multi-language switching (AR/EN).

### Phase 2: Trip Results
1. Develop the results screen based on user inputs from the booking form.
2. Simulate data fetching using a fake json data.

---

## Future Improvements

- Add user authentication for personalized bookings.
- Connect to a real-time backend for live trip data and bookings.
- Implement more filtering options (e.g., airlines, price ranges).
- Enhance the UI with animations and transitions for a smoother user experience.
