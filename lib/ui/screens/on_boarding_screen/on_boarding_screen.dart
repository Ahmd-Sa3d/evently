import 'package:dots_indicator/dots_indicator.dart';
import 'package:evently/ui/screens/home_screen/home_screen.dart';
import 'package:evently/ui/screens/on_boarding_screen/intro_widget.dart';
import 'package:evently/ui/screens/on_boarding_screen/on_boarding_data.dart';
import 'package:evently/ui/utils/app_colors.dart';
import 'package:evently/ui/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingScreen extends StatefulWidget {
  static const String routeName = '/OnBoardingScreen';

  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController pageController = PageController();
  int currentPageIndex = 0;
  final int numberOfPAge = OnBoardingData.introScreen.length;

  void _onPageChanged() {
    setState(() {
      currentPageIndex = pageController.page?.round() ?? 0;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController(initialPage: 0);
    pageController.addListener(_onPageChanged);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.only(bottom: 44.h),
                  child: Image.asset(AppImages.eventlyLogo),
                ),
              ),
              Expanded(
                child: PageView.builder(
                  onPageChanged: (index) {
                    currentPageIndex = index;
                  },
                  controller: pageController,
                  itemCount: OnBoardingData.introScreen.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder:
                      (context, index) =>
                          IntroWidget(data: OnBoardingData.introScreen[index]),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 16.0, left: 16.0, top: 44.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Visibility(
                      visible: currentPageIndex == 0 ? false : true,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.lightBlue),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: IconButton(
                          onPressed: () {
                            if (currentPageIndex <= numberOfPAge) {
                              setState(() {
                                pageController.previousPage(
                                  duration: Duration(milliseconds: 350),
                                  curve: Curves.easeIn,
                                );
                              });
                            }
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: AppColors.lightBlue,
                          ),
                        ),
                      ),
                    ),
                    DotsIndicator(
                      dotsCount: OnBoardingData.introScreen.length,
                      position: currentPageIndex.toDouble(),
                      decorator: DotsDecorator(
                        activeColor: AppColors.lightBlue,
                        color: AppColors.darkGray,
                        size: const Size.square(9.0),
                        activeSize: const Size(20.0, 9.0),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.lightBlue),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: IconButton(
                        onPressed: () {
                          if (currentPageIndex < numberOfPAge - 1) {
                            pageController.nextPage(
                              duration: Duration(milliseconds: 350),
                              curve: Curves.easeIn,
                            );
                            setState(() {});
                          } else {
                            Navigator.pushReplacementNamed(
                              context,
                              HomeScreen.routeName,
                            );
                          }
                        },
                        icon: Icon(
                          Icons.arrow_forward,
                          color: AppColors.lightBlue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
