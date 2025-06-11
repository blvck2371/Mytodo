import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLogin = true;
  bool isPasswordVisible = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
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
        SnackBar(content: Text(e.message ?? 'Erreur de connexion')),
      );
    }
  }

  Future<void> registerWithEmailPassword() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          );

      final uid = userCredential.user!.uid;

      // Création du document utilisateur avec une sous-collection
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
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? 'Erreur d’inscription')),
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

  Widget buildSocialButton(String label, IconData icon, VoidCallback onTap) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, color: Colors.black),
      label: Text(label, style: const TextStyle(color: Colors.black)),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        minimumSize: const Size.fromHeight(50),
        side: const BorderSide(color: Colors.grey),
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
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        suffixIcon: suffix,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: isLogin ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                GestureDetector(
                  onTap: () => setState(() => isLogin = false),
                  child: Text(
                    'Inscription',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight:
                          !isLogin ? FontWeight.bold : FontWeight.normal,
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
                ),
                onPressed:
                    () =>
                        setState(() => isPasswordVisible = !isPasswordVisible),
              ),
            ),
            const SizedBox(height: 8),
            if (isLogin)
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {}, // TODO: reset password
                  child: const Text.rich(
                    TextSpan(
                      text: "Mot de passe oublié ? ",
                      children: [
                        TextSpan(
                          text: "Réinitialisez-le",
                          style: TextStyle(color: Colors.green),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed:
                  isLogin ? signInWithEmailPassword : registerWithEmailPassword,
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                minimumSize: const Size.fromHeight(50),
              ),
              child: Text(
                isLogin ? "Se connecter" : "Créer un compte",
                style: TextStyle(
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
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
    );
  }
}
