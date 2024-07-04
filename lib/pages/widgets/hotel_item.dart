import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hayy_hotelio_app/models/hotel_model.dart';
import 'package:hayy_hotelio_app/shared/styles.dart';

class HotelItem extends StatelessWidget {
  final HotelModel hotel;
  final VoidCallback? onTap;

  const HotelItem({super.key, required this.hotel, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 24),
        width: double.infinity,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            // Hotel cover
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              child: Container(
                height: 180,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(hotel.cover!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // Hotel information
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Hotel name
                      Text(
                        hotel.name!,
                        style: blackTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      // Price/night
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Start from ',
                              style: grayTextStyle,
                            ),
                            TextSpan(
                              text: '\$${hotel.price}',
                              style: grayTextStyle.copyWith(
                                color: darkGrayColor,
                                fontWeight: semiBold,
                              ),
                            ),
                            TextSpan(
                              text: '/night',
                              style: grayTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  // Hotel rating
                  RatingBar.builder(
                    minRating: 0,
                    maxRating: 5,
                    initialRating: hotel.rate!,
                    itemSize: 16,
                    itemPadding: const EdgeInsets.only(right: 4),
                    allowHalfRating: true,
                    ignoreGestures: true,
                    unratedColor: lightGrayColor,
                    itemBuilder: (context, index) {
                      return Image.asset(
                        'assets/icons/ic_star_on.png',
                      );
                    },
                    onRatingUpdate: (value) {},
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
