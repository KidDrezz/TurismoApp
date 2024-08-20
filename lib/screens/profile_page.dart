import 'package:flutter/material.dart';
import '../utils/image_loader.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Mi Perfil'),
              background: loadImage('https://example.com/profile_background.jpg'),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: const NetworkImage('https://example.com/profile_picture.jpg'),
                      onBackgroundImageError: (exception, stackTrace) {
                        const Center(child: Text('Error al cargar imagen'));
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Center(
                    child: Text(
                      'Nombre de Usuario',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Center(
                    child: Text(
                      'usuario@example.com',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Mis Viajes',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 120,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.only(right: 16),
                          child: Container(
                            width: 100,
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: loadImage(
                                    'https://example.com/trip_${index + 1}.jpg',
                                    height: 60,
                                    width: double.infinity,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Viaje ${index + 1}',
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 24),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Configuración'),
                    onTap: () {
                      // Navegar a la página de configuración
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.help),
                    title: const Text('Ayuda y Soporte'),
                    onTap: () {
                      // Navegar a la página de ayuda y soporte
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.logout),
                    title: const Text('Cerrar Sesión'),
                    onTap: () {
                      // Implementar la funcionalidad de cierre de sesión
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
