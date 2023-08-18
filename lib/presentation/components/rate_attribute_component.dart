import 'package:flutter/material.dart';

class RatingWidget extends StatelessWidget {
  final String title;
  final int rating;
  final bool isRating;
  final String description;

  const RatingWidget({
    Key? key,
    required this.title,
    this.rating = 0,
    required this.isRating,
    this.description = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment:
          isRating ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          '$title:',
          style: const TextStyle(
            fontFamily: "poppins",
            fontWeight: FontWeight.w600,
            fontSize: 22,
          ),
        ),
        const SizedBox(width: 4),
        if (isRating)
          Row(
            children: List.generate(
              5,
              (index) {
                if (index < rating) {
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
        if (!isRating)
          Expanded(
            child: Wrap(
              children: [
                Flexible(
                  child: Text(
                    description,
                    style: const TextStyle(
                      fontFamily: "poppins",
                      fontWeight: FontWeight.w400,
                      fontSize: 22,
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
