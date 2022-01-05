import 'dart:async';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:news/pages/screens.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  double height;
  double width;
  final pageViewController = PageController(initialPage: 0);
  int currentPage = 0;
  DateTime currentBackPressTime;

  @override
  void initState() {
    super.initState();
    Timer.periodic(
      const Duration(seconds: 5),
      (Timer time) {
        if (currentPage < 3) {
          currentPage++;
        } else {
          currentPage = 0;
        }
        pageViewController.animateToPage(
          currentPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    pageViewController.dispose();
  }

  onChanged(int index) {
    setState(() {
      currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/bg.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              whiteColor.withOpacity(0.9),
              whiteColor.withOpacity(0.8),
              whiteColor.withOpacity(0.6),
              whiteColor.withOpacity(0.5),
              whiteColor.withOpacity(0.3),
              whiteColor.withOpacity(0.1),
            ],
          ),
        ),
        child: WillPopScope(
          onWillPop: () async {
            bool backStatus = onWillPop();
            if (backStatus) {
              exit(0);
            }
            return false;
          },
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: PageView(
                      controller: pageViewController,
                      scrollDirection: Axis.horizontal,
                      onPageChanged: onChanged,
                      children: [
                        page1(),
                        page2(),
                        page3(),
                        page4(),
                      ],
                    ),
                  ),
                  pageIndicator(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
        msg: 'Press Back Once Again to Exit.',
        backgroundColor: primaryColor,
        textColor: whiteColor,
      );
      return false;
    } else {
      return true;
    }
  }

  pageIndicator() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        fixPadding * 2.0,
        0.0,
        fixPadding * 2.0,
        fixPadding * 2.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          currentPage != 3
              ? InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Signin()),
                  ),
                  child: Text(
                    'Skip',
                    style: whiteColor13BoldTextStyle,
                  ),
                )
              : Container(),
          SmoothPageIndicator(
            controller: pageViewController,
            count: 4,
            effect: const ExpandingDotsEffect(
              expansionFactor: 1.5,
              spacing: 5.0,
              dotWidth: 15.0,
              dotHeight: 4.0,
              strokeWidth: 1.5,
              dotColor: primaryColor,
              activeDotColor: whiteColor,
            ),
          ),
          currentPage == 3
              ? InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Signin()),
                  ),
                  child: Text(
                    'Done',
                    style: whiteColor13BoldTextStyle,
                  ),
                )
              : InkWell(
                  onTap: () {
                    setState(() {
                      currentPage++;
                    });
                    pageViewController.animateToPage(
                      currentPage,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: Text(
                    'Next',
                    style: whiteColor13BoldTextStyle,
                  ),
                ),
        ],
      ),
    );
  }

  page1() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        fixPadding * 2.0,
        fixPadding * 2.0,
        fixPadding * 2.0,
        fixPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(
            child: Text(
              'Welcome to INDIA Today News App',
              textAlign: TextAlign.center,
              style: primaryColor12MediumTextStyle,
            ),
          ),
          Image.asset(
            'assets/welcome.png',
            height: height * 0.40,
            width: width * 0.60,
          ),
          Text(
            'Thank you for download India Today News\nApp, enjoy this amazing app with\ncool features.',
            textAlign: TextAlign.center,
            style: whiteColor13MediumTextStyle,
          ),
        ],
      ),
    );
  }

  page2() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        fixPadding * 2.0,
        fixPadding * 2.0,
        fixPadding * 2.0,
        fixPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(
            child: Text(
              'Everything Organised here',
              textAlign: TextAlign.center,
              style: primaryColor12MediumTextStyle,
            ),
          ),
          Image.asset(
            'assets/content.png',
            height: height * 0.40,
            width: width * 0.60,
          ),
          Text(
            'You can find any content easily by using\ncategories,tags.',
            textAlign: TextAlign.center,
            style: whiteColor13MediumTextStyle,
          ),
        ],
      ),
    );
  }

  page3() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        fixPadding * 2.0,
        fixPadding * 2.0,
        fixPadding * 2.0,
        fixPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(
            child: Text(
              'Take your freedom',
              textAlign: TextAlign.center,
              style: primaryColor12MediumTextStyle,
            ),
          ),
          Image.asset(
            'assets/subscribe.png',
            height: height * 0.40,
            width: width * 0.60,
          ),
          Text(
            'Subscribe with a small price, and take\nyour freedom by remove all ads.',
            textAlign: TextAlign.center,
            style: whiteColor13MediumTextStyle,
          ),
        ],
      ),
    );
  }

  page4() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        fixPadding * 2.0,
        fixPadding * 2.0,
        fixPadding * 2.0,
        fixPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(
            child: Text(
              'Save articles for later',
              textAlign: TextAlign.center,
              style: primaryColor12MediumTextStyle,
            ),
          ),
          Image.asset(
            'assets/bookmark.png',
            height: height * 0.40,
            width: width * 0.60,
          ),
          Text(
            'Hit the bookmark icon on any article to\nsave for later.',
            textAlign: TextAlign.center,
            style: whiteColor13MediumTextStyle,
          ),
        ],
      ),
    );
  }
}
