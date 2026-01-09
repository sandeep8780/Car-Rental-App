# Car Rental App

A Flutter-based mobile application for renting cars. This app allows users to browse available cars, view details, and make bookings seamlessly.

## Features

- **User Authentication**: Login screen for user access.
- **Car Listing**: Browse a list of available cars with details like name, type, price per day, and availability.
- **Car Details**: View detailed information about selected cars.
- **Booking System**: Form to book cars with start date, end date, and location.
- **Booking Confirmation**: Confirmation screen after successful booking.
- **State Management**: Uses Provider for efficient state management across the app.
- **Mock Data**: Includes sample car data for demonstration purposes.



## Installation

### Prerequisites

- Flutter SDK: Ensure you have Flutter installed. For installation instructions, visit [Flutter's official website](https://flutter.dev/docs/get-started/install).
- Dart SDK: Comes with Flutter.
- Android Studio or VS Code: For development and running the app.

### Steps

1. **Clone the repository**:
   ```bash
   git clone https://github.com/sandeep8780/Car-Rental-App.git
   cd car_rental
   ```

2. **Install dependencies**:
   bash
   flutter pub get


3. **Run the app**:
   - For Android: `flutter run`
   - For iOS: `flutter run` (on macOS with Xcode)
   - For Web: `flutter run -d chrome`

## Usage

1. Launch the app.
2. Log in using the login screen.
3. Browse the list of available cars.
4. Tap on a car to view details.
5. Use the booking form to rent a car by selecting dates and location.
6. Confirm your booking.

## Project Structure

```
lib/
├── data/
│   └── mock_cars.dart          # Mock data for cars
├── models/
│   ├── booking.dart            # Booking model
│   └── car.dart                # Car model
├── providers/
│   ├── booking_provider.dart   # Provider for booking state
│   └── car_provider.dart       # Provider for car state
├── screens/
│   ├── booking_confirmation_screen.dart  # Booking confirmation screen
│   ├── booking_form_screen.dart          # Booking form screen
│   ├── car_detail_screen.dart            # Car details screen
│   ├── car_list_screen.dart              # Car list screen
│   └── login_screen.dart                 # Login screen
└── main.dart                    # App entry point
```

## Dependencies

- `flutter`: SDK for building the app.
- `cupertino_icons`: Icons for iOS style.
- `provider`: State management library.

For a full list, see `pubspec.yaml`.

## Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository.
2. Create a new branch for your feature (`git checkout -b feature/AmazingFeature`).
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`).
4. Push to the branch (`git push origin feature/AmazingFeature`).
5. Open a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [Dart Documentation](https://dart.dev/guides)
- [Provider Package](https://pub.dev/packages/provider)
