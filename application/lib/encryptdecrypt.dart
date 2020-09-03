import "package:EmojiCode/utils.dart";

String encryptText(String message) {
  var binaryStream = "";
  var i2e = getInt2Emoji();
  for (int i = 0; i < message.length; i++) {
    var number = message.codeUnitAt(i);
    var bin = number.toRadixString(2);
    while(bin.length < 8) {
        bin = "0" + bin;
    }
    binaryStream += bin;
  }
  var bins = encryptSplit(binaryStream);
  var emojis = "";
  for(int i = 0; i < bins.length; i++) {
    emojis += i2e[int.parse(bins[i], radix: 2)];
  }
  return emojis;
}

String decryptText(String message) {
  return message;
}
