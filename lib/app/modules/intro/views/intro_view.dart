import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/colors.dart';
import '../../../constants/dimensions.dart';
import '../../../routes/app_pages.dart';
import '../controllers/intro_controller.dart';

class IntroView extends GetView<IntroController> {
  List<Map<String, dynamic>> _items = [
    {
      "text": "Возьми свои доходы\n и расходы под контроль",
      "color": AppColors.RED,
    },
    {
      "text": "Учитывай все расходы,\n планируй бюджет каждый месяц заранее",
      "color": AppColors.BLUE,
    },
    {
      "text": "Ставь цели,\n пропиши действия,\n найди работу,\n копи деньги",
      "color": AppColors.GREEN,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: Dimensions.ITEM_INDENT,
          ),
          SvgPicture.asset(
            'assets/images/logo.svg',
            key: Key('logo'),
            height: 100.0,
            width: 100.0,
            // cacheColorFilter: true,
            // colorBlendMode: BlendMode.clear,
          ),
          Expanded(
            child: CarouselSlider(
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * .55,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                // onPageChanged: (){},
                scrollDirection: Axis.horizontal,
              ),
              items: _items.map((i) {
                return Builder(
                  builder: (context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                            color: i['color'] as Color,
                            borderRadius: BorderRadius.circular(
                                Dimensions.BORDER_RADIUS - 5)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              '${i["text"]}',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ));
                  },
                );
              }).toList(),
            ),
          ),
          ElevatedButton(
            child: Text('Начать'.toUpperCase()),
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(AppColors.RED)),
            onPressed: () async {
              var prefs = await SharedPreferences.getInstance();
              await prefs.setBool('seen', true);
              Get.toNamed(Routes.HOME);
            },
          ),
          const SizedBox(
            height: Dimensions.ITEM_INDENT,
          ),
        ],
      ),
    ));
  }
}
