import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int currentIndex = 0;
  final CarouselSliderController carouselController =
      CarouselSliderController();

  List<String> titles = [
    "One App For Everyone",
    "Build Using Our Heart",
    "Let's Go",
  ];

  List<String> subTitles = [
    "Our system is helping all people in one system",
    "System that make use our heart",
    "We will guide you to where you wanted it too",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: CarouselSlider(
              items: [
                Image.asset(
                  'assets/1.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
                Image.asset(
                  'assets/2.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
                Image.asset(
                  'assets/3.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ],
              options: CarouselOptions(
                height: double.infinity,
                viewportFraction: 1,
                enableInfiniteScroll: false,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
              carouselController: carouselController,
            ),
          ),
          Positioned(
            bottom: 60,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      carouselController.animateToPage(2);
                    },
                    child: const Text('SKIP', style: TextStyle(fontSize: 18)),
                  ),
                  Row(
                    children: List.generate(
                      3,
                      (index) => Container(
                        width: 10,
                        height: 10,
                        margin: EdgeInsets.only(right: index < 2 ? 10 : 0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: currentIndex == index
                              ? Colors.blue
                              : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      if (currentIndex == 2) {
                        // TODO: Add navigation or finish onboarding
                      } else {
                        carouselController.animateToPage(currentIndex + 1);
                      }
                    },
                    child: const Text('NEXT', style: TextStyle(fontSize: 18)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
