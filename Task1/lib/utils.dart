var validate = (String text) {
  if (text.contains(RegExp(r'[0-9]'))) {
    return "Numbers exception";
  } else if (text.contains(' ')) {
    return "Space exception";
  } else if (text[0].contains(RegExp(r'[a-z]'))) {
    return "Lowercase exception";
  }

  return "OK";
};
