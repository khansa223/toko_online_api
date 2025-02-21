import 'package:api_insert/services/user.dart';
import 'package:api_insert/widgets/alert.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  UserService user = UserService();
  final formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isLoading = false;
  bool showPass = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
            child: Text("Daftar", style: TextStyle(color: Colors.white)),
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(
                  "data:image/jpeg;base64,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",
                  height: 60,
                ),
                SizedBox(height: 15),
                Text(
                  "Masuk",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      buildTextField("Email", Icons.email, email),
                      buildTextField("Password", Icons.lock, password, isPassword: true),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            setState(() => isLoading = true);
                            var data = {"email": email.text, "password": password.text};
                            var result = await user.loginUser(data);
                            setState(() => isLoading = false);
                            AlertMessage().showAlert(context, result.message, result.status);
                            if (result.status) {
                              Future.delayed(Duration(seconds: 2), () {
                                Navigator.pushReplacementNamed(context, '/dashboard');
                              });
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          minimumSize: Size(double.infinity, 50),
                        ),
                        child: isLoading
                            ? CircularProgressIndicator(color: Colors.white)
                            : Text("Masuk", style: TextStyle(fontSize: 16)),
                      ),
                      SizedBox(height: 15),
                      buildSocialLoginButton("Google", "assets/google_logo.png"),
                      SizedBox(height: 10),
                      buildSocialLoginButton("Facebook", "assets/facebook_logo.png"),
                      SizedBox(height: 20),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Belum punya akun? Daftar",
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String hint, IconData icon, TextEditingController controller, {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          filled: true,
          fillColor: Colors.grey[100],
          prefixIcon: Icon(icon),
        ),
        validator: (value) => value!.isEmpty ? '$hint harus diisi' : null,
      ),
    );
  }

  Widget buildSocialLoginButton(String label, String logoPath) {
    return OutlinedButton.icon(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        side: BorderSide(color: Colors.grey.shade300),
        minimumSize: Size(double.infinity, 50),
      ),
      icon: Image.asset(logoPath, width: 20),
      label: Text("Masuk dengan $label", style: TextStyle(fontSize: 16)),
    );
  }
}
