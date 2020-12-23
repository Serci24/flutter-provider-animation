import 'package:animation_with_provider/models/animationModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnimationWidget extends StatefulWidget {
  @override
  _AnimationWidgetState createState() => _AnimationWidgetState();
}

class _AnimationWidgetState extends State<AnimationWidget>
    with SingleTickerProviderStateMixin {
  // _controller diye animasyonu kontrol etmek için kontrol nesnesi oluşturduk.
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    print("initState tetiklendi ");
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
      lowerBound: 10,
      upperBound: 100,
    );
    _controller.forward();
    if (_controller.status == AnimationStatus.forward) {
      print("Animasyon başladı ! ");
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies methodu tetiklendi !");
    var myPro2 = Provider.of<AnimationModel>(context);
    _controller.addListener(() {
      // burada get value fonksiyonu initState'te çalıştırılmış misali kullanılıyor.
      // listener animasyonu tetikleyen ana faktör !
      // burada _controller nesnesinin değerini alıp, notifierListener() methodunu tetikliyoruz model sınıfımızda !
      myPro2.getValue(_controller.value);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Büyütülecek metin !",
          style: TextStyle(
            fontSize: _controller.value,
          ),
        ),
        Container(
          height: _controller.value,
          width: 50,
          color: Colors.red,
        ),
      ],
    );
  }
}
