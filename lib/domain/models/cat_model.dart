class CatBreedModel {
  final String name;
  final String origin;
  final String image;
  final int intelligence;
  final String description;
  final String temperament;
  final String lifeSpan;
  final int adaptability;
  final int childFriendly;
  final int rare;

  CatBreedModel({
    required this.name,
    required this.origin,
    required this.image,
    required this.intelligence,
    required this.description,
    required this.temperament,
    required this.lifeSpan,
    required this.adaptability,
    required this.childFriendly,
    required this.rare,
  });

  factory CatBreedModel.fromJson(Map<String, dynamic> json) {
    String idImage = json["reference_image_id"] ?? "";
    return CatBreedModel(
      name: json['name'] ?? "Breed name",
      description: json['description'] ?? "Breed description",
      temperament: json['temperament'] ?? "Breed temperament",
      origin: json['origin'] ?? "Breed Origin",
      image: "https://cdn2.thecatapi.com/images/$idImage.jpg",
      intelligence: json["intelligence"] ?? 0,
      lifeSpan: json['life_span'] ?? 0,
      adaptability: json["adaptability"] ?? 0,
      childFriendly: json["child_friendly"] ?? 0,
      rare: json['rare'] ?? 0,
    );
  }
}
