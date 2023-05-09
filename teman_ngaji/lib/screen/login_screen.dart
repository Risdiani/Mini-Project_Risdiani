import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teman_ngaji/screen/home_screen.dart';
import 'package:teman_ngaji/utils/theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  late SharedPreferences logindata;
  late bool newUser;

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  void checkLogin() async {
    var sharedPreferences = logindata = await SharedPreferences.getInstance();
    newUser = logindata.getBool('login') ?? true;

    if (newUser == false) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: green,
      resizeToAvoidBottomInset: false,
      body: FutureBuilder<SharedPreferences>(
        future: SharedPreferences.getInstance(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            logindata = snapshot.data!;
            newUser = logindata.getBool('login') ?? true;

            if (newUser) {
              return buildLoginForm();
            } else {
              return const HomeScreen();
            }
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget buildLoginForm() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: formKey,
        child: ListView(
          children: [
            Center(
              child: Text(
                'Memperbaiki bacaan Al Quran itu\nseperti menarik anak panah,\nsemakin ditarik ke belakang,\nsemakin kuatlah luncuran panahnya ke depan.',
                style: GoogleFonts.poppins(color: text, fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.account_circle_rounded),
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value != null && value.length < 4) {
                  return 'Enter at least 4 characters';
                } else {
                  return null; //form is valid
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.email_rounded),
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              validator: (email) {
                if (email != null && !EmailValidator.validate(email)) {
                  return 'Enter a valid email';
                } else {
                  return null; //form is valid
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.password_rounded),
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value != null && value.length < 5) {
                  return 'Enter min. 5 characters';
                } else {
                  return null; //form is valid
                }
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final isValidForm = formKey.currentState!.validate();

                if (isValidForm) {
                  String username = _nameController.text;
                  logindata.setBool('login', false);
                  logindata.setString('username', username);
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                    (route) => false,
                  );
                }
              },
              child: Text(
                'Login',
                style: GoogleFonts.poppins(
                    fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
