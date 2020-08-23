function split(stream) {
    let bins = []
    let current = ""

    for(let x in stream) {
        if(current.length < 7) {
            current += x
        } else {
            bins.push(current)
            current = x
        }
    }

    while(current.length < 7) {
        current += "0"
    }
    bins.push(current)

    return bins
}

function convertToNumbers(message) {
    let numbers = []
    for(let i = 0;i < message.length; i++) {
        numbers.push(message.charCodeAt(i))
    }
    return numbers
}

function getEncryptionTable() {
    let emojis = "😀😃😄😁😆😅🤣😂🙂🙃😉😊😇🥰😍🤩😘😗😚😙😋😛😜🤪😝🤑🤗🤭🤫🤔🤐🤨😐😑😶😏😒🙄😬🤥😌😔😪🤤😴😷🤒🤕🤢🤮🤧🥵🥶🥴😵🤯🤠🥳😎🤓🧐😕😟🙁😮😯😲😳🥺😦😧😨😰😥😢😭😱😖😣😞😓😩😫🥱😤😡😠🤬😈👿💀💩🤡👹👺👻👽👾🤖😺😸😹😻😼😽🙀😿😾💋👋🤚🖐✋🖖👌🤏🤞🤟🤘🤙👈👉👆🖕👇👍👎✊"
    let i2e = new Map()
    let index = 0
    for(let emoji in emojis) {
        i2e[index] = emoji
    }
    return i2e
}

function encrypt(message) {
    console.log(message)
    numbers = convertToNumbers(message)
    
}