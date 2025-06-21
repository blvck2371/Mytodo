import 'package:get/get.dart';
import 'package:mytodo/model/personne.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

enum TacheStatus {
  enCours,
  achevee
}

String DateCrea() {
  DateTime date = DateTime.now();
  String formattedDate = DateFormat('EEEE, dd MMMM yyyy').format(date);
  return (formattedDate); // Exemple : Friday, 08 July 2025
}

class Tache {
  final String? id;
  final String nom;
  final String description;
  final String dateCreation;
  final String dateEcheance;
  final String heureEcheance;
  final bool isTeam;
  final String userId;
  final String userEmail;
  final TacheStatus status;

  // Constructeur par défaut
  Tache.empty()
      : id = null,
        nom = '',
        description = '',
        dateCreation = DateCrea(),
        dateEcheance = '',
        heureEcheance = '',
        isTeam = false,
        userId = '',
        userEmail = '',
        status = TacheStatus.enCours;

  Tache({
    this.id,
    required this.nom,
    required this.description,
    required this.dateCreation,
    required this.dateEcheance,
    required this.heureEcheance,
    required this.isTeam,
    required this.userId,
    required this.userEmail,
    this.status = TacheStatus.enCours,
  });

  // Convertir l'objet en Map pour Firebase
  Map<String, dynamic> toMap() {
    return {
      'nom': nom,
      'description': description,
      'dateCreation': dateCreation,
      'dateEcheance': dateEcheance,
      'heureEcheance': heureEcheance,
      'isTeam': isTeam,
      'userId': userId,
      'userEmail': userEmail,
      'status': status.toString().split('.').last,
    };
  }

  // Créer un objet Tache à partir d'un document Firebase
  factory Tache.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Tache(
      id: doc.id,
      nom: data['nom'] ?? '',
      description: data['description'] ?? '',
      dateCreation: data['dateCreation'] ?? '',
      dateEcheance: data['dateEcheance'] ?? '',
      heureEcheance: data['heureEcheance'] ?? '',
      isTeam: data['isTeam'] ?? false,
      userId: data['userId'] ?? '',
      userEmail: data['userEmail'] ?? '',
      status: TacheStatus.values.firstWhere(
        (e) => e.toString().split('.').last == (data['status'] ?? 'enCours'),
        orElse: () => TacheStatus.enCours,
      ),
    );
  }

  // Méthode pour enregistrer une tâche dans Firebase
  static Future<void> saveTache(Tache tache) async {
    try {
      // Référence à la collection des tâches de l'utilisateur
      final userTasksRef = FirebaseFirestore.instance
          .collection('utilisateurs')
          .doc(tache.userId)
          .collection(tache.userEmail)
          .doc('taches')
          .collection('taches');

      // Ajouter la tâche
      await userTasksRef.add(tache.toMap());
    } catch (e) {
      print('Erreur lors de l\'enregistrement de la tâche: $e');
      rethrow;
    }
  }

  // Méthode pour mettre à jour le statut d'une tâche
  static Future<void> updateTacheStatus(String tacheId, String userId, String userEmail, TacheStatus newStatus) async {
    try {
      final tacheRef = FirebaseFirestore.instance
          .collection('utilisateurs')
          .doc(userId)
          .collection(userEmail)
          .doc('taches')
          .collection('taches')
          .doc(tacheId);

      await tacheRef.update({
        'status': newStatus.toString().split('.').last,
      });
    } catch (e) {
      print('Erreur lors de la mise à jour du statut: $e');
      rethrow;
    }
  }

  // Méthode pour récupérer les tâches par statut
  static Stream<List<Tache>> getTachesByStatus(String userId, String userEmail, TacheStatus status) {
    return FirebaseFirestore.instance
        .collection('utilisateurs')
        .doc(userId)
        .collection(userEmail)
        .doc('taches')
        .collection('taches')
        .where('status', isEqualTo: status.toString().split('.').last)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => Tache.fromFirestore(doc))
            .toList());
  }
}
