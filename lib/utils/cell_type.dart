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
