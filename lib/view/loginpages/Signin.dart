import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviebook/responsive/responsivesize.dart';
import 'package:moviebook/view/homepagescreen/mainhomepage.dart';
import 'package:moviebook/view/loginpages/Signup.dart';
import 'package:moviebook/view/loginpages/passwordprovider.dart';
import 'package:moviebook/view/loginpages/widgets.dart';

class Signin extends ConsumerWidget {
  const Signin({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final passwordstate = ref.read(passwordprovider.notifier);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 249, 245, 245),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: Sizing.width(30, context)),
              child: Column(
                children: [
                  const Row(
                    children: [
                      BackButton(),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: Sizing.width(50, context),
                    ),
                    child: SizedBox(
                      child: Image.asset(
                        "assets/loginimages/47-475951_a-graphical-icon-of-a-pink-video-camera.png",
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: Sizing.height(20, context),
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Login",
                          style: TextStyle(
                              fontSize: Sizing.width(34, context),
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  const Heightbetween(width: 50),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.email_outlined,
                        color: Colors.black38,
                        size: Sizing.width(28, context),
                      ),
                      const Gapbetween(width: 10),
                      SizedBox(
                        height: Sizing.width(30, context),
                        width: Sizing.width(280, context),
                        child: Emailfield(),
                      ),
                    ],
                  ),
                  const Heightbetween(width: 40),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.lock_outline_rounded,
                        color: Colors.black38,
                        size: Sizing.width(28, context),
                      ),
                      const Gapbetween(width: 10),
                      SizedBox(
                        height: Sizing.width(30, context),
                        width: Sizing.width(280, context),
                        child: Passwordfield(passwordstate: passwordstate),
                      ),
                    ],
                  ),
                  const Heightbetween(width: 18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      bluetext(
                        text1: "Forgot Password?",
                      ),
                    ],
                  ),
                  const Heightbetween(width: 28),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MainHomePage(),
                          ));
                    },
                    child: const Bluebutton(
                      text1: "Login",
                    ),
                  ),
                  const Heightbetween(width: 30),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Line(),
                      Greytext(
                        text1: "OR",
                      ),
                      Line(),
                    ],
                  ),
                  const Heightbetween(width: 30),
                  Container(
                    height: Sizing.width(48, context),
                    width: Sizing.width(340, context),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(26, 41, 35, 35),
                        borderRadius:
                            BorderRadius.circular(Sizing.width(16, context))),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: Sizing.width(30, context)),
                        child: Row(
                          children: [
                            SizedBox(
                              height: Sizing.width(40, context),
                              width: Sizing.width(40, context),
                              child:
                                  Image.asset("assets/loginimages/7611770.png"),
                            ),
                            const Gapbetween(width: 30),
                            Text(
                              "Login with Google",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: Sizing.width(18, context),
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Heightbetween(width: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Greytext(
                        text1: "New to Logistics?",
                      ),
                      const Gapbetween(width: 8),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Signup(),
                                ));
                          },
                          child: bluetext(text1: "Register")),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
