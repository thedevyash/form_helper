# form_helper

A Dart-only utility package that provides validation for common form fields such as email, password, phone number, name, OTP, username, and more — with support for customizable error messages.

Useful in any Flutter app that uses `TextFormField`, especially in forms for login, signup, or input verification.


## ✨ Features

✅ Validate:
- Email  
- Password (with min length)  
- Confirm password  
- Phone number  
- Name  
- Username  
- Generic non-empty fields

✅ Fully customizable error messages

✅ Dart-only — no Flutter SDK dependency

✅ Plug-and-play with `TextFormField.validator`

---

## 🚀 Getting Started

In your `pubspec.yaml`:

```yaml
dependencies:
  form_helper: 
```

## import using
```dart
import 'package:form_validator_helper/form_validator_helper.dart';
```

## Examples

```dart

TextFormField(
  validator: (val) => FormValidator.validateEmail(
    val,
    requiredMessage: 'Email is required.',
    invalidMessage: 'Please enter a valid email.',
  ),
)

TextFormField(
  validator: (val) => FormValidator.validatePassword(
    val,
    minLength: 8,
    requiredMessage: 'Enter a password',
    lengthMessage: 'Password must be at least {minLength} characters long.',
  ),
)


TextFormField(
  validator: (val) => FormValidator.validateName(
    val,
    invalidMessage: 'Name should contain only letters.',
  ),
)


TextFormField(
  validator: (val) => FormValidator.validateUsername(
    val,
    invalidMessage: 'Username must be at least 3 characters and alphanumeric.',
  ),
)


```

## 💡 Best Practices
Use with Form and TextFormField for seamless validation

Works naturally with FormState.validate()

Error messages are localized-friendly — just pass your own messages

## Author

Made with ❤️ by Yash Sharma.

Open to contributions and feature requests.


