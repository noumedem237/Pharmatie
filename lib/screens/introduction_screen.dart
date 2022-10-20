import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:pharma/config/config.dart';
import 'package:pharma/screens/screens.dart';
import 'package:pharma/widgets/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({Key key}) : super(key: key);

  @override
  _IntroductionPageState createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  Future<void> _onIntroEnd(context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool('introIsdonne', true);
    pushNewPageRemoveUntil(HomeScreen(), context);
  }

  Widget _buildImage(String assetName, [double width = 550]) => Padding(
        padding: const EdgeInsets.all(12.0),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.asset('assets/image/$assetName', width: width)),
      );

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      globalFooter: InkWell(
        child: Container(
            color: Palette.primaryColor,
            height: 60.0,
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            child: Text('Allons-y tout de suite !',
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.greenAccent))),
        onTap: () => _onIntroEnd(context),
      ),
      pages: [
        PageViewModel(
          title: "Bienvenu sur E-Pharma",
          body: "E-Pharma Votre platoforme de pharmacie en ligne disponible.",
          image: _buildImage('i3.JPG'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Des produits pharmaceutique de quatlité.",
          body:
              "Tester et contrôler par des experts de laboratoire pour vous offrire une expérience unique avec E-Pharma",
          image: _buildImage('i6.JPG'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Avec E-Pharma ",
          body:
              "Consultez les différents prix de vos produits pharmaceutique directement sur votre smartphone à paritir de chez vous!",
          image: _buildImage('i2.JPG'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      skipFlex: 0,
      nextFlex: 0,
      next: const Icon(Icons.arrow_forward_outlined),
      done: const Text('Commencer',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.greenAccent)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(10.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
    );
  }
}
