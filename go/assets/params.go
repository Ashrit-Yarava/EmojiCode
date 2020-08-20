package assets

import (
	"fmt"
	"os"
)

func getEmojis() string {
	emojis := "😀😃😄😁😆😅🤣😂🙂🙃😉😊😇🥰😍🤩😘😗😚😙😋😛😜🤪😝🤑🤗🤭🤫🤔🤐🤨😐😑😶😏😒🙄😬🤥😌😔😪🤤😴😷🤒🤕🤢🤮🤧🥵🥶🥴😵🤯🤠🥳😎🤓🧐😕😟🙁😮😯😲😳🥺😦😧😨😰😥😢😭😱😖😣😞😓😩😫🥱😤😡😠🤬😈👿💀💩🤡👹👺👻👽👾🤖😺😸😹😻😼😽🙀😿😾💋👋🤚🖐✋🖖👌🤏🤞🤟🤘🤙👈👉👆🖕👇👍👎✊"
	return emojis
}

func printHelp() {
	fmt.Println(`usage: emojicode [-h] [--encrypt] [--decrypt] string

Encrypt and decrypt messages with emojis.
	
positional arguments:
  string         The message to encrypt/decrypt.
	
optional arguments:
  -h, --help     show this help message and exit
  --encrypt, -e  Whether to encrypt the message.
  --decrypt, -d  Whether to decrypt the message.`)
}

func checkValid() bool {
	args := os.Args[1:]

	if len(args) == 0 && len(args) != 1 {
		printHelp()
		return false
	}

	if len(args) != 2 && (args[0] != "-e" || args[0] != "--encrypt") && (args[0] != "-d" || args[0] != "--decrypt") {
		printHelp()
		return false
	} else {
		return true
	}

}

func GetConfig() (encode bool, message string) {
	err := checkValid()
	if err != true {
		os.Exit(0)
	}
	if os.Args[1] == "-e" || os.Args[1] == "--encrypt" {
		encode = true
		message = os.Args[2]
	} else {
		encode = false
		message = os.Args[2]
	}
	return
}
