import 'dart:convert';

import 'package:catsbreeds_apg/data/repositories/api_service.dart';
import 'package:catsbreeds_apg/domain/models/cat_model.dart';
import 'package:flutter/material.dart';

class CatBreedsProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  String _error = '';
  String get error => _error;
  String _searchQuery = '';
  List<CatBreedModel> _allBreeds = []; // Almacena todas las razas sin filtrar
  List<CatBreedModel> _filteredBreeds = []; // Almacena las razas filtradas

  List<CatBreedModel> get breeds => _filteredBreeds;

  void updateSearchQuery(String query) {
    _searchQuery = query;
    _applyFilter();
  }

  void setBreeds(List<CatBreedModel> breeds) {
    _allBreeds = breeds;
    _applyFilter();
  }

  void _applyFilter() {
    if (_searchQuery.isNotEmpty) {
      _filteredBreeds = _allBreeds
          .where((breed) =>
              breed.name.toLowerCase().contains(_searchQuery.toLowerCase()))
          .toList();
    } else {
      _filteredBreeds = _allBreeds;
    }
    notifyListeners();
  }

  Future<void> fetchBreeds() async {
    try {
      final response = await _apiService.getBreeds();
      if (response.statusCode != 200) {
        _error = 'Error fetching cat breeds';
      }
      final data = json.decode(response.body);
      List<CatBreedModel> breedsList = List<CatBreedModel>.from(
          data.map((json) => CatBreedModel.fromJson(json)));
      _error = '';
      setBreeds(breedsList);
    } catch (error) {
      _error = 'An error has occurred';
    }
  }
}
