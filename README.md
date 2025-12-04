# Union Shop 🛍️

A Flutter-based e-commerce application for a moch up of the University of Portsmouth Union Shop, providing students with an easy way to browse and purchase union merchandise including clothing, accessories, other small items needed for study.

## Key Features ✨

- **Product Catalog**: Browse through different categories (socks, shirts, hats, etc.)
- **Shopping Cart**: Add items to cart and manage purchases
- **Real-time Database**: Firebase integration for dynamic product management
- **Product Details**: Detailed product descriptions, pricing, and images
- **Collections**: Organized product categories for easy browsing
- **user account**: user can login to an account for faster shopping

### Main Features

1. **Browse Products**: Navigate through different product categories from the home screen
2. **View Product Details**: Tap on any product to see detailed information, pricing, and descriptions
3. **Add to Cart**: Use the cart functionality to manage your selected items
4. **Product Collections**: Explore organized collections of related products

## firebase
 - using firebase to store the data of each product 
 - also acts as a hosting to the sever using the link: https://union-shop-bdb40.web.app/

## Installation and Setup 🚀

### Prerequisites

- **Flutter SDK**: Version 3.0.0 or higher
- **Dart SDK**: Version 2.17.0 or higher
- **Operating System**: Windows, macOS, or Linux
- **IDE**: Android Studio, VS Code, or IntelliJ IDEA
- **Firebase Account**: For database functionality and hosting

### Clone the Repository

```bash
git clone https://github.com/Goff120/union_shop.git
cd union_shop
```

### Step-by-Step Installation

1. **Install Flutter dependencies:**
   ```bash
   flutter pub get
   ```

2. **Firebase Setup:**
   - Create a Firebase project at [Firebase Console](https://console.firebase.google.com/)
   - Enable Firebase Realtime Database
   - use assests/json/items.json and upload it to the database
   - Download configuration files:
     - `google-services.json` for Android (place in `android/app/`)
     - `GoogleService-Info.plist` for iOS (place in `ios/Runner/`)
   - Web configuration is already included in the project

3. **Run the application:**
   ```bash
   # For development (debug mode)
   flutter run
   
   # For web
   flutter run -d chrome
   ```

## Usage Instructions 📱

### Running Tests

```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage

# View coverage report
genhtml coverage/lcov.info -o coverage/html
```

### Configuration Options

- Product data is stored in `assets/json/items.json`
- Firebase configuration in `firebase_options.dart`

## Project Structure 📁

```
lib/
├── main.dart                    # App entry point and routing
├── about_page.dart             # About page component
├── cart_page.dart              # Shopping cart interface
├── collection.dart             # Product collections page
├── collection_product_page.dart # Collection-specific products
├── product_page.dart           # Individual product details
├── sign_up_page.dart          # User registration (if applicable)
├── logic/
│   ├── cart.dart              # Shopping cart logic and state management
│   └── realtime_database.dart # Firebase database operations
├── part_builder/              # Reusable UI components
│   ├── cart_product.dart     # Cart item components
│   ├── collection_image.dart # Collection display components
│   ├── footer.dart           # App footer
│   ├── main_header.dart      # App header/navigation
│   └── product_card.dart     # Product display cards
└── styles/                    # Styling and theme files

assets/
├── images/                    # Product images and assets
└── json/
    └── items.json            # Product data configuration

test/                         # Unit and widget tests
├── logic/                   # Tests for business logic
├── pages/                   # Tests for page components
└── part_builder/            # Tests for UI components
```

## Technologies Used 🛠️

### Core Technologies
- **Flutter**: Cross-platform mobile framework
- **Dart**: Programming language
- **Firebase**: Backend services
  - Realtime Database for product data
  - Firebase Core for initialization

### Key Dependencies
- `provider`: State management
- `firebase_core` & `firebase_database`: Firebase integration
- `cupertino_icons`: iOS-style icons
- `hyperlink`: URL handling

### Development Tools
- `flutter_test`: Testing framework
- `flutter_lints`: Code quality and style
- `mockito`: Mocking for unit tests
- `fake_cloud_firestore`: Firebase testing utilities
- `build_runner`: Code generation

## Known Issues & Limitations ⚠️

### Current Limitations
- Payment processing not yet implemented
- User authentication system in development
- Limited to predefined product categories


### Future Improvements
- [ ] Implement secure payment gateway
- [ ] Add user account management
- [ ] Add product search and filtering
- [ ] Implement order tracking system
- [ ] Add print shack


## Contact Information 👤

**Developer**: Geoffrey smith
**up number** up2263342
**email**: up2263342@myport.ac.uk
- **GitHub**: [@Goff120](https://github.com/Goff120)
- **Project Repository**: [union_shop](https://github.com/Goff120/union_shop)
- **other project**: [sandwitch_shop](https://github.com/Goff120/sandwhitch_shop)

---

