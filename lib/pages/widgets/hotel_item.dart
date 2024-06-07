import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hayy_hotelio_app/models/hotel_model.dart';
import 'package:hayy_hotelio_app/shared/shared_method.dart';
import 'package:hayy_hotelio_app/shared/style.dart';

class HotelItem extends StatelessWidget {
  final HotelModel hotel;
  final VoidCallback? onTap;
  const HotelItem({
    super.key,
    // required this.name,
    // required this.price,
    // required this.imgUrl,
    required this.hotel,
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
            // Hotel image
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              child: Container(
                height: 180,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(hotel.cover!),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Hotel name and price
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        hotel.name!,
                        style: blackTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: semiBold,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Start from ',
                              style: grayTextStyle,
                            ),
                            TextSpan(
                              text: AppFormat.currency(hotel.price!),
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
                      )
                    ],
                  ),
                  RatingBar.builder(
                    initialRating: hotel.rate!,
                    minRating: 0,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    ignoreGestures: true,
                    itemSize: 18,
                    unratedColor: lightGrayColor,
                    itemBuilder: (context, index) {
                      return Image.asset('assets/icons/ic_star_on.png');
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
