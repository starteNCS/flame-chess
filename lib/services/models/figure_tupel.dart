import 'package:flutterwindows/util/enums/color.dart';
import 'package:flutterwindows/util/enums/figure.dart';

class FigureTupel {
  final Figure figure;
  final FigureColor color;

  FigureTupel(this.figure, this.color);

  static FigureTupel get whitePawn => FigureTupel(Figure.pawn, FigureColor.white);
  static FigureTupel get whiteRook => FigureTupel(Figure.rook, FigureColor.white);
  static FigureTupel get whiteKnight => FigureTupel(Figure.knight, FigureColor.white);
  static FigureTupel get whiteBishop => FigureTupel(Figure.bishop, FigureColor.white);
  static FigureTupel get whiteQueen => FigureTupel(Figure.queen, FigureColor.white);
  static FigureTupel get whiteKing => FigureTupel(Figure.king, FigureColor.white);

  static FigureTupel get blackPawn => FigureTupel(Figure.pawn, FigureColor.black);
  static FigureTupel get blackRook => FigureTupel(Figure.rook, FigureColor.black);
  static FigureTupel get blackKnight => FigureTupel(Figure.knight, FigureColor.black);
  static FigureTupel get blackBishop => FigureTupel(Figure.bishop, FigureColor.black);
  static FigureTupel get blackQueen => FigureTupel(Figure.queen, FigureColor.black);
  static FigureTupel get blackKing => FigureTupel(Figure.king, FigureColor.black);
}
