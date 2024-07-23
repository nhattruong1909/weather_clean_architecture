import 'package:intl/intl.dart';

extension ExtensionsOnDouble on double? {
  String? toWindSpeed() {
    if (this != null) {
      return '${toString()}km/h';
    }
    return null;
  }

  String? toCelsius() {
    if (this != null) {
      final NumberFormat numberFormat = NumberFormat('###.##', 'en_US');
      final double value = this! - 273.15;
      return '${numberFormat.format(value)}°';
    }
    return null;
  }
}

extension ExtensionsOnInt on int? {
  String? toKM() {
    if (this != null) {
      return '${(this! / 1000).round()}Km';
    }
    return null;
  }
}
