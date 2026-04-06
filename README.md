# Instagram Clone - Flutter 

This is a Flutter-based Instagram clone focused on clean design and smooth user experience. The app uses a modern UI with glass-style elements and simple navigation across different screens.

## 📱 Interface Preview

## 📱 Interface Preview

### Mobile Experience
| Feed | Message | Search | Reels | Profile |
| :---: | :---: | :---: | :---: | :---: |
| ![Feed](screenshots/feed.PNG) | ![Message](screenshots/message.PNG) | ![Search](screenshots/search.PNG) | ![Reels](screenshots/reels.PNG) | ![Profile](screenshots/profile.PNG) |

---

### 💻 Desktop & Web Responsive Layout
| Home Feed | Reels Explorer | Profile Settings |
| :---: | :---: | :---: |
| ![Desktop Feed](screenshots/res_feed.PNG) | ![Desktop Reels](screenshots/res_reel.PNG) | ![Desktop Profile](screenshots/res_profile.PNG) |

---

## Features

* Feed with interactive posts 
* Story section with gradient borders 
* Search screen with sample user profiles 
* Glass-style bottom navigation bar with blur effect
* Multiple sections: Home, Reels, Messages, Search, and Profile

## 🛠️ Tech Stack

* **Framework:** [Flutter](https://flutter.dev)
* **Language:** [Dart](https://dart.dev)
* **Design:** Responsive LayoutBuilder & Custom Glassmorphic Widgets.
* **Backend Ready:** Structured for easy integration with **Supabase** or **Firebase**.

## 📂 Project Structure

```text
lib/
├── features/
│   ├── feed/          # Newsfeed & Story UI logic
│   ├── message/       # Chat and inbox screens
│   ├── reels/         # Full-screen video layout
│   ├── search/        # Discovery and search grid
│   └── profile/       # User profile & Responsive settings
├── shared/
│   └── widgets/       # Reusable components (PostCards, Avatars)
└── main_screen.dart   # Responsive navigation controller


## ⚙️ Installation & Setup

1. Clone the repository:

```bash
git clone https://github.com/yourusername/instagram-clone.git
```

2. Go to the project folder:

```bash
cd instagram-clone
```

3. Install dependencies:

```bash
flutter pub get
```

4. Run the app:

```bash
flutter run
```
