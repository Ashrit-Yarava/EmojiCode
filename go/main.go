package main

import (
	"fmt"

	"github.com/Ashrit-Yarava/emojicode/assets"
)

func main() {
	option, message := assets.GetConfig()

	if option == true {
		fmt.Println(assets.Encode(message))
	} else {
		fmt.Println(assets.Decode(message))
	}

}
