package assets

import (
	"fmt"
	"strconv"
)

func decryptTable() map[string]int {
	e2i := make(map[string]int)
	currentNum := 0
	emojis := getEmojis()

	for _, emoji := range emojis {
		e2i[string(emoji)] = currentNum
		currentNum++
	}

	return e2i
}

func decryptStream(numbers []int) (stream string) {
	for _, number := range numbers {
		stream += fmt.Sprintf("%0.07b", int(number))
	}
	return
}

func decryptSplit(stream string) (bins []string) {

	current := ""

	for _, bin := range stream {
		if len(current) < 8 {
			current += string(bin)
		} else {
			bins = append(bins, current)
			current = string(bin)
		}
	}
	return
}

func Decode(message string) string {

	e2i := decryptTable()
	var numbers []int

	for _, emoji := range message {
		numbers = append(numbers, e2i[string(emoji)])
	}
	binaryStream := decryptStream(numbers)
	bins := decryptSplit(binaryStream)

	decryptedMessage := ""

	for _, bin := range bins {
		i, _ := strconv.ParseInt(string(bin), 2, 64)
		decryptedMessage += string(int(i))
	}

	return decryptedMessage
}
