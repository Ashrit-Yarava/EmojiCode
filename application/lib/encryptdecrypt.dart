import "package:EmojiCode/utils.dart";

String encryptText(String message) {
  var binaryStream = "";
  var i2e = getInt2Emoji();
  for (int i = 0; i < message.length; i++) {
    var number = message.codeUnitAt(i);
    if (number > 255) {
      return "Warning, character at index $i is not a supported character.";
    }

    var bin = number.toRadixString(2);
    while (bin.length < 8) {
      bin = "0" + bin;
    }
    binaryStream += bin;
  }
  var bins = encryptSplit(binaryStream);
  var emojis = "";
  for (int i = 0; i < bins.length; i++) {
    emojis += i2e[int.parse(bins[i], radix: 2)];
  }
  return emojis;
}

String decryptText(String message) {
  var binaryStream = "";
  var e2i = getEmoji2Int();

  message.runes.forEach((int rune) {
    var character = new String.fromCharCode(rune);
    if (e2i.containsKey(character) == false) {
      return "Warning, encrypted string has been tampered with.";
    }
    var bin = e2i[character].toRadixString(2);
    while (bin.length < 7) {
      bin = "0" + bin;
    }
    binaryStream += bin;
  });
  var bins = decryptSplit(binaryStream);
  var textMessage = "";
  for (int i = 0; i < bins.length; i++) {
    textMessage += String.fromCharCode(int.parse(bins[i], radix: 2));
  }
  return textMessage;
}
