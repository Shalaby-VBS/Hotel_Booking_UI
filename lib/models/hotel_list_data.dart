class HotelListData {
  HotelListData({
    this.imagePath = '',
    this.title = '',
    this.subTitle = "",
    this.distance = 1.8,
    this.reviews = 80,
    this.rating = 4.5,
    this.perNight = 180,
  });

  String imagePath;
  String title;
  String subTitle;
  double distance;
  double rating;
  int reviews;
  int perNight;

  static List<HotelListData> hotelList = <HotelListData>[
    HotelListData(
      imagePath: 'assets/images/hotel_1.png',
      title: 'Grand Royal Hotel',
      subTitle: 'Wembley, London',
      distance: 2.0,
      reviews: 80,
      rating: 4.4,
      perNight: 180,
    ),
    HotelListData(
      imagePath: 'assets/images/hotel_2.png',
      title: 'Queen Hotel',
      subTitle: 'Wembley, London',
      distance: 4.0,
      reviews: 74,
      rating: 4.5,
      perNight: 200,
    ),
    HotelListData(
      imagePath: 'assets/images/hotel_3.png',
      title: 'Grand Royal Hotel',
      subTitle: 'Wembley, London',
      distance: 3.0,
      reviews: 62,
      rating: 4.0,
      perNight: 60,
    ),
    HotelListData(
      imagePath: 'assets/images/hotel_4.png',
      title: 'Queen Hotel',
      subTitle: 'Wembley, London',
      distance: 7.0,
      reviews: 90,
      rating: 4.4,
      perNight: 170,
    ),
    HotelListData(
      imagePath: 'assets/images/hotel_5.png',
      title: 'Grand Royal Hotel',
      subTitle: 'Wembley, London',
      distance: 2.0,
      reviews: 240,
      rating: 4.5,
      perNight: 200,
    ),
  ];
}
