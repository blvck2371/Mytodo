import 'package:get/get.dart';
import 'package:mytodo/model/personne.dart';
import 'package:intl/intl.dart';

String DateCrea() {
  DateTime date = DateTime.now();
  String formattedDate = DateFormat('EEEE, dd MMMM yyyy').format(date);
  return (formattedDate); // Exemple : Friday, 08 July 2025
}

class Tache {
  final RxString nom = ''.obs;
  final Rx<String> dateCreation = DateCrea().obs;
  final RxString description = ''.obs;
  final RxBool estCollective = false.obs; // true si plusieurs personnes
  final RxString detailTache = ''.obs;
  final RxInt progression = 0.obs; // de 0 à 100
  final RxList<String> intervenants = <String>[].obs;
  final RxString auteur = ''.obs;

  Tache({
    String? nom,
    String? dateCreation,
    String? description,
    bool? estCollective,
    String? detailTache,
    int? progression,
    List<String>? intervenants,
    String? auteur,
  }) {
    this.nom.value = nom ?? 'Developpement UI UX Todo APP';
    this.dateCreation.value = dateCreation ?? DateCrea();
    this.description.value = description ?? 'ceci est un projet de creation ';
    this.estCollective.value = estCollective ?? false;
    this.detailTache.value = detailTache ?? '';
    this.progression.value = progression ?? 30;
    this.intervenants.value = intervenants ?? ['Moussa', "Moi", "luis"];
    this.auteur.value = auteur ?? 'Moi';
  }
}
