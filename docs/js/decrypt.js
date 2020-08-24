function getDecryptTable() {
    let emojis = "😀😃😄😁😆😅🤣😂🙂🙃😉😊😇🥰😍🤩😘😗😚😙😋😛😜🤪😝🤑🤗🤭🤫🤔🤐🤨😐😑😶😏😒🙄😬🤥😌😔😪🤤😴😷🤒🤕🤢🤮🤧🥵🥶🥴😵🤯🤠🥳😎🤓🧐😕😟🙁😮😯😲😳🥺😦😧😨😰😥😢😭😱😖😣😞😓😩😫🥱😤😡😠🤬😈👿💀💩🤡👹👺👻👽👾🤖😺😸😹😻😼😽🙀😿😾💋👋🤚🖐✋🖖👌🤏🤞🤟🤘🤙👈👉👆🖕👇👍👎✊"
    let e2i = new Map()
    let index = 0
    for(let emoji of emojis) {
        e2i.set(emoji, index)
        index++
    }
    return e2i
}

function getBin(number) {
    let bin = number.toString(2)
    while(bin.length < 7) {
        bin = "0" + bin
    }
    return bin
}

function split(binaryStream) {
    let bins = []
    let current = ""
    for(let bin of binaryStream) {
        if(current.length < 8) {
            current += bin
        } else {
            bins.push(current)
            current = bin
        }
    }
    return bins
}

function decrypt(message) {
    let e2i = getDecryptTable()
    let binaryStream = ""
    for(let emoji of message) {
        let number = e2i.get(emoji)
        binaryStream += getBin(number)
    }
    let bytes = split(binaryStream)
    let text = ""
    for(let byte of bytes) {
        number = parseInt(byte, 2)
        text += String.fromCharCode(number)
    }
    return text
}