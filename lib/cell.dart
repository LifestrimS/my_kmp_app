import 'package:flutter/material.dart';
import 'package:my_kmp_app/utils/colors.dart';

import 'kmp_wrapper.dart';

class GridCell extends StatefulWidget {
  final CellType type;
  final TextEditingController textController;
  final VoidCallback? onTap;

  const GridCell({
    required this.type,
    required this.textController,
    this.onTap,
    super.key,
  });

  @override
  State<GridCell> createState() => _GridCellState();
}

class _GridCellState extends State<GridCell> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.cell,
      borderRadius: BorderRadius.circular(12.0),
      child: InkWell(
        splashColor: Colors.amber,
        borderRadius: BorderRadius.circular(12.0),
        onTap: () async {
          if (widget.onTap != null) {
            widget.onTap!();
          } else {
            action();
          }
        },
        child: Center(
          child: Text(widget.type.symbol, style: TextStyle(fontSize: 32.0)),
        ),
      ),
    );
  }

  void action() {
    switch (widget.type) {
      case CellType.one:
      case CellType.two:
      case CellType.three:
      case CellType.fourth:
      case CellType.five:
      case CellType.six:
      case CellType.seven:
      case CellType.eight:
      case CellType.nine:
      case CellType.zero:
        addSymbol();
      //return '0';
      case CellType.clearing:
      //return 'C';
      case CellType.back:
      //return '<-';
      case CellType.percent:
        addSymbol();
      case CellType.division:
        addSymbol();
      case CellType.multiplication:
        addSymbol();
      case CellType.subtraction:
        addSymbol();
      case CellType.addition:
        addSymbol();
      case CellType.comma:
        addSymbol();
      case CellType.equally:
        addSymbol();
      case CellType.empty:
      //return '';
    }
  }

  void addSymbol() async {
    String test = await KmpWrapper.addText(
      widget.type.symbol,
      widget.textController.text,
    );
    widget.textController.text = test;
  }
}

enum CellType {
  one('1'),
  two('2'),
  three('3'),
  fourth('4'),
  five('5'),
  six('6'),
  seven('7'),
  eight('8'),
  nine('9'),
  zero('0'),
  comma(','),
  addition('+'),
  subtraction('-'),
  multiplication('*'),
  division('/'),
  percent('%'),
  clearing('C'),
  back('<-'),
  empty(''),
  equally('=');

  const CellType(this.symbol);

  final String symbol;
}
