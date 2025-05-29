import 'package:get/get.dart';

class Personne {
  // Champs observables
  final RxString nom = ''.obs;
  final RxString prenom = ''.obs;
  final RxInt age = 0.obs;
  final RxString email = ''.obs;

  // Constructeur avec initialisation
  Personne({
    String nom = 'Abdel',
    String prenom = 'Reoufou',
    int age = 27,
    String email = 'Lindoungapoutabdel@gmail.com',
  }) {
    this.nom.value = nom;
    this.prenom.value = prenom;
    this.age.value = age;
    this.email.value = email;
  }

  // Méthodes utilitaires (facultatives)
  Map<String, dynamic> toJson() => {
    'nom': nom.value,
    'prenom': prenom.value,
    'age': age.value,
    'email': email.value,
  };

  factory Personne.fromJson(Map<String, dynamic> json) => Personne(
    nom: json['nom'] ?? '',
    prenom: json['prenom'] ?? '',
    age: json['age'] ?? 0,
    email: json['email'] ?? '',
  );
}
