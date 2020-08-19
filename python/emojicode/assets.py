# Get Conversion Tables from emojis.
def _get_tables():
    emojis = "😀😃😄😁😆😅🤣😂🙂🙃😉😊😇🥰😍🤩😘😗😚😙😋😛😜🤪😝🤑🤗🤭🤫🤔🤐🤨😐😑😶😏😒🙄😬🤥😌😔😪🤤😴😷🤒🤕🤢🤮🤧🥵🥶🥴😵🤯🤠🥳😎🤓🧐😕😟🙁😮😯😲😳🥺😦😧😨😰😥😢😭😱😖😣😞😓😩😫🥱😤😡😠🤬😈👿💀💩🤡👹👺👻👽👾🤖😺😸😹😻😼😽🙀😿😾💋👋🤚🖐✋🖖👌🤏🤞🤟🤘🤙👈👉👆🖕👇👍👎✊"
    i2e = {i: u for i, u in enumerate(emojis)}
    e2i = {u: i for i, u in enumerate(emojis)}
    return i2e, e2i

# Encryption Code.
# ----------------------

# Encryption Split.
def _e_split(stream):
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


def encrypt(message):
    """
    Arguments:
    message (str): The message to encrypt.
    """
    i2e, _ = _get_tables()
    numbers = [ord(i) for i in message]

    if max(numbers) > 255:
        print("Only byte representative characters are supported currently.")
        exit()
    
    binary_stream = ''.join(["{0:08b}".format(i) for i in numbers])    
    base7 = [int(i, base=2) for i in _e_split(binary_stream)]
    return ''.join(i2e[i] for i in base7)

# Decryption Code.
# ----------------------

def _d_split(stream):
    bins = []
    current = ""
    for i in stream:
        if len(current) < 8:
            current += i
        else:
            bins.append(current)
            current = i
    return bins


def decrypt(message):
    """
    Arguments:
    message (str): the emojis.
    """
    _, e2i = _get_tables()
    numbers = [e2i[i] for i in message]
    binary_stream = ''.join(["{0:07b}".format(i) for i in numbers])

    byts = _d_split(binary_stream)
    ints = [int(i, base=2) for i in byts]

    return ''.join([chr(i) for i in ints])