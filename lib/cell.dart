import 'package:flutter/material.dart';
import 'package:my_kmp_app/utils/cell_type.dart';
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
      case CellType.empty:
        //addSymbol();
        changeText(widget.type.symbol);
      case CellType.clearing:
        clear();
      case CellType.back:
        deleteLast();

      case CellType.percent:
        //addSymbol();
        changeText(widget.type.symbol);
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
        //addSymbol();
        changeText(widget.type.symbol);
    }
  }

  void addSymbol() async {
    String test = await KmpWrapper.addText(
      widget.type.symbol,
      widget.textController.text,
    );
    widget.textController.text = test;
  }

  void clear() {
    setState(() {
      widget.textController.clear();
    });
  }

  void deleteLast() {
    setState(() {
      widget.textController.text = widget.textController.text.replaceRange(
        widget.textController.text.length - 1,
        null,
        '',
      );
    });
  }

  void changeText(String text) async {
    if (shouldClear() && !isSymbol(text)) {
      clear();
    }
    if (isHasSymbol(text)) return;
    setState(() {
      addSymbol();
    });
  }

  bool shouldClear() {
    return widget.textController.text.contains('=') ? true : false;
  }

  bool isHasSymbol(String text) {
    if (widget.textController.text.isEmpty && !isSymbol(text)) {
      return false;
    }
    String lastSymbol =
        widget.textController.text[widget.textController.text.length - 1];
    if ((widget.textController.text.contains('.') && text == '.') ||
        isSymbol(lastSymbol) && isSymbol(text)) {
      return true;
    }
    return false;
  }

  bool isSymbol(String text) {
    if (text == '+' ||
        text == '-' ||
        text == '*' ||
        text == '/' ||
        text == '%') {
      return true;
    }
    return false;
  }

  void equal() {
    setState(() {
      final first = widget.textController.text.substring(
        0,
        widget.textController.text.indexOf('+'),
      );
      final second = widget.textController.text.substring(
        widget.textController.text.indexOf('+'),
        null,
      );
      widget.textController.text =
          (double.parse(first) + double.parse(second)).toString();
    });
  }
}
