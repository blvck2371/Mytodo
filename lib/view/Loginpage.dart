import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import '../theme/appColors.dart';
import '../theme/appTheme.dart';

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

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final nomController = TextEditingController();
  final prenomController = TextEditingController();
  final telephoneController = TextEditingController();

  Future<void> signInWithEmailPassword() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      Get.offAll(() => const Home());
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message ?? 'Erreur de connexion'),
          backgroundColor: Appcolors.errorColor,
        ),
      );
    }
  }

  Future<void> registerWithEmailPassword() async {
    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Les mots de passe ne correspondent pas'),
          backgroundColor: Appcolors.errorColor,
        ),
      );
      return;
    }

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          );

      final uid = userCredential.user!.uid;
      final emailuser = userCredential.user!.email;

      await FirebaseFirestore.instance
          .collection('utilisateurs')
          .doc(uid)
          .collection(emailuser.toString())
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
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message ?? "Erreur d'inscription"),
          backgroundColor: Appcolors.errorColor,
        ),
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
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erreur Google Sign-In : $e'),
          backgroundColor: Appcolors.errorColor,
        ),
      );
    }
  }

  Widget buildSocialButton(String label, IconData icon, VoidCallback onTap) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, color: Theme.of(context).colorScheme.onSurface),
      label: Text(
        label,
        style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.surface,
        minimumSize: const Size.fromHeight(50),
        side: BorderSide(color: Theme.of(context).colorScheme.outline),
      ),
    );
  }

  Widget buildTextField({
    required String label,
    required TextEditingController controller,
    bool obscure = false,
    Widget? suffix,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        suffixIcon: suffix,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            const SizedBox(height: 30),
            Row(
              children: [
                GestureDetector(
                  onTap: () => setState(() => isLogin = true),
                  child: Text(
                    'Connexion',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: isLogin 
                        ? Theme.of(context).colorScheme.primary 
                        : Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                GestureDetector(
                  onTap: () => setState(() => isLogin = false),
                  child: Text(
                    'Inscription',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: !isLogin 
                        ? Theme.of(context).colorScheme.primary 
                        : Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            if (!isLogin) ...[
              buildTextField(label: "Nom", controller: nomController),
              const SizedBox(height: 12),
              buildTextField(label: "Prénom", controller: prenomController),
              const SizedBox(height: 12),
              buildTextField(
                label: "Téléphone",
                controller: telephoneController,
              ),
              const SizedBox(height: 12),
            ],
            buildTextField(label: "Email", controller: emailController),
            const SizedBox(height: 12),
            buildTextField(
              label: "Mot de passe",
              controller: passwordController,
              obscure: !isPasswordVisible,
              suffix: IconButton(
                icon: Icon(
                  isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
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
                suffix: IconButton(
                  icon: Icon(
                    isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  onPressed: () => setState(() => isConfirmPasswordVisible = !isConfirmPasswordVisible),
                ),
              ),
            ],
            const SizedBox(height: 8),
            if (isLogin)
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {}, // TODO: reset password
                  child: Text.rich(
                    TextSpan(
                      text: "Mot de passe oublié ? ",
                      style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant),
                      children: [
                        TextSpan(
                          text: "Réinitialisez-le",
                          style: TextStyle(color: Theme.of(context).colorScheme.primary),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: isLogin ? signInWithEmailPassword : registerWithEmailPassword,
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                minimumSize: const Size.fromHeight(50),
              ),
              child: Text(
                isLogin ? "Se connecter" : "Créer un compte",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                "ou",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ),
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
    );
  }
}
