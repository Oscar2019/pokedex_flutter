extension StringExtension on String {
  String capitalize() {
    if(length == 1){
      return toUpperCase();
    } else if(length > 1){
      return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
    }
    return this;
  }
}