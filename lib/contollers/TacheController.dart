import 'package:get/get.dart';
import 'package:mytodo/model/tache.dart';

class TacheController extends GetxController {
  final RxList<Tache> taches = <Tache>[].obs;

  void ajouterTache(Tache tache) {
    taches.add(tache);
  }

  void supprimerTache(int index) {
    if (index >= 0 && index < taches.length) {
      taches.removeAt(index);
    }
  }

  void mettreAJourProgression(int index, int nouvelleValeur) {
    if (index >= 0 && index < taches.length) {
      taches[index].progression.value = nouvelleValeur.clamp(0, 100);
    }
  }

  void ajouterIntervenant(int index, String nomIntervenant) {
    if (index >= 0 && index < taches.length) {
      taches[index].intervenants.add(nomIntervenant);
    }
  }
}
