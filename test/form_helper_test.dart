import 'package:flutter_test/flutter_test.dart';
import 'package:forms_helper/form_helper.dart';

void main() {
  group('Email Validation', () {
    test('returns null for valid email', () {
      expect(FormValidator.validateEmail('user@example.com'), null);
    });

    test('returns required message for empty email', () {
      expect(FormValidator.validateEmail(''), 'Email is required.');
    });

    test('returns invalid message for wrong email', () {
      expect(FormValidator.validateEmail('invalid@'),
          'Enter a valid email address.');
    });
  });

  group('Password Validation', () {
    test('returns null for valid password', () {
      expect(FormValidator.validatePassword('secure123'), null);
    });

    test('returns required message for empty password', () {
      expect(FormValidator.validatePassword(''), 'Password is required.');
    });

    test('returns length error for short password', () {
      expect(FormValidator.validatePassword('abc'),
          'Password must be at least 6 characters.');
    });
  });

  group('Phone Validation', () {
    test('valid 10-digit phone returns null', () {
      expect(FormValidator.validatePhone('9876543210'), null);
    });

    test('empty phone returns required message', () {
      expect(FormValidator.validatePhone(''), 'Phone number is required.');
    });

    test('invalid phone returns error', () {
      expect(FormValidator.validatePhone('12345'),
          'Enter a valid 10-digit phone number.');
    });
  });

  group('Confirm Password', () {
    test('matching passwords return null', () {
      expect(FormValidator.validateConfirmPassword('abc123', 'abc123'), null);
    });

    test('mismatched passwords return error', () {
      expect(FormValidator.validateConfirmPassword('abc123', 'xyz456'),
          'Passwords do not match.');
    });
  });

  group('NotEmpty & Username', () {
    test('empty username returns required message', () {
      expect(FormValidator.validateUsername(''), 'Username is required.');
    });

    test('valid username returns null', () {
      expect(FormValidator.validateUsername('yash_dev'), null);
    });

    test('not empty validation returns error when empty', () {
      expect(FormValidator.validateNotEmpty('', fieldName: 'Name'),
          'Name is required.');
    });

    test('not empty validation returns null when filled', () {
      expect(FormValidator.validateNotEmpty('John', fieldName: 'Name'), null);
    });
  });
}
