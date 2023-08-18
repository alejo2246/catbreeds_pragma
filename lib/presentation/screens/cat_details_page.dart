import 'package:cached_network_image/cached_network_image.dart';
import 'package:catsbreeds_apg/domain/models/cat_model.dart';
import 'package:catsbreeds_apg/presentation/components/rate_attribute_component.dart';
import 'package:flutter/material.dart';

class CatDetailsPage extends StatelessWidget {
  final CatBreedModel breed;
  const CatDetailsPage({super.key, required this.breed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          breed.name,
          style: const TextStyle(
              fontFamily: 'poppins',
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(179, 1, 1, 1)),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 5),
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: CachedNetworkImage(
                    imageUrl: breed.image,
                    placeholder: (context, url) =>
                        Image.asset("assets/images/cat_placeholder.png"),
                    errorWidget: (context, url, error) =>
                        Image.asset("assets/images/cat_placeholder.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        breed.description,
                        style: const TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff1b2028),
                        ),
                        textAlign: TextAlign.left,
                      ),
                      RatingWidget(
                        title: 'Origin',
                        isRating: false,
                        description: breed.origin,
                      ),
                      RatingWidget(
                        title: 'Life span',
                        isRating: false,
                        description: breed.lifeSpan,
                      ),
                      RatingWidget(
                        title: 'Temperament',
                        isRating: false,
                        description: breed.temperament,
                      ),
                      RatingWidget(
                          title: 'Intelligence',
                          rating: breed.intelligence,
                          isRating: true),
                      RatingWidget(
                          title: 'Adaptability',
                          rating: breed.adaptability,
                          isRating: true),
                      RatingWidget(
                          title: 'Child Friendly',
                          rating: breed.childFriendly,
                          isRating: true),
                      RatingWidget(
                          title: 'Rare', rating: breed.rare, isRating: true),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
