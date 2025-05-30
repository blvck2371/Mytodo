import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/instance_manager.dart';
import 'package:intl/intl.dart';

import 'package:mytodo/theme/appSpacing.dart';

final teams = false.obs;

// void showNewTaskModal(BuildContext context) {

//   showModalBottomSheet(
//     context: context,
//     isScrollControlled: true, // Pour permettre la hauteur complète
//     backgroundColor: Colors.transparent, // Pour les bords arrondis
//     builder:
//         (context) => DraggableScrollableSheet(
//           initialChildSize: 0.8,
//           maxChildSize: 0.95,
//           minChildSize: 0.4,
//           builder:
//               (_, controller) => Container(
//                 padding: EdgeInsets.all(16),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
//                 ),
//                 child: ListView(
//                   controller: controller,
//                   children: [
//                     Center(
//                       child: Container(
//                         width: 40,
//                         height: 4,
//                         margin: EdgeInsets.only(bottom: 16),
//                         decoration: BoxDecoration(
//                           color: Colors.grey[300],
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           'Nouvelle tâche à faire',
//                           style: Theme.of(context).textTheme.titleLarge,
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: AppSpacing.sm),

//                     Divider(),

//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Libelle',
//                           style: Theme.of(context).textTheme.titleLarge,
//                         ),
//                         SizedBox(height: 8),
//                         TextField(
//                           decoration: InputDecoration(
//                             hintText: 'veuillez saisir votre taches',
//                             filled: true,
//                             // fillColor:
//                             //Theme.of(context).scaffoldBackgroundColor,
//                             fillColor: Color(0xFFF5F7F9), // gris très clair
//                             contentPadding: EdgeInsets.symmetric(
//                               horizontal: 16,
//                               vertical: 14,
//                             ),
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(12),
//                               borderSide:
//                                   BorderSide.none, // pas de bord visible
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),

//                     22.vSpace,
//                     Text(
//                       'Intervenant',
//                       style: Theme.of(context).textTheme.titleLarge,
//                     ),
//                     10.vSpace,
//                     Container(
//                       height: 60,
//                       color: Color(0xFFF5F7F9),
//                       child: Row(
//                         children: [
//                           Expanded(
//                             child: ElevatedButton.icon(
//                               icon: Icon(Icons.person, color: Colors.white),
//                               label: Text(
//                                 'Personnel',
//                                 style: TextStyle(color: Colors.white),
//                               ),
//                               onPressed: () {},
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Theme.of(context).primaryColor,
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(
//                                     12,
//                                   ), // Bord arrondi
//                                 ),
//                                 padding: EdgeInsets.symmetric(
//                                   horizontal: 24,
//                                   vertical: 14,
//                                 ), // Optionnel
//                               ),
//                             ),
//                           ),
//                           // SizedBox(width: 8),
//                           5 .hSpace,
//                           Expanded(
//                             child: ElevatedButton.icon(
//                               icon: Icon(
//                                 Icons.group,
//                                 color: Theme.of(context).iconTheme.color,
//                               ),
//                               label: Text(
//                                 'Teams',
//                                 style: Theme.of(context).textTheme.titleMedium,
//                               ),
//                               onPressed: () {},
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Color(0xFFF5F7F9),
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(
//                                     12,
//                                   ), // Bord arrondi
//                                 ),
//                                 padding: EdgeInsets.symmetric(
//                                   horizontal: 24,
//                                   vertical: 14,
//                                 ), // Optionnel
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: 16),
//                     Text(
//                       'Description',
//                       style: Theme.of(context).textTheme.titleLarge,
//                     ),
//                     SizedBox(height: 8),
//                     TextField(
//                       decoration: InputDecoration(
//                         hintText: 'veuillez saisir votre description',

//                         filled: true,
//                         // fillColor:
//                         //Theme.of(context).scaffoldBackgroundColor,
//                         fillColor: Color(0xFFF5F7F9), // gris très clair
//                         contentPadding: EdgeInsets.symmetric(
//                           horizontal: 40,
//                           vertical: 40,
//                         ),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(12),
//                           borderSide: BorderSide.none, // pas de bord visible
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 16),
//                     Row(
//                       children: [
//                         Expanded(
//                           child: TextField(
//                             decoration: InputDecoration(
//                               labelText: 'Date',
//                               prefixIcon: Icon(Icons.calendar_today),
//                             ),
//                           ),
//                         ),
//                         SizedBox(width: 8),
//                         Expanded(
//                           child: TextField(
//                             decoration: InputDecoration(
//                               labelText: 'Time',
//                               prefixIcon: Icon(Icons.access_time),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 24),
//                     Row(
//                       children: [
//                         Expanded(
//                           child: OutlinedButton(
//                             onPressed: () => Navigator.pop(context),
//                             child: Text('Cancel'),
//                           ),
//                         ),
//                         SizedBox(width: 8),
//                         Expanded(
//                           child: ElevatedButton(
//                             onPressed: () {},
//                             child: Text('Create'),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//         ),
//   );
// }

