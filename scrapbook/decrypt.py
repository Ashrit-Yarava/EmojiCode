import argparse
parser = argparse.ArgumentParser(description="Decrypt the encoding string.")
parser.add_argument('emoji_code', help='Emojis.')
args = parser.parse_args()
emoji_code = args.emoji_code

def reverse_split(stream): # Convert 7 bit stream to bytes.
    bins = []
    current = ""
    for i in stream:
        if len(current) < 8:
            current += i
        else:
            bins.append(current)
            current = i
    return bins



a = ['0110100', '0011001', '0101101', '1000110', '1100011', '0111100', '1000010']
# [52, 25, 45, 70, 99, 60, 66]

emojis = open('../emoji-list.txt').read()
e2i = {u: i for i, u in enumerate(emojis)}

bins = [e2i[i] for i in emoji_code]
binary_stream  = ''.join(["{0:07b}".format(i) for i in bins])

byte = reverse_split(binary_stream)
ints = [int(i, base=2) for i in byte]

print(''.join([chr(i) for i in ints]))