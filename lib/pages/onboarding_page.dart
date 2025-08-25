import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int currentIndex = 0;
  CarouselSliderController carouselController = CarouselSliderController();
  
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
            bottom: 6,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
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

// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';

// class OnBoardingPage extends StatefulWidget {
//   const OnBoardingPage({super.key});

//   @override
//   State<OnBoardingPage> createState() => _OnBoardingPageState();
// }

// class _OnBoardingPageState extends State<OnBoardingPage> {
//   int currentIndex = 0;
//   CarouselSliderController carouselController = CarouselSliderController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(
//         children: [Center(
//           // child: Expanded(
//             child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               CarouselSlider(
//                 items: [
//                   Image.asset(
//                     'assets/1.png',
//                     fit: BoxFit.fill,
//                     width: double.infinity,
//                     height: double.infinity,
//                   ),
//                   Image.asset(
//                     'assets/2.png',
//                     fit: BoxFit.fill,
//                     width: double.infinity,
//                     height: double.infinity,
//                   ),
//                   Image.asset(
//                     'assets/3.png',
//                     fit: BoxFit.fill,
//                     width: double.infinity,
//                     height: double.infinity,
//                   ),
//                 ],
//                 options: CarouselOptions(
//                   height: MediaQuery.of(context).size.height - AppBar().preferredSize.height,
//                   viewportFraction: 1,
//                   enableInfiniteScroll: false,
//                   onPageChanged: (index, reason) {
//                     setState(() {
//                       currentIndex = index;
//                     });
//                   },
//                 ),
//                 carouselController: carouselController,
//               ),
//               const SizedBox(height: 60),
//               Container(
//                 margin: const EdgeInsets.symmetric(
//                   horizontal: 40,
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     TextButton(
//                       onPressed: () {
//                         carouselController.animateToPage(2);
//                       },
//                       child: const Text(
//                         'SKIP',
//                         style: TextStyle(
//                           fontSize: 18,
//                         ),
//                       ),
//                     ),
//                     Row(
//                       children: [
//                         Container(
//                           width: 10,
//                           height: 10,
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: currentIndex == 0 ? Colors.blue : Colors.grey,
//                           ),
//                         ),
//                         const SizedBox(width: 10),
//                         Container(
//                           width: 10,
//                           height: 10,
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: currentIndex == 1 ? Colors.blue : Colors.grey,
//                           ),
//                         ),
//                         const SizedBox(width: 10),
//                         Container(
//                           width: 10,
//                           height: 10,
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: currentIndex == 2 ? Colors.blue : Colors.grey,
//                           ),
//                         ),
//                       ],
//                     ),
//                     TextButton(
//                       onPressed: () {
//                         if (currentIndex == 2) {
//                         } else {
//                           carouselController.nextPage();
//                         }
//                       },
//                       child: const Text(
//                         'NEXT',
//                         style: TextStyle(
//                           fontSize: 18,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         // ),
//         ),
//       ]),
//     );
//   }
// }