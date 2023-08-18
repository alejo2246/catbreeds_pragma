import 'package:catsbreeds_apg/presentation/components/cat_card_widget.dart';
import 'package:catsbreeds_apg/presentation/providers/cat_breeds_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});
  Future<void> _refreshBreeds(BuildContext context) async {
    final provider = context.read<CatBreedsProvider>();
    await provider.fetchBreeds();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.read<CatBreedsProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('CatBreeds'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (query) {
                provider.updateSearchQuery(
                    query); // Llama a la función para actualizar el filtro
              },
            ),
          ),
          Expanded(
            child: Consumer<CatBreedsProvider>(
              builder: (context, provider, _) {
                if (provider.breeds.isEmpty) {
                  provider.fetchBreeds();
                  return const Center(child: CircularProgressIndicator());
                } else if (provider.error.isNotEmpty) {
                  return Center(
                    child: Text(provider.error),
                  );
                } else {
                  return RefreshIndicator(
                      onRefresh: () => _refreshBreeds(context),
                      child: ListView.builder(
                        itemCount: provider.breeds.length,
                        itemBuilder: (context, index) {
                          final breed = provider.breeds[index];
                          return CatWidget(breed: breed);
                        },
                      ));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
