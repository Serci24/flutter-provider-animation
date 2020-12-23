import 'package:animation_with_provider/models/animationModel.dart';
import 'package:animation_with_provider/widgets/animationWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  AnimationController cont;

  @override
  Widget build(BuildContext context) {
    print("Ana build metod tetiklendi !");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          "Animasyon sayfası",
        ),
      ),
      body: Column(
        children: [
          ChangeNotifierProvider<AnimationModel>(
            create: (_) => AnimationModel(),
            child: AnimationWidget(),
          ),
        ],
      ),
    );
  }
}
