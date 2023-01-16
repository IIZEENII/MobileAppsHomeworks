import 'package:card/widgets/my_app.dart';
import 'package:card/widgets/title_section.dart';
import 'package:carousel_slider/carousel_slider.dart'; //inyaccion de dependencia
import 'package:flutter/material.dart';

class MyAppState extends State<MyApp> {
  String _currentText = 'Click on the icons';

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL', 'Llamando...', () {
          setState(() {
            _currentText = 'Llamando';
          });
        }),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE', 'Buscando ruta...',
            () {
          setState(() {
            _currentText = 'Buscando ruta';
          });
        }),
        _buildButtonColumn(color, Icons.share, 'SHARE', 'Compartiendo...', () {
          setState(() {
            _currentText = 'Compartiendo';
          });
        }),
      ],
    );

    Widget textSection = Padding(
      padding: const EdgeInsets.all(32),
      child: Center(
        child: Text(
          _currentText, // utilizar la variable de estado para mostrar el texto
          softWrap: true,
        ),
      ),
    );

    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter layout demo'),
        ),
        body: ListView(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 240,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 2),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
              ),
              items: [
                Image.asset('images/lake.jpg'),
                Image.asset('images/forest.jpg'),
                Image.asset('images/mountain.jpg'),
              ],
            ),
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }

  Widget _buildButtonColumn(Color color, IconData icon, String label,
      String text, void Function() onPressed) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(icon, color: color),
          onPressed: onPressed,
        ),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
