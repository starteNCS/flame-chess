enum FigureColor { white, black }

extension FigureColorExtension on FigureColor {
  String get pathName {
    switch (this) {
      case FigureColor.white:
        return 'white';
      case FigureColor.black:
        return 'black';
    }
  }

  double get movementDirection {
    switch (this) {
      case FigureColor.white:
        return 1;
      case FigureColor.black:
        return -1;
    }
  }
}
