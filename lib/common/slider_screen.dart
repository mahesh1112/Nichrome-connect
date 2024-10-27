import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({super.key});

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  List imageList = [
    {"id": 1, "image_path": 'assets/images/DOIT-Banner.jpeg'},
    {"id": 2, "image_path": 'assets/images/vertical-cartoner.jpeg'},
    {"id": 3, "image_path": 'assets/images/mini-dairy-plant4.jpeg'},
    {"id": 4, "image_path": 'assets/images/ilkCratingSolution3.jpeg'},
    {"id": 5, "image_path": 'assets/images/excel-400-plus-cgw-filler.jpeg'},
    {"id": 6, "image_path": 'assets/images/Athena-tray-sealer.jpeg'}
  ];
  final CarouselSliderController carouselController = CarouselSliderController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
        Stack(
          children: [
            InkWell(
              onTap: () {
                print(currentIndex);
              },
              child: CarouselSlider(
                items: imageList
                    .map(
                      (item) => Padding(
                        padding: const EdgeInsets.all(16),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                    item['image_path'],
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                        ),
                      ),
                )
                    .toList(),
                carouselController: carouselController,
                options: CarouselOptions(
                  scrollPhysics: const BouncingScrollPhysics(),
                  autoPlay: true,
                  aspectRatio: 2,
                  viewportFraction: 1,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imageList.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => carouselController.animateToPage(entry.key),
                    child: Container(
                      width: currentIndex == entry.key ? 17 : 7,
                      height: 7.0,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 3.0,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: currentIndex == entry.key
                              ? Colors.red
                              : Colors.blue),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ]
    );
  }
}

/*Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    CarouselSlider(
                        options: CarouselOptions(
                          viewportFraction: 1,
                          autoPlay: true,
                          enableInfiniteScroll: true,
                          autoPlayAnimationDuration: Duration(seconds: 3),
                          enlargeCenterPage: true,
                        ),
                      items: [
                      Container(
                        decoration:
                            BoxDecoration(borderRadius: BorderRadius.circular(16)),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: const Image(
                              image: AssetImage("assets/images/machine1.jpg"),
                            )),
                      ),
                      Container(
                        decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(16)),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: const Image(
                              image: AssetImage("assets/images/machine2.jpg"),
                            )),
                      ),
                      Container(
                        decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(16)),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: const Image(
                              image: AssetImage("assets/images/machine3.jpg"),
                            )),
                      ),
                      Container(
                        decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(16)),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: const Image(
                              image: AssetImage("assets/images/machine4.jpg"),
                            )),
                      ),
                      Container(
                        decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(16)),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: const Image(
                              image: AssetImage("assets/images/machine5.jpg"),
                            )),
                      ),
                    ], ),
                    SizedBox(height: 16,),
                    Row(
                      children: [
                        for (int i=0 ; i<6; i++)
                        Container(
                          width: 20,
                          height: 4,
                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.circular(20)),

                        ),
                      ],
                    )
                  ],
                ),

            )*/