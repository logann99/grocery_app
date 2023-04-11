import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

import '../provider/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _offerImagesList = [
    'assets/images/offers/Offer1.jpg',
    'assets/images/offers/Offer2.jpg',
    'assets/images/offers/Offer3.jpg',
    'assets/images/offers/Offer4.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    final themeState = utils.getTheme;
    Size size = utils.getScreenSize;
    return Scaffold(
      body: SizedBox(
        height: size.height * 0.33,
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return Image.asset(
              _offerImagesList[index],
              fit: BoxFit.fill,
            );
          },
          autoplay: true,
          itemCount: _offerImagesList.length,
          pagination: const SwiperPagination(
              alignment: Alignment.bottomCenter,
              builder: DotSwiperPaginationBuilder(
                  color: Colors.white, activeColor: Colors.red)),
          // control: const SwiperControl(color: Colors.black),
        ),
      ),
    );
  }
}
