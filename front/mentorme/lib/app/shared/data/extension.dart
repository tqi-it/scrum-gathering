extension StringsExtensions on String {
  String get capitalizeFirstofEach {
    final value = this;

    return value
        .split(' ')
        .map(
          (str) => '${str[0].toUpperCase()}${str.substring(1).toLowerCase()}',
    ).join(' ');
  }

}