import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/hotel_list_data.dart';
import 'hotel_app_theme.dart';

class SingleHotelCard extends StatelessWidget {
  final VoidCallback? callback;
  final HotelListData? hotelData;
  final AnimationController? animationController;
  final Animation<double>? animation;
  const SingleHotelCard(
      {Key? key,
      this.hotelData,
      this.animationController,
      this.animation,
      this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation!,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 50 * (1.0 - animation!.value), 0.0),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 24, right: 24, top: 8, bottom: 16),
              child: InkWell(
                splashColor: Colors.transparent,
                onTap: callback,
                // Hotel Widget
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.6),
                        offset: const Offset(4, 4),
                        blurRadius: 16,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                    child: Stack(
                      children: <Widget>[
                        // Hotel Info
                        Column(
                          children: <Widget>[
                            // Hotel Image
                            _image(),
                            // Hotel Details
                            Container(
                              color: HotelAppTheme.buildLightTheme()
                                  .colorScheme
                                  .background,
                              // Title, Location, Distance, Rating & Price
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  // Title, Location & Distance, Rating
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 16, top: 8, bottom: 8),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          // Title
                                          _title(),
                                          // Location & Distance
                                          _locationAndDistance(),
                                          // Rating
                                          _rating(),
                                        ],
                                      ),
                                    ),
                                  ),
                                  // Price & PerNight
                                  _priceAndPerNight(),
                                ],
                              ),
                            ),
                          ],
                        ),
                        // Favorite Icon
                        _favoriteIcon(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  _image() {
    return AspectRatio(
      aspectRatio: 2,
      child: Image.asset(
        hotelData!.imagePath,
        fit: BoxFit.cover,
      ),
    );
  }

  _title() {
    return Text(
      hotelData!.title,
      textAlign: TextAlign.left,
      style: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 22,
      ),
    );
  }

  _locationAndDistance() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          hotelData!.subTitle,
          style: TextStyle(fontSize: 14, color: Colors.grey.withOpacity(0.8)),
        ),
        const SizedBox(width: 4),
        Icon(
          FontAwesomeIcons.locationDot,
          size: 12,
          color: HotelAppTheme.buildLightTheme().primaryColor,
        ),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            '${hotelData!.distance.toStringAsFixed(1)} km to city',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 14, color: Colors.grey.withOpacity(0.8)),
          ),
        ),
      ],
    );
  }

  _rating() {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Row(
        children: <Widget>[
          RatingBar(
            initialRating: hotelData!.rating,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemSize: 24,
            ratingWidget: RatingWidget(
              full: Icon(
                Icons.star_rate_rounded,
                color: HotelAppTheme.buildLightTheme().primaryColor,
              ),
              half: Icon(
                Icons.star_half_rounded,
                color: HotelAppTheme.buildLightTheme().primaryColor,
              ),
              empty: Icon(
                Icons.star_border_rounded,
                color: HotelAppTheme.buildLightTheme().primaryColor,
              ),
            ),
            itemPadding: EdgeInsets.zero,
            onRatingUpdate: (rating) {
              // ignore: avoid_print
              print(rating);
            },
          ),
          Text(
            ' ${hotelData!.reviews} Reviews',
            style: TextStyle(fontSize: 14, color: Colors.grey.withOpacity(0.8)),
          ),
        ],
      ),
    );
  }

  _priceAndPerNight() {
    return Padding(
      padding: const EdgeInsets.only(right: 16, top: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(
            '\$${hotelData!.perNight}',
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
            ),
          ),
          Text(
            '/per night',
            style: TextStyle(fontSize: 14, color: Colors.grey.withOpacity(0.8)),
          ),
        ],
      ),
    );
  }

  _favoriteIcon() {
    return Positioned(
      top: 8,
      right: 8,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(32.0)),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.favorite_border,
              color: HotelAppTheme.buildLightTheme().primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
