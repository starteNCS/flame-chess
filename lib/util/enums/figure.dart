enum Figure { pawn, rook, knight, bishop, queen, king }

extension FigureExtension on Figure {
  String get pathName {
    switch (this) {
      case Figure.pawn:
        return 'pawn';
      case Figure.rook:
        return 'rook';
      case Figure.knight:
        return 'knight';
      case Figure.bishop:
        return 'bishop';
      case Figure.queen:
        return 'queen';
      case Figure.king:
        return 'king';
    }
  }
}
