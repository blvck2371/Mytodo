import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import '../theme/appColors.dart';

import 'home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLogin = true;
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final nomController = TextEditingController();
  final prenomController = TextEditingController();
  final telephoneController = TextEditingController();

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Veuillez entrer votre email';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Veuillez entrer un email valide';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Veuillez entrer votre mot de passe';
    }
    if (value.length < 6) {
      return 'Le mot de passe doit contenir au moins 6 caractères';
    }
    return null;
  }

  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Veuillez entrer votre numéro de téléphone';
    }
    final phoneRegex = RegExp(r'^[0-9]{10}$');
    if (!phoneRegex.hasMatch(value)) {
      return 'Veuillez entrer un numéro de téléphone valide (10 chiffres)';
    }
    return null;
  }

  String? validateRequired(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return 'Veuillez entrer votre $fieldName';
    }
    return null;
  }

  Future<void> signInWithEmailPassword() async {
    if (!_formKey.currentState!.validate()) return;

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      Get.offAll(() => const Home());
    } on FirebaseAuthException catch (e) {
      String message = 'Erreur de connexion';
      if (e.code == 'user-not-found') {
        message = 'Aucun utilisateur trouvé avec cet email';
      } else if (e.code == 'wrong-password') {
        message = 'Mot de passe incorrect';
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    }
  }

  Future<void> registerWithEmailPassword() async {
    if (!_formKey.currentState!.validate()) return;

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          );

      print("userCredential.user!.uid");
      print(userCredential.user!.uid);
      print(userCredential.user!.uid);
      print("userCredential.user!.uid");

      final uid = userCredential.user!.uid;

      await FirebaseFirestore.instance
          .collection('utilisateurs')
          .doc(uid)
          .collection('informations_personnelles')
          .doc('profil')
          .set({
            'nom': nomController.text.trim(),
            'prenom': prenomController.text.trim(),
            'telephone': telephoneController.text.trim(),
            'email': emailController.text.trim(),
            'date_creation': FieldValue.serverTimestamp(),
          });

      Get.offAll(() => const Home());
    } on FirebaseAuthException catch (e) {
      String message = 'Erreur d\'inscription';
      if (e.code == 'email-already-in-use') {
        message = 'Cet email est déjà utilisé';
      } else if (e.code == 'weak-password') {
        message = 'Le mot de passe est trop faible';
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

      Get.offAll(() => const Home());
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Erreur Google Sign-In : $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.backgroundcolorLight,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(24),
            children: [
              const SizedBox(height: 30),
              Center(
                child: Text(
                  isLogin ? 'Connexion' : 'Inscription',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Appcolors.primaryColorLight,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Switch(
                  value: !isLogin,
                  onChanged: (value) {
                    setState(() {
                      isLogin = !value;
                    });
                  },
                  activeColor: Appcolors.primaryColorLight,
                  activeTrackColor: Appcolors.secondaryColorLight,
                ),
              ),
              const SizedBox(height: 24),
              if (!isLogin) ...[
                buildTextField(
                  label: "Nom",
                  controller: nomController,
                  validator: (value) => validateRequired(value, 'nom'),
                ),
                const SizedBox(height: 12),
                buildTextField(
                  label: "Prénom",
                  controller: prenomController,
                  validator: (value) => validateRequired(value, 'prénom'),
                ),
                const SizedBox(height: 12),
                buildTextField(
                  label: "Téléphone",
                  controller: telephoneController,
                  validator: validatePhone,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
                const SizedBox(height: 12),
              ],
              buildTextField(
                label: "Email",
                controller: emailController,
                validator: validateEmail,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 12),
              buildTextField(
                label: "Mot de passe",
                controller: passwordController,
                obscure: !isPasswordVisible,
                validator: validatePassword,
                suffix: IconButton(
                  icon: Icon(
                    isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Appcolors.primaryColorLight,
                  ),
                  onPressed: () => setState(() => isPasswordVisible = !isPasswordVisible),
                ),
              ),
              if (!isLogin) ...[
                const SizedBox(height: 12),
                buildTextField(
                  label: "Confirmer le mot de passe",
                  controller: confirmPasswordController,
                  obscure: !isConfirmPasswordVisible,
                  validator: (value) {
                    if (value != passwordController.text) {
                      return 'Les mots de passe ne correspondent pas';
                    }
                    return null;
                  },
                  suffix: IconButton(
                    icon: Icon(
                      isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                      color: Appcolors.primaryColorLight,
                    ),
                    onPressed: () => setState(() => isConfirmPasswordVisible = !isConfirmPasswordVisible),
                  ),
                ),
              ],
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: isLogin ? signInWithEmailPassword : registerWithEmailPassword,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Appcolors.primaryColorLight,
                  foregroundColor: Colors.white,
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  isLogin ? "Se connecter" : "Créer un compte",
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
              const Center(child: Text("ou")),
              const SizedBox(height: 20),
              buildSocialButton(
                "Continuer avec Google",
                Icons.g_mobiledata,
                signInWithGoogle,
              ),
              const SizedBox(height: 10),
              buildSocialButton(
                "Continuer avec Apple",
                Icons.apple,
                () {}, // TODO: Apple
              ),
              const SizedBox(height: 10),
              buildSocialButton(
                "Continuer avec Facebook",
                Icons.facebook,
                () {}, // TODO: Facebook
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSocialButton(String label, IconData icon, VoidCallback onTap) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, color: Appcolors.primaryColorLight),
      label: Text(label, style: TextStyle(color: Appcolors.primaryColorLight)),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        minimumSize: const Size.fromHeight(50),
        side: BorderSide(color: Appcolors.secondaryColorLight),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  Widget buildTextField({
    required String label,
    required TextEditingController controller,
    bool obscure = false,
    Widget? suffix,
    String? Function(String?)? validator,
    TextInputType? keyboardType,
    List<TextInputFormatter>? inputFormatters,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      validator: validator,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      style: TextStyle(color: Appcolors.textColorlight),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Appcolors.textColorlightsm),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Appcolors.secondaryColorLight),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Appcolors.secondaryColorLight),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Appcolors.primaryColorLight),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.red),
        ),
        suffixIcon: suffix,
      ),
    );
  }
}
