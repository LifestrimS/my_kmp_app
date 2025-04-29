import 'package:flutter/material.dart';
import 'kmp_wrapper.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('KMP + Flutter Demo')),
        body: Center(
          child: FutureBuilder(
            future: KmpWrapper.getPlatformInfo(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!);
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}