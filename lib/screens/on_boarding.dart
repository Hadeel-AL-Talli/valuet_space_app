import 'package:flutter/material.dart';
import 'package:valuet_space_app/widgets/on_boarding_content.dart';
import 'package:valuet_space_app/widgets/on_boarding_indicator.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  late PageController _pageController;
  int _currentpage = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: AlignmentDirectional.topEnd,
            child: Visibility(
              visible: _currentpage < 2,
              replacement: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/passwords_sreen');
                },
                child: Text('Start',
                    style: TextStyle(fontSize: 18, color: Colors.blue)),
              ),
              child: TextButton(
                onPressed: () => _pageController.animateToPage(2,
                    duration: Duration(seconds: 1), curve: Curves.easeInOut),
                child: Text('Skip',
                    style: TextStyle(fontSize: 18, color: Colors.blue)),
              ),
            ),
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(
                minWidth: 0,
                maxWidth: double.infinity,
                minHeight: 0,
                maxHeight: 500),
            child: PageView(
                controller: _pageController,
                scrollDirection: Axis.horizontal,
                onPageChanged: (value) {
                  setState(() {
                    _currentpage = value;
                    print(value);
                  });
                },
                children: [
                  OnBoardingContent(
                    imagepath: 'images/out2.png',
                    title: 'Welcome to valut app ',
                    subTitle:
                        'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam.',
                  ),
                  OnBoardingContent(
                    imagepath: 'images/out1.png',
                    title: 'Welcome to valut app',
                    subTitle:
                        ' Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam.',
                  ),
                  OnBoardingContent(
                    imagepath: 'images/out3.png',
                    title: 'Protect your social accounts',
                    subTitle: 'Only  you can see your personal data',
                  ),
                ]),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  _pageController.previousPage(
                      duration: Duration(seconds: 1), curve: Curves.easeInOut);
                },
                icon: Icon(Icons.arrow_back_ios),
                color: _currentpage > 0 ? Colors.blue : Colors.grey,
              ),
              Visibility(
                visible: _currentpage < 2,
                maintainAnimation: true,
                maintainState: true,
                maintainSize: true,
                child: IconButton(
                  onPressed: () {
                    _pageController.nextPage(
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeIn);
                  },
                  icon: Icon(Icons.arrow_forward_ios,
                      color: Colors.blue),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OnBoardingIndicator(
                marginEnd: 10,
                selected: _currentpage == 0,
              ),
              OnBoardingIndicator(
                marginEnd: 10,
                selected: _currentpage == 1,
              ),
              OnBoardingIndicator(
                selected: _currentpage == 2,
              )
            ],
          )
        ],
      ),
    );
  }
}
