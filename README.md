# Flutter News App 

## 📌 Overview
This is a Flutter-based News App that follows the *MVVM architecture* and utilizes *GetX* for state management. The app fetches news articles from *NewsAPI*, displays them in a beautifully animated list, and includes features like search, and advanced UI animations.

## 🚀 Features
### Task 1: News App with GetX & MVVM
•⁠  ⁠Fetches news articles using *HTTP requests*.
•⁠  ⁠Displays news articles in a *ListView with smooth animations*.
•⁠  ⁠Implements *MVVM architecture* for clean separation of concerns.
•⁠  ⁠Provides a *search bar* to filter articles by keywords.

### Task 2: Advanced UI Animations
•⁠  ⁠*Hero Animation*: Smooth transition when opening article details.
•⁠  ⁠*Shimmer Effect*: Skeleton loader while fetching data.
•⁠  ⁠*Animated Bottom Navigation Bar*: Smooth tab transitions.
•⁠  ⁠*Swipe to Dismiss*: Users can swipe articles to remove them with animation.

### Task 3: Bonus Features (Optional Enhancements)
•⁠  ⁠*Dark Mode Support* 🌙.
•⁠  ⁠*Web Compatibility* using Flutter Web.
•⁠  ⁠*Pull-to-Refresh* to reload news articles.

## 🏗️ Architecture (MVVM with GetX)

lib/
|-- models/       # Data Models
|-- views/        # UI Components
|-- viewmodels/   # Business Logic (Controllers)
|-- services/     # API Handling
|-- constants/    # Constants Files


## 🛠️ Technologies Used
•⁠  ⁠*Flutter* (Dart)
•⁠  ⁠*GetX* (State Management & Navigation)
•⁠  ⁠*HTTP Package* (API Calls)
•⁠  ⁠*Flutter Animations* (Hero, Tween, AnimatedContainer, etc.)
•⁠  ⁠*Shimmer Package* (Skeleton Loader)

## 📲 Installation & Setup
⁠ sh
# Clone the repository
git clone <repository-url>

# Navigate to the project directory
cd flutter_news_app

# Install dependencies
flutter pub get

# Run the app
flutter run
 ⁠

## 🔥 Screenshots
| Home Page  | Detail Page | Search page |
|------------|-------------|-------------|
![Home](https://i.imgur.com/gR9HLl2.jpeg) | ![Detail](https://i.imgur.com/OJycK9z.jpeg) | ![Search](https://i.imgur.com/zfy7gNl.png) |
| Shimmer Effect  | Dark mode Sample | Dark mode Sample |
![Shimmer Effect](https://i.imgur.com/RGH47qK.png) | ![Dark mode Sample](https://i.imgur.com/96H887B.jpeg) | ![Dark mode Sample](https://i.imgur.com/n728NO5.jpeg) |


## 📡 API Configuration
1.⁠ ⁠Sign up at *[NewsAPI](https://newsapi.org/)* to get an API key.
2.⁠ ⁠Create a ⁠ .env ⁠ file in the root directory.
3.⁠ ⁠Add your API key:
⁠ env
NEWS_API_KEY=your_api_key_here
my_api_key = pub_71555d506dbb2bcfa27d85f3fcc93d3a22808
 ⁠

## 📌 Code Quality & Best Practices
✅ Follows *MVVM architecture* for scalability.

✅ Uses *GetX for efficient state management*.

✅ Implements *error handling* for API calls.

✅ UI optimized for *performance & smooth animations*.

✅ *Well-structured & commented code*.

## 👨‍💻 Author
Ravi Shankar Pradhan
( 9693654565 )
