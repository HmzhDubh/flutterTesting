//import 'dart:html';

import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        title: Text('Matching Game'),
        backgroundColor: Colors.indigo[800],
      ),
      body: ImagePage(),
    ),
  ));
}

class ImagePage extends StatefulWidget {
  const ImagePage({super.key});

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  int leftImageNum = 1;
  int rightImageNum = 2;

  void changeImageNum() {
    leftImageNum = Random().nextInt(8) + 1;
    rightImageNum = Random().nextInt(8) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          leftImageNum == rightImageNum ? 'Congrats' : 'Try Again',
          style: TextStyle(
            color: Colors.white,
            fontSize: 40.0,
          ),
        ),
        Row(
          children: [
            Expanded(
              child: IconButton(
                iconSize: 200.0,
                onPressed: () {
                  debugPrint('leftButton');

                  setState(() {
                    changeImageNum();
                  });
                },
                icon: Image.asset('images/image-$leftImageNum.png'),
              ),
            ),
            Expanded(
              child: IconButton(
                iconSize: 200.0,
                onPressed: () {
                  print('rightButton');

                  setState(() {
                    changeImageNum();
                  });
                },
                icon: Image.asset('images/image-$rightImageNum.png'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
