import 'package:flutter/material.dart';
import 'package:moviebook/responsive/responsivesize.dart';
import 'package:moviebook/view/loginpages/Signin.dart';

import '../loginpages/widgets.dart';

class SplashcreenView extends StatefulWidget {
  const SplashcreenView({super.key});

  @override
  State<SplashcreenView> createState() => _SplashcreenViewState();
}

class _SplashcreenViewState extends State<SplashcreenView> {
  @override
  void initState() {
    super.initState();
    _navigatetonextpage();
  }

  Future<void> _navigatetonextpage() async {
    await Future.delayed(const Duration(seconds: 4));
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const Signin(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: Sizing.width(40, context)),
                  child: const Moviebook(),
                ),
                SizedBox(
                  height: Sizing.width(600, context),
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                      "assets/gif/image_processing20210912-27056-y7stty.gif"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
