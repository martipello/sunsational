
extension StringExtension on String? {

  bool isNullOrEmpty() {
    return this == null || this?.isEmpty == true;
  }

  String capitalize() {
    if (this != null && this!.isNotEmpty) {
      return '${this![0].toUpperCase()}${this!.substring(1)}';
    } else {
      return '';
    }
  }

}
