class StringUtil {
  static List<int> parseString({
    required String string,
  }) =>
      string.substring(1, string.length - 1).split(',').map((String str) => int.parse(str)).toList();
}
