# 🪙 PGold Flutter App

PGold is a modular Flutter application designed with scalability and maintainability in mind.  
It follows a **clean architecture** approach — organizing features into independent modules (e.g., `auth`, `dashboard`, and `guest`) with dedicated controllers, bindings, models, services, and widgets.

---

## 📁 Project Structure

Below is a detailed overview of the `lib/` directory structure:
```
lib/
│
│ main.dart # App entry point
│ store.dart # Global state or dependency store
│
├───abstracts
│ pallete_base.dart # Base color palette abstraction
│
├───config
│ enumefy.dart # Enums and constants
│ palletefy.dart # Theme colors and material palette
│ routefy.dart # Centralized route definitions
│ themefy.dart # Theme configuration (light/dark modes)
│
├───middlewares
│ is_auth.dart # Route middleware for auth validation
│
├───modules
│ ├───auth # Handles user authentication (login/register)
│ │ │ auth_routes.dart
│ │ │
│ │ ├───bindings # Bind controllers and dependencies
│ │ ├───controllers # Business logic (Login, Register)
│ │ ├───editors # Editors and text field handlers
│ │ ├───models # User data models
│ │ ├───screens # Login and Registration UI
│ │ ├───services # Auth-related network services
│ │ ├───states # Local states for auth views
│ │ └───widgets # Reusable auth-specific widgets
│ │
│ ├───dashboard # Main app dashboard (post-login)
│ │ │ dashboard_routes.dart
│ │ │
│ │ ├───bindings # Bindings for dashboard/rates
│ │ ├───controllers # Logic for dashboard and rates modules
│ │ ├───editors # Data or form editors for dashboard/rates
│ │ ├───models # Crypto & gift card models
│ │ ├───screens # UI for Dashboard and Rates
│ │ ├───services # API service to fetch crypto/rates data
│ │ ├───states # Dashboard and rates-specific states
│ │ └───widgets # Dashboard widgets (banner, balance, rates)
│ │
│ └───guest # Handles non-authenticated views
│ │ guest_routes.dart
│ │
│ ├───bindings # Bindings for onboarding and splash
│ ├───controllers # Handles onboarding and splash logic
│ ├───models # Slide model for onboarding
│ ├───screens # Onboarding, Splash, and 404 screens
│ ├───states # State management for guest screens
│ └───widgets # Reusable guest widgets
│
├───services
│ # Global app-wide services (if any)
│
├───translations
│ # Multilingual support files (if applicable)
│
├───utils
│ dio_util.dart # Network configuration (Dio client)
│ flex_util.dart # Responsive UI utilities
│ global_util.dart # Global helper functions
│ keyboard_util.dart # Keyboard management helpers
│ notification_util.dart # Push/local notification utils
│ screen_util.dart # Screen size and device utilities
│ session_util.dart # Session and storage helpers
│ validator_ext_util.dart # Extended validation helpers
│ validator_util.dart # Core validation utilities
│
└───widgets
annotated_region_widget.dart
app_bar_widget.dart
bottom_navigation_bar_widget.dart
dismiss_keyboard_widget.dart
```


## ⚙️ Features

- Modular architecture for scalability
- Clean folder structure with clear separation of concerns
- Custom utility and widget libraries
- Configurable routing and theming
- Organized state, controller, and binding patterns  

---

## ⚙️ Download

You can download the latest release of the **Pgold Flutter App** below:

- 📱 **[Download APK – v1.0.0+1](https://github.com/geomartins/pgold-app/releases/tag/v1.0.0%2B1)**  
  *(Hosted on my GitHub Releases page)*

---
