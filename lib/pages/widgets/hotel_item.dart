import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hayy_hotelio_app/shared/app_format.dart';
import 'package:hayy_hotelio_app/shared/styles.dart';

class HotelItem extends StatelessWidget {
  final String imgUrl;
  final String name;
  final double price;
  final double rating;
  final VoidCallback? onTap;
  const HotelItem({
    super.key,
    required this.imgUrl,
    required this.name,
    required this.price,
    required this.rating,
    this.onTap,
  });

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
            Container(
              height: 180,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                image: DecorationImage(
                  image: AssetImage(imgUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Hotel information
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  // Hotel name and price
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Hotel name
                        Text(
                          name,
                          style: blackTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: semiBold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        // Hotel price/night
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Start from ',
                                style: grayTextStyle,
                              ),
                              TextSpan(
                                text: AppFormat.currency(price),
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
                  ),
                  // Hotel rating
                  RatingBar.builder(
                    initialRating: rating,
                    itemPadding: const EdgeInsets.only(left: 5),
                    minRating: 0,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    ignoreGestures: true,
                    itemSize: 16,
                    unratedColor: lightGrayColor,
                    itemBuilder: (context, index) {
                      return Image.asset('assets/icons/ic_star_on.png');
                    },
                    onRatingUpdate: (value) {},
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
