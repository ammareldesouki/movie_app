import 'package:flutter/material.dart';
import 'package:movie_app/core/route/route_name.dart';
import 'package:movie_app/features/on_boarding/presentation/widgets/onboarding_container.dart';

import '../../../../core/constants/colors.dart';

class OnboardingScreen extends StatefulWidget {
  static const routName = '/boarding';

  const OnboardingScreen({super.key});
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  bool isLastPage = false;
  bool isFirstPage = true;

  final List<Widget> pages = [
    OnBoardingContainer(
      boardingnum: 1,
      title: "Personalize Your Experience",
      description:
          "Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.",
    ),
    OnBoardingContainer(
      boardingnum: 2,
      title: "Find Events That Inspire You",
      description:
          "Dive into a world of events crafted to fit your unique interests. Whether you're into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.",
    ),

    OnBoardingContainer(
      boardingnum: 3,
      title: "Effortless Event Planning",
      description:
          "Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.",
    ),

    OnBoardingContainer(
      boardingnum: 4,
      title: "Connect with Friends & Share Moments",
      description:
          "Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.",
    ),
    OnBoardingContainer(
      boardingnum: 5,
      title: "Connect with Friends & Share Moments",
      description:
          "Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.",
    ),
    OnBoardingContainer(
      boardingnum: 6,
      title: "Connect with Friends & Share Moments",
      description:
          "Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.",
    ),
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void goToAuth() {
    //   LocalStorgeServices.setBpol(LocalStorgeKey.isFirstTime, false);
    Navigator.pushReplacementNamed(context, RouteNames.login);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: pages.length,
            onPageChanged: (index) {
              setState(() {
                isFirstPage = index == 0;
                isLastPage = index == pages.length - 1;
              });
            },
            itemBuilder: (_, index) => pages[index],
          ),

          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
                color: isFirstPage ? Colors.black54 : Colors.black,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 32,
                  horizontal: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Create Watchlists",
                      style: Theme.of(
                        context,
                      ).textTheme.titleLarge!.copyWith(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),

                    Expanded(
                      child: Text(
                        "Save movies to your watchlist to keep track of what you want to watch next. Enjoy films in various qualities and genres.",
                        style: Theme.of(
                          context,
                        ).textTheme.titleMedium!.copyWith(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (isLastPage) {
                          goToAuth();
                        } else {
                          _controller.nextPage(
                            duration: Duration(milliseconds: 100),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      child: Text(
                        isLastPage ? "Finish" : "Next",
                        style: Theme.of(
                          context,
                        ).textTheme.titleMedium!.copyWith(color: Colors.black),
                      ),
                    ),
                    SizedBox(height: 16),
                    ?isFirstPage
                        ? null
                        : Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: TColors.primary),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ElevatedButton(
                              style: Theme.of(context).elevatedButtonTheme.style
                                  ?.copyWith(
                                    backgroundColor: WidgetStateProperty.all(
                                      Colors.transparent,
                                    ),
                                  ),
                              onPressed: () {
                                if (_controller.page! > 0) {
                                  _controller.previousPage(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  );
                                }
                              },
                              child: Text(
                                "Back",
                                style: Theme.of(context).textTheme.titleMedium!
                                    .copyWith(color: TColors.primary),
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
