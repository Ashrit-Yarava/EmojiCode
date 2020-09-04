String returnEmojis() {
  return "😀😃😄😁😆😅🤣😂🙂🙃😉😊😇🥰😍🤩😘😗😚😙😋😛😜🤪😝🤑🤗🤭🤫🤔🤐🤨😐😑😶😏😒🙄😬🤥😌😔😪🤤😴😷🤒🤕🤢🤮🤧🥵🥶🥴😵🤯🤠🥳😎🤓🧐😕😟🙁😮😯😲😳🥺😦😧😨😰😥😢😭😱😖😣😞😓😩😫🥱😤😡😠🤬😈👿💀💩🤡👹👺👻👽👾🤖😺😸😹😻😼😽🙀😿😾💋👋🤚🖐✋🖖👌🤏🤞🤟🤘🤙👈👉👆🖕👇👍👎✊";
}

Map getInt2Emoji() {
  var i2e = new Map();
  var emojis = returnEmojis();
  var index = 0;
  emojis.runes.forEach((int rune) {
    var character = new String.fromCharCode(rune);
    i2e[index] = character;
    index = index + 1;
  });

  return i2e;
}

Map getEmoji2Int() {
  var e2i = new Map();
  var emojis = returnEmojis();
  var index = 0;

  emojis.runes.forEach((int rune) {
    var character = new String.fromCharCode(rune);
    e2i[character] = index;
    index = index + 1;
  });

  return e2i;
}

List encryptSplit(String binaryStream) {
  var bins = <String>[];
  var current = "";
  for (int index = 0; index < binaryStream.length; index++) {
    if (current.length < 7) {
      current += binaryStream[index];
    } else {
      bins.add(current);
      current = binaryStream[index];
    }
  }
  while (current.length < 7) {
    current += "0";
  }
  bins.add(current);
  return bins;
}

List decryptSplit(String binaryStream) {
  var bins = <String>[];
  var current = "";
  for (int index = 0; index < binaryStream.length; index++) {
    if (current.length < 8) {
      current += binaryStream[index];
    } else {
      bins.add(current);
      current = binaryStream[index];
    }
  }
  return bins;
}
