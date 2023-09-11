import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviebook/view/homepagescreen/homescreenprovider.dart';
import 'package:moviebook/view/loginpages/passwordprovider.dart';

import '../../responsive/responsivesize.dart';

class Heightbetween extends StatelessWidget {
  const Heightbetween({super.key, required this.width});
  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Sizing.width(width, context),
    );
  }
}

class Gapbetween extends StatelessWidget {
  const Gapbetween({super.key, required this.width});
  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Sizing.width(width, context),
    );
  }
}

class bluetext extends StatelessWidget {
  bluetext({super.key, required this.text1});
  final String text1;
  @override
  Widget build(BuildContext context) {
    return Text(
      text1,
      style: TextStyle(
          color: Colors.blue[600],
          fontSize: Sizing.width(17, context),
          fontWeight: FontWeight.w700),
    );
  }
}

class Bluebutton extends StatelessWidget {
  const Bluebutton({super.key, required this.text1});
  final String text1;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Sizing.width(48, context),
      width: Sizing.width(340, context),
      decoration: BoxDecoration(
          color: Colors.blue[700],
          borderRadius: BorderRadius.circular(Sizing.width(16, context))),
      child: Center(
        child: Text(
          text1,
          style: TextStyle(
              color: Colors.white,
              fontSize: Sizing.width(18, context),
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

class Line extends StatelessWidget {
  const Line({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Sizing.width(140, context),
      child: Divider(
        color: Colors.black26,
        thickness: Sizing.width(1, context),
      ),
    );
  }
}

class Greytext extends StatelessWidget {
  const Greytext({super.key, required this.text1});
  final String text1;
  @override
  Widget build(BuildContext context) {
    return Text(
      text1,
      style: TextStyle(
        color: Colors.black38,
        fontSize: Sizing.width(16, context),
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

class Emailfield extends StatelessWidget {
  const Emailfield({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(fontSize: Sizing.width(20, context)),
      decoration: InputDecoration(
        hintText: "Email ID",
        hintStyle: TextStyle(
            fontSize: Sizing.width(19, context),
            fontWeight: FontWeight.w600,
            color: Colors.black45),
      ),
    );
  }
}

class Passwordfield extends ConsumerWidget {
  const Passwordfield({
    super.key,
    required this.passwordstate,
  });

  final StateController<bool> passwordstate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      obscureText: ref.watch(passwordprovider),
      style: TextStyle(fontSize: Sizing.width(20, context)),
      decoration: InputDecoration(
        hintText: "Password",
        hintStyle: TextStyle(
            fontSize: Sizing.width(19, context),
            fontWeight: FontWeight.w600,
            color: Colors.black45),
        suffixIcon: InkWell(
          onTap: () {
            passwordstate.state = !passwordstate.state;
          },
          child: Icon(
            passwordstate.state == true
                ? Icons.visibility_off
                : Icons.visibility,
            color: Colors.black38,
            size: Sizing.width(28, context),
          ),
        ),
      ),
    );
  }
}

class Backbutton extends StatelessWidget {
  const Backbutton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_rounded,
            color: Color.fromARGB(171, 0, 0, 0),
            size: Sizing.width(28, context),
          ),
        ),
      ],
    );
  }
}

class Signintext extends StatelessWidget {
  const Signintext({super.key, required this.text1});
  final String text1;
  @override
  Widget build(BuildContext context) {
    return Text(
      "Login",
      style: TextStyle(
          fontSize: Sizing.width(34, context), fontWeight: FontWeight.w700),
    );
  }
}

class Namefield extends StatelessWidget {
  const Namefield({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(fontSize: Sizing.width(20, context)),
      decoration: InputDecoration(
        hintText: "Full name",
        hintStyle: TextStyle(
            fontSize: Sizing.width(19, context),
            fontWeight: FontWeight.w600,
            color: Colors.black45),
      ),
    );
  }
}

class Moviebook extends StatelessWidget {
  const Moviebook({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "MoviE BOok",
      style: TextStyle(
          fontSize: Sizing.width(32, context),
          fontWeight: FontWeight.w700,
          color: Colors.pinkAccent),
    );
  }
}

class Selectedtext extends StatelessWidget {
  Selectedtext({super.key, required this.text1});
  final String text1;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Sizing.width(36, context),
      width: Sizing.width(94, context),
      decoration: BoxDecoration(
          color: Colors.pinkAccent,
          borderRadius: BorderRadius.circular(Sizing.width(20, context))),
      child: Center(
        child: Text(
          text1,
          style: TextStyle(
              color: Colors.white,
              fontSize: Sizing.width(18, context),
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

class Unselectedtext extends ConsumerWidget {
  Unselectedtext({super.key, required this.text1});
  final String text1;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final toggleswitch = ref.watch(toggleprovider);
    return Container(
      height: Sizing.width(34, context),
      width: Sizing.width(90, context),
      decoration: BoxDecoration(
          border: Border.all(
              width: Sizing.width(2, context),
              color: toggleswitch ? Colors.white60 : Colors.black54),
          borderRadius: BorderRadius.circular(Sizing.width(20, context))),
      child: Center(
        child: Text(
          text1,
          style: TextStyle(
              color: toggleswitch ? Colors.white60 : Colors.black54,
              fontSize: Sizing.width(18, context),
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

class MainScreenTitle extends ConsumerWidget {
  const MainScreenTitle({super.key, required this.text1});
  final String text1;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final toggleswitch = ref.watch(toggleprovider);
    return Text(
      text1,
      style: TextStyle(
          fontSize: Sizing.width(20, context),
          color:
              toggleswitch ? Color.fromARGB(207, 255, 255, 255) : Colors.black,
          fontFamily: "Rem"),
    );
  }
}

class Categorybartext extends ConsumerWidget {
  const Categorybartext({super.key, required this.text1});
  final text1;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final toggleswitch = ref.watch(toggleprovider);
    return Text(
      text1,
      style: TextStyle(
        color: toggleswitch ? Color.fromARGB(207, 255, 255, 255) : Colors.black,
        fontWeight: FontWeight.w600,
        fontSize: Sizing.width(17, context),
      ),
    );
  }
}

class Drawertext extends ConsumerWidget {
  Drawertext({super.key, required this.text1});
  final text1;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(
      text1,
      style: TextStyle(
          color: ref.watch(toggleprovider)
              ? Color.fromARGB(216, 255, 255, 255)
              : Colors.black,
          fontSize: Sizing.width(20, context),
          fontWeight: FontWeight.w600),
    );
  }
}

class Whiteline extends ConsumerWidget {
  const Whiteline({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final toggle = ref.watch(toggleprovider);
    return Divider(
      height: Sizing.width(30, context),
      thickness: Sizing.width(1, context),
      color: toggle ? Colors.white : Colors.black,
    );
  }
}

class toggletext extends StatelessWidget {
  const toggletext(
      {super.key, required this.toggleswitch, required this.text1});
  final text1;
  final bool toggleswitch;

  @override
  Widget build(BuildContext context) {
    return Text(
      text1,
      style: TextStyle(
          fontSize: Sizing.width(18, context),
          color:
              toggleswitch ? Color.fromARGB(207, 255, 255, 255) : Colors.black,
          fontWeight: FontWeight.w700),
    );
  }
}
