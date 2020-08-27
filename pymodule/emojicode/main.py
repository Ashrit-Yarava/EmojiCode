import argparse
from emojicode.assets import encrypt, decrypt

def parse_args():
    parser = argparse.ArgumentParser(description="Encrypt and decrypt messages with emojis.")
    parser.add_argument('--encrypt','-e', action='store_true', help="Whether to encrypt the message.")
    parser.add_argument('--decrypt', '-d', action='store_true', help="Whether to decrypt the message.")
    parser.add_argument('string', help="The message to encrypt/decrypt.")

    args = parser.parse_args()

    if args.encrypt == args.decrypt:
        print(f"usage: {parser.prog} [-h] [--encrypt] [--decrypt] string")
        print("Only one of --encrypt or --decrypt can be specified.")
        exit(1)
    return args

def main():
    args = parse_args()
    
    if args.encrypt:
        print(encrypt(args.string))
    elif args.decrypt:
        print(decrypt(args.string))
