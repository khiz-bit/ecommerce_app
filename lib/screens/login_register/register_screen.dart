import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/login_register/app_bloc.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = '/register';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => RegisterScreen(),
    );
  }

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();
  final confirmPasswordTextEditingController = TextEditingController();

  bool _passwordVisible = false;

  final _formKey = GlobalKey<FormState>();

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final email = emailTextEditingController.text;
      final password = passwordTextEditingController.text;
      BlocProvider.of<AppBloc>(context).add(
          AppEventRegister(email: email, password: password));
    }
  }

  @override
  Widget build(BuildContext context) {
    bool darkTheme = MediaQuery
        .of(context)
        .platformBrightness == Brightness.dark;

    return BlocProvider(
      create: (_) => AppBloc(),
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.all(0),
          children: [
            Column(
              children: [
                SizedBox(height: 20,),
                Text(
                  'Register',
                  style: TextStyle(
                    color: darkTheme ? Colors.amber.shade400 : Colors.blue,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 20, 15, 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextFormField(
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(100)
                              ],
                              decoration: InputDecoration(
                                hintText: "Email",
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                                filled: true,
                                fillColor: darkTheme ? Colors.black45 : Colors
                                    .grey.shade200,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: darkTheme
                                      ? Colors.amber.shade400
                                      : Colors.grey,
                                ),
                              ),
                              autovalidateMode: AutovalidateMode
                                  .onUserInteraction,
                              validator: (text) {
                                if (text == null || text.isEmpty) {
                                  return 'Email can\'t be empty';
                                }
                                if (EmailValidator.validate(text) == true) {
                                  return null;
                                }
                                if (text.length < 2) {
                                  return "Please enter a valid email";
                                }
                                if (text.length > 99) {
                                  return "Email can\'t be more than 100";
                                }
                              },
                              onChanged: (text) =>
                                  setState(() {
                                    emailTextEditingController.text = text;
                                  }),
                            ),
                            SizedBox(height: 20,),
                            TextFormField(
                              obscureText: !_passwordVisible,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(50)
                              ],
                              decoration: InputDecoration(
                                hintText: "Password",
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                                filled: true,
                                fillColor: darkTheme ? Colors.black45 : Colors
                                    .grey.shade200,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: darkTheme
                                      ? Colors.amber.shade400
                                      : Colors.grey,
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _passwordVisible ? Icons.visibility : Icons
                                        .visibility_off,
                                    color: darkTheme
                                        ? Colors.amber.shade400
                                        : Colors.grey,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _passwordVisible = !_passwordVisible;
                                    });
                                  },
                                ),
                              ),
                              autovalidateMode: AutovalidateMode
                                  .onUserInteraction,
                              validator: (text) {
                                if (text == null || text.isEmpty) {
                                  return 'Password can\'t be empty';
                                }
                                if (text.length < 6) {
                                  return "Please enter a valid password";
                                }
                                if (text.length > 49) {
                                  return "Password can\'t be more than 50";
                                }
                                return null;
                              },
                              onChanged: (text) =>
                                  setState(() {
                                    passwordTextEditingController.text = text;
                                  }),
                            ),
                            SizedBox(height: 20,),
                            TextFormField(
                              obscureText: !_passwordVisible,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(50)
                              ],
                              decoration: InputDecoration(
                                hintText: "Confirm Password",
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                                filled: true,
                                fillColor: darkTheme ? Colors.black45 : Colors
                                    .grey.shade200,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: darkTheme
                                      ? Colors.amber.shade400
                                      : Colors.grey,
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _passwordVisible ? Icons.visibility : Icons
                                        .visibility_off,
                                    color: darkTheme
                                        ? Colors.amber.shade400
                                        : Colors.grey,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _passwordVisible = !_passwordVisible;
                                    });
                                  },
                                ),
                              ),
                              autovalidateMode: AutovalidateMode
                                  .onUserInteraction,
                              validator: (text) {
                                if (text == null || text.isEmpty) {
                                  return 'Confirm Password can\'t be empty';
                                }
                                if (text !=
                                    passwordTextEditingController.text) {
                                  return "Passwords do not match";
                                }
                                return null;
                              },
                              onChanged: (text) =>
                                  setState(() {
                                    confirmPasswordTextEditingController.text =
                                        text;
                                  }),
                            ),
                            SizedBox(height: 20,),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: darkTheme
                                    ? Colors.amber.shade400
                                    : Colors.blue,
                                onPrimary: darkTheme ? Colors.black : Colors
                                    .white,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32),
                                ),
                                minimumSize: Size(double.infinity, 50),
                              ),
                              onPressed: () {
                                _submit();
                              },
                              child: Text(
                                'Register',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            SizedBox(height: 20,),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Back',
                                style: TextStyle(
                                  color: darkTheme
                                      ? Colors.amber.shade400
                                      : Colors.blue,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

