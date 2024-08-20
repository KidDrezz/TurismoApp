import 'package:flutter/material.dart';
import '../widgets/destination_card.dart'; // Asegúrate de importar el widget aquí
import '../widgets/inspiration_card.dart';
import '../utils/image_loader.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
              title: const Text('Descubre el Mundo'),
              background: loadImage('https://example.com/travel_background.jpg'),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                const Text(
                  'Ofertas Especiales',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return DestinationCard(
                        imageUrl: 'https://example.com/destination_${index + 1}.jpg',
                        title: 'Destino ${index + 1}',
                        price: '\$${(index + 1) * 100}',
                      );
                    },
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Inspiración para tu próximo viaje',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return InspirationCard(
                      imageUrl: 'https://example.com/inspiration_${index + 1}.jpg',
                      title: 'Inspiración ${index + 1}',
                    );
                  },
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
