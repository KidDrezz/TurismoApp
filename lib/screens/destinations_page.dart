import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DestinationsPage extends StatefulWidget {
  const DestinationsPage({super.key});

  @override
  _DestinationsPageState createState() => _DestinationsPageState();
}

class _DestinationsPageState extends State<DestinationsPage> {
  List<dynamic> _places = [];
  bool _isLoading = false;
  bool _hasError = false;

  Future<void> _searchPlaces(String query) async {
    final String apiKey = 'AIzaSyDoYkh_QmBeNt0w-P-5RFAVETRpLhxfUv4';  // Reemplaza con tu clave API
    final String url =
        'https://maps.googleapis.com/maps/api/place/textsearch/json?query=$query&key=$apiKey';

    setState(() {
      _isLoading = true;
      _hasError = false;
    });

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print("API Response: ${response.body}");  // Log para ver la respuesta de la API
        setState(() {
          _places = data['results'];
        });
      } else {
        throw Exception('Error al cargar los datos');
      }
    } catch (e) {
      setState(() {
        _hasError = true;
        print("Error: $e");  // Log del error
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Destinos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () async {
              final result = await showSearch(
                context: context,
                delegate: DestinationSearchDelegate(_searchPlaces),
              );
              if (result != null) {
                await _searchPlaces(result);
              }
            },
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _hasError
              ? const Center(child: Text('Error al cargar los datos.'))
              : _places.isEmpty
                  ? const Center(child: Text('No se encontraron resultados.'))
                  : ListView.builder(
                      itemCount: _places.length,
                      itemBuilder: (context, index) {
                        final place = _places[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: ListTile(
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                place['icon'],
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(Icons.error);
                                },
                              ),
                            ),
                            title: Text(place['name']),
                            subtitle: Text(place['formatted_address'] ?? 'No address available'),
                            trailing: const Icon(Icons.arrow_forward_ios),
                            onTap: () {
                              // Navegar a la página de detalles del destino
                            },
                          ),
                        );
                      },
                    ),
    );
  }
}

class DestinationSearchDelegate extends SearchDelegate<String> {
  final Function(String) searchPlaces;

  DestinationSearchDelegate(this.searchPlaces);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListTile(
      title: Text(query),
      onTap: () {
        close(context, query);
      },
    );
  }
}
