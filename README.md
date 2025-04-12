# 🧳 Animated Snackbars

A Flutter package to display **beautiful, animated snackbars** with directional slide-in/out
transitions. Includes preset styles for success, error, info, and warning messages — plus full
customization options.

---

## ✨ Features

| Feature                | Description                                             |
|------------------------|---------------------------------------------------------|
| 🔄 **Animated**        | Smooth slide-in/out animation                           |
| ↕️ **Directional**     | Slides in from bottom                                   |
| ✅ **Presets**          | `showSuccessSnackbar`, `showErrorSnackbar`, etc.        |
| 🎨 **Customizable**    | Control color, icon, duration, message, and description |
| 🚫 **Single Instance** | Only one snackbar visible at a time                     |
| ⌨️ **Keyboard Aware**  | Snackbar appears above keyboard & respects safe area    |


**Example Images**

<img scr="./example_img/success.png">
<img scr="./example_img/error.png">
<img scr="./example_img/information.png">
<img scr="./example_img/warning.png">
<img scr="./example_img/custom_snackbar.png">
<img scr="./example_img/long_duration.png">

---

## 🛠️ Installation

Add dependencies in `pubspec.yaml`:

```yaml
dependencies:
  animated_snackbars: ^<latest_version>
```

Then run:

```bash
flutter pub get
```

---

## 🗰 Import

```dart
import 'package:animated_snackbars/animated_snackbars.dart';
```

---

## 🚀 Usage

### 🧪 Basic Example

```dart
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Animated Snackbars Example')),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              SnackbarUtils.showAnimatedSnackbar(
                context: context,
                message: 'Hello, this is a snackbar!',
                description: 'This is a more detailed message.',
              );
            },
            child: const Text('Show Snackbar'),
          ),
        ),
      ),
    );
  }
}
```

---

### 📆 Preset Snackbars

```dart
SnackbarUtils.showErrorSnackbar(
    context: context,
    message: 'Success!',
    description: 'The operation was completed successfully.',
);

SnackbarUtils.showErrorSnackbar(
    context: context,
    message: 'Oops!',
    description: 'Something went wrong.',
);

SnackbarUtils.showInfoSnackbar(
    context: context,
    message: 'Heads up!',
    description: 'Here is some important information.',
);

SnackbarUtils.showWarningSnackbar(
    context: context,
    message: 'Warning!',
    description: 'Please be careful.',
);
```

---

### 🛠️ Custom Snackbar

```dart
SnackbarUtils.showAnimatedSnackbar(
    context: context,
    message: 'Custom Snackbar',
    description: 'This snackbar has custom options.',
    color: Colors.purple[800],
    icon: Icons.notifications,
    duration: const Duration(seconds: 5),
);
```

---

## 🤝 Contributing

PRs, issues, and suggestions are welcome! Let's build together 🚀

---

## 📜 License

Licensed under the [MIT License](https://opensource.org/license/mit/)

---

## 👤 Author

**deadlium**

---