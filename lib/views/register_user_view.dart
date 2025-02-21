import 'package:flutter/material.dart';

class RegisterUserView extends StatefulWidget {
  const RegisterUserView({super.key});

  @override
  State<RegisterUserView> createState() => _RegisterUserViewState();
}

class _RegisterUserViewState extends State<RegisterUserView> {
  final formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController phone = TextEditingController();
  List<String> roleChoices = ["Pegawai", "Pelanggan"];
  String? role;

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
        title: Text("Daftar"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
            child: Text("Login", style: TextStyle(color: Colors.white)),
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
                // Logo Tokopedia (bisa diganti sesuai keinginan)
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

                // Form
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      buildTextField("Nama Lengkap", Icons.person, name),
                      buildTextField("Email", Icons.email, email),
                      buildTextField("Alamat", Icons.home, address),
                      buildTextField("Nomor HP", Icons.phone, phone),
                      buildTextField("Password", Icons.lock, password, isPassword: true),
                      
                      // Dropdown Role
                      DropdownButtonFormField(
                        isExpanded: true,
                        value: role,
                        decoration: inputDecoration("Pilih Peran"),
                        items: roleChoices.map((r) {
                          return DropdownMenuItem(value: r, child: Text(r));
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            role = value.toString();
                          });
                        },
                        validator: (value) {
                          if (value == null) return 'Role harus dipilih';
                          return null;
                        },
                      ),

                      SizedBox(height: 20),

                      // Tombol Register
                      ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            print("Registrasi Berhasil!");
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          minimumSize: Size(double.infinity, 50),
                        ),
                        child: Text("Selanjutnya", style: TextStyle(fontSize: 16)),
                      ),

                      SizedBox(height: 15),

                      // Login dengan Google & Facebook
                      buildSocialLoginButton("Google", "assets/google_logo.png"),
                      SizedBox(height: 10),
                      buildSocialLoginButton("Facebook", "assets/facebook_logo.png"),

                      SizedBox(height: 20),

                      // Link ke halaman daftar
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

  // Widget Text Field dengan Border & Ikon
  Widget buildTextField(String hint, IconData icon, TextEditingController controller, {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        decoration: inputDecoration(hint).copyWith(prefixIcon: Icon(icon)),
        validator: (value) {
          if (value!.isEmpty) return '$hint harus diisi';
          return null;
        },
      ),
    );
  }

  // Dekorasi Input
  InputDecoration inputDecoration(String hint) {
    return InputDecoration(
      labelText: hint,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      filled: true,
      fillColor: Colors.grey[100],
    );
  }

  // Button Login dengan Google / Facebook
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

