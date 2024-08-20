import 'package:flutter/material.dart';

class ItineraryPage extends StatelessWidget {
  const ItineraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mi Itinerario')),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Día ${index + 1}',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text('9:00 AM - Desayuno'),
                  const Text('11:00 AM - Visita al museo'),
                  const Text('2:00 PM - Almuerzo'),
                  const Text('4:00 PM - Tour por la ciudad'),
                  const Text('8:00 PM - Cena'),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implementar la funcionalidad para agregar actividades al itinerario
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
