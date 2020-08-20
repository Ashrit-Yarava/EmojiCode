package assets

import (
	"fmt"
	"strconv"
)

func encryptTable() map[int]string {
	emojis := getEmojis()
	i2e := make(map[int]string)
	currentNum := 0
	for _, emoji := range emojis {
		i2e[int(currentNum)] = string(emoji)
		currentNum++
	}
	return i2e
}

func encryptSplit(binaryStream string) []string {
	var bins []string
	current := ""

	for _, i := range binaryStream {
		if len(current) < 7 {
			current += string(i)
		} else {
			bins = append(bins, current)
			current = string(i)
		}
	}
	for len(current) < 7 {
		current += "0"
	}
	bins = append(bins, current)
	return bins
}

func encryptGetStream(numbers []int) (stream string) {
	for _, i := range numbers {
		stream += fmt.Sprintf("%0.08b", int(i))
	}
	return
}

func Encode(message string) string {
	var numbers []int

	for _, i := range message {
		numbers = append(numbers, int(i))
	}
	binaryStream := encryptGetStream(numbers)
	bins := encryptSplit(binaryStream)

	emojis := ""
	i2e := encryptTable()
	for _, bin := range bins {
		i, _ := strconv.ParseInt(string(bin), 2, 64)
		emojis += i2e[int(i)]
	}

	return emojis
}
