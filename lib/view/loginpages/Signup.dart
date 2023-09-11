import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviebook/responsive/responsivesize.dart';
import 'package:moviebook/view/loginpages/passwordprovider.dart';
import 'package:moviebook/view/loginpages/widgets.dart';

class Signup extends ConsumerWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final passwordstate1 = ref.read(passwordprovider.notifier);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 249, 245, 245),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: Sizing.width(24, context)),
            child: Column(
              children: [
                const Row(
                  children: [
                    BackButton(),
                  ],
                ),
                Image.asset("assets/loginimages/6210134.png"),
                const Row(
                  children: [
                    Signintext(
                      text1: "Sign up",
                    ),
                  ],
                ),
                Heightbetween(width: Sizing.width(30, context)),
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
                      child: const Expanded(
                        child: Emailfield(),
                      ),
                    ),
                  ],
                ),
                const Heightbetween(width: 40),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.person,
                      color: Colors.black38,
                      size: Sizing.width(28, context),
                    ),
                    const Gapbetween(width: 10),
                    SizedBox(
                      height: Sizing.width(30, context),
                      width: Sizing.width(280, context),
                      child: const Expanded(
                        child: Namefield(),
                      ),
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
                      child: Expanded(
                        child: Passwordfield(passwordstate: passwordstate1),
                      ),
                    ),
                  ],
                ),
                const Heightbetween(width: 20),
                const Greytext(
                    text1:
                        "By signing you're agree to Terms & Conditions and Privacy Policy"),
                const Heightbetween(width: 20),
                const Bluebutton(text1: "Continue"),
                const Heightbetween(width: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Greytext(text1: "Joined us before?"),
                    Gapbetween(width: Sizing.width(10, context)),
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: bluetext(text1: "Login")),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
