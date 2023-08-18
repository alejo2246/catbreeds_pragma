import 'package:cached_network_image/cached_network_image.dart';
import 'package:catsbreeds_apg/domain/models/cat_model.dart';
import 'package:catsbreeds_apg/presentation/screens/cat_details_page.dart';
import 'package:flutter/material.dart';

class CatWidget extends StatefulWidget {
  final CatBreedModel breed;
  const CatWidget({super.key, required this.breed});

  @override
  State<CatWidget> createState() => _CatWidgetState();
}

class _CatWidgetState extends State<CatWidget> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Card(
      margin: EdgeInsets.all(screenWidth * 0.03),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 0, 8, 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.breed.name,
                  style: const TextStyle(
                      fontFamily: "poppins",
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.more_horiz_outlined),
                  iconSize: 45,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              CatDetailsPage(breed: widget.breed)),
                    );
                  },
                ),
              ],
            ),
            SizedBox(
              height: 200,
              child: Align(
                alignment: Alignment.center,
                child: CachedNetworkImage(
                  imageUrl: widget.breed.image,
                  placeholder: (context, url) =>
                      Image.asset("assets/images/cat_placeholder.png"),
                  errorWidget: (context, url, error) =>
                      Image.asset("assets/images/cat_placeholder.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.breed.origin,
                  style: const TextStyle(
                    fontFamily: "poppins",
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Color.fromARGB(255, 45, 45, 45),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Intelligence',
                      style: TextStyle(
                        fontFamily: "poppins",
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(
                        width: 4), // Espacio entre el título y los corazones

                    Row(
                      children: List.generate(
                        5, // Muestra siempre 5 corazones
                        (index) {
                          if (index < widget.breed.intelligence) {
                            return const Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 25,
                            );
                          } else {
                            return const Icon(Icons.favorite,
                                color: Colors.grey, size: 25);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
