import 'package:flutter/material.dart';
import 'package:my_kmp_app/utils/cell_type.dart';
import 'package:my_kmp_app/utils/colors.dart';

import 'cell.dart';
import 'kmp_wrapper.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'KMP + Flutter Demo',
            style: TextStyle(color: AppColors.white),
          ),
          backgroundColor: AppColors.background,
        ),
        backgroundColor: AppColors.background,
        body: MainScreen(),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _textController = TextEditingController();
  bool clearNext = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 21.0, vertical: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: _textController,
            keyboardType: TextInputType.number,
            style: TextStyle(color: AppColors.white, fontSize: 24.0),
            decoration: InputDecoration(
              hintText: '0.0',
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.lightGrey),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.lightGrey),
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          Flexible(
            child: GridView.count(
              crossAxisCount: 4,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                GridCell(
                  type: CellType.clearing,
                  textController: _textController,
                ),
                GridCell(type: CellType.back, textController: _textController),
                GridCell(
                  type: CellType.percent,
                  textController: _textController,
                ),
                GridCell(
                  type: CellType.division,
                  textController: _textController,
                ),

                GridCell(type: CellType.seven, textController: _textController),
                GridCell(type: CellType.eight, textController: _textController),
                GridCell(type: CellType.nine, textController: _textController),
                GridCell(
                  type: CellType.multiplication,
                  textController: _textController,
                ),

                GridCell(
                  type: CellType.fourth,
                  textController: _textController,
                ),
                GridCell(type: CellType.five, textController: _textController),
                GridCell(type: CellType.six, textController: _textController),
                GridCell(
                  type: CellType.subtraction,
                  textController: _textController,
                ),

                GridCell(type: CellType.one, textController: _textController),
                GridCell(type: CellType.two, textController: _textController),
                GridCell(type: CellType.three, textController: _textController),
                GridCell(
                  type: CellType.addition,
                  textController: _textController,
                ),

                GridCell(type: CellType.empty, textController: _textController),
                GridCell(type: CellType.zero, textController: _textController),
                GridCell(type: CellType.comma, textController: _textController),
                GridCell(
                  type: CellType.equally,
                  textController: _textController,
                ),
              ],
            ),
          ),
          FutureBuilder(
            future: KmpWrapper.getPlatformInfo(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!);
              }
              return const CircularProgressIndicator();
            },
          ),
        ],
      ),
    );
  }
}
