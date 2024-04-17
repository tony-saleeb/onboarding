import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late final PageController controller;
  int currentPageIndex = 0;
  bool _arabicPressed = false;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: currentPageIndex);
    controller.addListener(() {
      setState(() {
        currentPageIndex = controller.page!.round();
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _onArabicButtonPressed() {
    setState(() {
      _arabicPressed = true;
    });
    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        _arabicPressed = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: Color(0xffF7F6F6),
        title: Row(
          children: [
            InkWell(
              onTap: _onArabicButtonPressed,
              child: Text(
                "Arabic",
                style: TextStyle(
                  color: _arabicPressed
                      ? Color.fromARGB(133, 84, 104, 255)
                      : Color(0xff5467FF),
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
            )
          ],
        ),
        actions: [
          if (currentPageIndex == 0 || currentPageIndex == 1)
            InkWell(
              onTap: () => controller.animateToPage(2,
                  duration: Duration(milliseconds: 400),
                  curve: Curves.easeInOut),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Container(
                margin: EdgeInsets.only(right: 15),
                child: Text(
                  "Skip",
                  style: TextStyle(
                    color: Color(0xff5467FF),
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            )
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(top: 30),
        color: Color(0xffF7F6F6), //
        child: PageView(
          controller: controller,
          children: [
            // Pages
            // Page 1
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 75,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: Image.asset("lib/images/1.jpg"),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome to",
                        style: TextStyle(
                          fontSize: 32,
                          fontFamily: 'Montserrat-ExtraBold',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "The Aim Chemistry",
                        style: TextStyle(
                          color: Color(0xff5467FF),
                          fontSize: 32,
                          fontFamily: 'Montserrat-ExtraBold',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "We're excited you've joined us. Get ready to explore the captivating universe of chemistry with us.",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[700],
                          fontFamily: 'Montserrat-ExtraBold',
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            // Page 2
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: Image.asset("lib/images/2.jpg"),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Access our ",
                            style: TextStyle(
                              fontSize: 32,
                              fontFamily: 'Montserrat-ExtraBold',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "Videos",
                            style: TextStyle(
                              color: Color(0xff5467FF),
                              fontSize: 32,
                              fontFamily: 'Montserrat-ExtraBold',
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      ),
                      Text(
                        "Anytime, Anywhere",
                        style: TextStyle(
                          color: Color(0xff5467FF),
                          fontSize: 32,
                          fontFamily: 'Montserrat-ExtraBold',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "We're thrilled to have you here. Our platform is designed to make your educational journey.",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[700],
                          fontFamily: 'Montserrat-ExtraBold',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            // Page 3
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: Image.asset("lib/images/3.jpg"),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Try our Engaging",
                        style: TextStyle(
                          fontSize: 32,
                          fontFamily: 'Montserrat-ExtraBold',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "Interactive Quizzes",
                        style: TextStyle(
                          color: Color(0xff5467FF),
                          fontSize: 32,
                          fontFamily: 'Montserrat-ExtraBold',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "You're in for a treat! Our modules are crafted to make chemistry both engaging and easy to grasp.",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[700],
                          fontFamily: 'Montserrat-ExtraBold',
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          currentPageIndex == 2
              ? FadeInAnimatedButton()
              : Container(
                  color: Color(0xffF7F6F6),
                  height: MediaQuery.of(context).size.height * 0.10,
                  child: Container(
                    child: Row(
                      children: [
                        // left arrow button
                        Container(
                          width: MediaQuery.of(context).size.width * (1 / 3),
                          color: Colors.transparent,
                          child: currentPageIndex == 1
                              ? Container(
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 43, vertical: 18),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                          color: Color(0xff5467FF), width: 2),
                                    ),
                                    child: IconButton(
                                      onPressed: () => controller.previousPage(
                                        curve: Curves.easeIn,
                                        duration: Duration(milliseconds: 120),
                                      ),
                                      icon: Image.asset(
                                        "lib/icons/arrow-left.png",
                                        scale: 1.5,
                                        color: Color(0xff5467FF),
                                      ),
                                    ),
                                  ),
                                )
                              : null,
                        ),
                        // dots indicator
                        Container(
                          width: MediaQuery.of(context).size.width * (1 / 3),
                          color: Colors.transparent,
                          child: currentPageIndex == 0 || currentPageIndex == 1
                              ? Container(
                                  child: Container(
                                    child: Center(
                                      child: SmoothPageIndicator(
                                        controller: controller,
                                        count: 3,
                                        effect: ScrollingDotsEffect(
                                          activeDotScale: 1,
                                          dotHeight: 13,
                                          dotWidth: 13,
                                          spacing: 6,
                                          dotColor: Color(0xffccd1ff),
                                        ),
                                        onDotClicked: (index) =>
                                            controller.animateToPage(
                                          index,
                                          duration: Duration(milliseconds: 120),
                                          curve: Curves.easeIn,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : null,
                        ),
                        // right arrow
                        Container(
                          width: MediaQuery.of(context).size.width * (1 / 3),
                          color: Colors.transparent,
                          child: currentPageIndex == 0 || currentPageIndex == 1
                              ? Container(
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 44, vertical: 19),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Color(0xff5467FF),
                                    ),
                                    child: IconButton(
                                      onPressed: () => controller.nextPage(
                                        curve: Curves.easeIn,
                                        duration: Duration(milliseconds: 120),
                                      ),
                                      icon: Image.asset(
                                        "lib/icons/arrow-right.png",
                                        scale: 1.5,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )
                              : null,
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

class FadeInAnimatedButton extends StatefulWidget {
  @override
  _FadeInAnimatedButtonState createState() => _FadeInAnimatedButtonState();
}

class _FadeInAnimatedButtonState extends State<FadeInAnimatedButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Opacity(
          opacity: _animation.value,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 18),
            height: MediaQuery.of(context).size.height * 0.10,
            width: MediaQuery.of(context).size.width * 0.87,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                'Get Started',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff5467FF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