void showNewTaskModal(BuildContext context) {
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      _dateController.text = DateFormat('dd/MM/yy').format(picked);
    }
  }

  Future<void> _selectTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      final now = DateTime.now();
      final dt = DateTime(
        now.year,
        now.month,
        now.day,
        picked.hour,
        picked.minute,
      );
      _timeController.text = DateFormat('HH:mm').format(dt);
    }
  }

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder:
        (context) => DraggableScrollableSheet(
          initialChildSize: 0.8,
          maxChildSize: 0.95,
          minChildSize: 0.4,
          builder:
              (_, controller) => Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                child: ListView(
                  controller: controller,
                  children: [
                    Center(
                      child: Container(
                        width: 40,
                        height: 4,
                        margin: EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Nouvelle tâche à faire',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                    SizedBox(height: AppSpacing.sm),
                    Divider(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Libelle',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        SizedBox(height: 8),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'veuillez saisir votre taches',
                            filled: true,
                            fillColor: Color(0xFFF5F7F9),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 14,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    22.vSpace,
                    Text(
                      'Intervenant',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    10.vSpace,
                    Container(
                      height: 60,
                      color: Color(0xFFF5F7F9),
                      child: Row(
                        children: [
                          Expanded(
                            child: ElevatedButton.icon(
                              icon: Icon(Icons.person, color: Colors.white),
                              label: Text(
                                'Personnel',
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context).primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 14,
                                ),
                              ),
                            ),
                          ),
                          5.hSpace,
                          Expanded(
                            child: ElevatedButton.icon(
                              icon: Icon(
                                Icons.group,
                                color: Theme.of(context).iconTheme.color,
                              ),
                              label: Text(
                                'Teams',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFFF5F7F9),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 14,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Description',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(height: 8),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'veuillez saisir votre description',
                        filled: true,
                        fillColor: Color(0xFFF5F7F9),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 40,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),

                    // ✅ Date et Time Picker fonctionnels
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _dateController,
                            readOnly: true,
                            onTap: _selectDate,
                            decoration: InputDecoration(
                              labelText: 'Date',
                              hintText: 'dd/mm/yy',
                              prefixIcon: Icon(Icons.calendar_today),
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                // bordure lors de la sélection
                                borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            controller: _timeController,
                            readOnly: true,
                            onTap: _selectTime,
                            decoration: InputDecoration(
                              labelText: 'Time',
                              hintText: 'hh : mm',
                              prefixIcon: Icon(Icons.access_time),
                              border:
                                  OutlineInputBorder(), // bordure par défaut
                              focusedBorder: OutlineInputBorder(
                                // bordure lors de la sélection
                                borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 24),
                    Row(
                      children: [
                        // Bouton Cancel
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () => Navigator.pop(context),
                            style: OutlinedButton.styleFrom(
                              foregroundColor:
                                  Colors.blue, // Texte et bordure bleus
                              side: BorderSide(color: Colors.red),
                              padding: EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text('Cancel'),
                          ),
                        ),

                        SizedBox(width: 12),

                        // Bouton Create
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},

                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Theme.of(context).primaryColor, // Fond bleu
                              foregroundColor: Colors.white, // Texte blanc
                              padding: EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text('Create'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
        ),
  );
}
