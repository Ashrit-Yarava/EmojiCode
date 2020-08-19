# EmojiCode
---
> Base64-like encryption/decryption but with Emojis.

## Encoding
1. Convert given text to its numerical representation.
2. Convert numerical representation into binary.
3. Split binary stream into 7 bits.
4. Convert 7 bit numbers into ints.
5. Use conversion table to convert to emoji.

## Decoding
1. Use conversion table to convert emoji to int.
2. Convert int to binary stream
3. Split binary stream into bytes.
4. Convert bytes to numbers.
5. Convert numbers to text.