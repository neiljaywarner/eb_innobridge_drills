import 'package:flutter/material.dart';
import 'package:wear/wear.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxWidth > 300) return PhoneApp();
            return Center(
              child: WatchShape(
                builder: (BuildContext context, WearShape shape, Widget? child) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Shape: ${shape == WearShape.round ? 'round' : 'square'}',
                      ),
                      child!,
                    ],
                  );
                },
                child: AmbientMode(
                  onUpdate: () {
                    setState(() {
                      print('updating ambient mode; rebuild.');

                    });
                  },
                  builder: (BuildContext context, WearMode mode, Widget? child) {
                    return Text(
                      'Mode: ${mode == WearMode.active ? 'Active' : 'Ambient'}',
                    );
                  },
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}

class PhoneApp extends StatelessWidget {
  const PhoneApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Phone app not watch app'));
  }
}