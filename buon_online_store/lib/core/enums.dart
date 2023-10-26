enum Categories {
  shirt('shirt'),
  cup('cup'),
  polaroid('polaroid'),
  keyChain('keyChain'),
  mobileSkin('mobileSkin');

  const Categories(this.type);
  final String type;
}

extension ConvertSeason on String {
  Categories toSeasonEnum() {
    switch (this) {
      case 'shirt':
        return Categories.shirt;
      case 'cup':
        return Categories.cup;
      case 'polaroid':
        return Categories.polaroid;
      case 'keyChain':
        return Categories.keyChain;
      case 'mobileSkin':
        return Categories.mobileSkin;
      default:
        return Categories.polaroid;
    }
  }
}
