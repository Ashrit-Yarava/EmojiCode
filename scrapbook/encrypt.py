"""
# Encoding
1. Convert given text to its numerical representation.
2. Convert numerical representation into binary.
3. Split binary stream into 7 bits.
4. Convert 7 bit numbers into ints.
5. Use conversion table to convert to emoji.
"""

import argparse
parser = argparse.ArgumentParser(description="Encrypt stuff...")
parser.add_argument('string', help="Text to encode.")
args = parser.parse_args()

emojis = open('../emoji-list.txt').read()
i2e = {i: u for i, u in enumerate(emojis)}
text = args.string
numbers = [ord(i) for i in text]
binary_stream = ''.join(["{0:08b}".format(i) for i in numbers])

def split(stream):
    bins = []
    current = ""
    for i in stream:
        if len(current) < 7:  # Change number to modify size. Current is 2^7 which is 128.
            current += i
        else:
            bins.append(current)
            current = i
    if current != "":
        while len(current) != 7: # Add zeroes.
            current += "0"
        bins.append(current) 
    return bins

bins = split(binary_stream)
bins = [int(i, base=2) for i in bins]
print(''.join([i2e[i] for i in bins]))