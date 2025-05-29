import 'package:get/get.dart';
import 'package:mytodo/model/personne.dart';

class PersonneController extends GetxController {
  // Instance observable de la personne
  final personne = Personne().obs;

  // Méthodes pour modifier les champs
  void setNom(String value) => personne.value.nom.value = value;
  void setPrenom(String value) => personne.value.prenom.value = value;
  void setAge(int value) => personne.value.age.value = value;
  void setEmail(String value) => personne.value.email.value = value;

  // Exemple de méthode logique
  void incrementAge() {
    personne.value.age.value++;
  }

  // Réinitialiser la personne
  void resetPersonne() {
    personne.value = Personne();
  }

  // Accéder facilement aux valeurs (optionnel)
  String get nom => personne.value.nom.value;
  String get prenom => personne.value.prenom.value;
  int get age => personne.value.age.value;
  String get email => personne.value.email.value;
}
