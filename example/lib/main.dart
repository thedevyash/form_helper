import 'package:flutter/material.dart';
import 'package:form_helper/form_helper.dart';

void main() {
  runApp(const ValidatorDemoApp());
}

class ValidatorDemoApp extends StatelessWidget {
  const ValidatorDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form Validator Helper Demo',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const FormDemoPage(),
    );
  }
}

class FormDemoPage extends StatefulWidget {
  const FormDemoPage({super.key});

  @override
  State<FormDemoPage> createState() => _FormDemoPageState();
}

class _FormDemoPageState extends State<FormDemoPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Validator Demo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const Text(
                  'All fields are validated using form_validator_helper.\n',
                  style: TextStyle(fontSize: 14)),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                validator: FormValidator.validateEmail,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Password'),
                controller: _passwordController,
                obscureText: true,
                validator: (val) => FormValidator.validatePassword(
                  val,
                  minLength: 8,
                  requiredMessage: 'Enter a password',
                  lengthMessage: 'Must be at least {minLength} characters.',
                ),
              ),
              TextFormField(
                decoration:
                    const InputDecoration(labelText: 'Confirm Password'),
                controller: _confirmPasswordController,
                obscureText: true,
                validator: (val) => FormValidator.validateConfirmPassword(
                  val,
                  _passwordController.text,
                  mismatchMessage: 'Passwords must match.',
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Phone Number'),
                keyboardType: TextInputType.number,
                validator: FormValidator.validatePhone,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Name'),
                validator: FormValidator.validateName,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Username'),
                validator: FormValidator.validateUsername,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Address'),
                validator: (val) =>
                    FormValidator.validateNotEmpty(val, fieldName: 'Address'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('All fields are valid!')),
                    );
                  }
                },
                child: const Text('Validate'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
