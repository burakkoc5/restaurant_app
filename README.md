# Restaurant Finder Application

This project is a mobile application developed using Flutter. The app helps users find restaurants, manage their favorite places, and explore affordable dining options. It includes onboarding screens, account registration, login, and password reset features.

## Project Structure

The project follows clean code principles and adheres to the SOLID principles, organized into the following directory structure:


lib/features/

├── application/ 

├── domain/ 

├── infrastructure/ 

├── presentation/ 



### Directory Descriptions

- **application/**  
  Contains application logic such as state management (e.g., `Bloc-Cubit`) and service calls.

- **domain/**  
  Holds core business rules and models, such as user models and reservation operations.

- **infrastructure/**  
  Handles data access, including API service calls and database operations.

- **presentation/**  
  Includes UI components, screens, and styles. For example, `LoginScreen` and `ForgotPasswordScreen` reside here.

- **common/**  
  Shared utilities, helper classes, themes, colors, and constants are stored here.

---

## Completed Features

### Onboarding
- Screens introducing users to restaurant discovery, favorites, and affordable dining options.

### Registration and Login
- Features for user account creation and login.
- Includes "Sign in with Google" and password reset support.

---

## Ongoing Features

- **Password Reset**  
  A feature enabling users to reset their password via email verification.

---

## Upcoming Features

- **Home Screen**  
  A screen displaying a list of restaurants and their locations on an interactive map.

- **Booking System**  
  A module allowing users to make restaurant reservations easily.

- **Profile Management**  
  A feature enabling users to manage and update their account details.


## Technologies Used

- **Flutter**: For UI development.
- **Dart**: The programming language for Flutter.

---

## How to Run the Application

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/restaurant-finder.git
   cd restaurant-finder
   
2. Install dependencies:
   ```bash
   flutter pub get

3. Run the application:
   ```bash
   flutter run

4. If you encounter errors, verify your Flutter environment:
   ```bash
   flutter doctor

## Design

The UI design of the application is based on the **Restaurant Booking UI Kit**, which can be found at the following public Figma link:

[Restaurant Booking UI Kit - Figma Design](https://www.figma.com/design/nxflXGTDrlfEFBp0Rp7nWS/Restaurant-Booking-Uikit-(Community)?node-id=23-2&node-type=canvas&t=1PesFpZeBWC4hOH2-0)

<img width="940" alt="image" src="https://github.com/user-attachments/assets/2f35101e-76cf-434f-ae5e-d01c174ba043">



