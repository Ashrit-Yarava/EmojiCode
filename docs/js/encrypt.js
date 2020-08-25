// module "encrypt.mjs"
function getEncryptTable() {
    let emojis = "😀😃😄😁😆😅🤣😂🙂🙃😉😊😇🥰😍🤩😘😗😚😙😋😛😜🤪😝🤑🤗🤭🤫🤔🤐🤨😐😑😶😏😒🙄😬🤥😌😔😪🤤😴😷🤒🤕🤢🤮🤧🥵🥶🥴😵🤯🤠🥳😎🤓🧐😕😟🙁😮😯😲😳🥺😦😧😨😰😥😢😭😱😖😣😞😓😩😫🥱😤😡😠🤬😈👿💀💩🤡👹👺👻👽👾🤖😺😸😹😻😼😽🙀😿😾💋👋🤚🖐✋🖖👌🤏🤞🤟🤘🤙👈👉👆🖕👇👍👎✊"
    let i2e = new Map()
    let index = 0
    for(var emoji of emojis) {
        i2e.set(index, emoji)
        index++
    }
    return i2e
}

function split(binaryStream) {
    let bins = []
    let current = ""

    for(let index in binaryStream) {
        if(current.length < 7){
            current += binaryStream[index]
        } else {
            bins.push(current)
            current = binaryStream[index]
        }
    }

    while(current.length < 7) {
        current += "0"
    }
    bins.push(current)
    return bins
}

function convertToByte(number) {
    bin = number.toString(2)
    if(bin.length > 8) {
        return;
    } else {
        while(bin.length < 8) {
            bin = "0" + bin
        }
    }
    return bin
}

function encryptText(message) {
    let binaryStream = ""
    for(let index in message) {
        let number = message.charCodeAt(index)
        console.log(number)
        binaryStream += convertToByte(number)
    }
    bins = split(binaryStream)
    let emojis = ""
    let i2e = getEncryptTable()
    for(var index in bins) {
        let number = parseInt(bins[index], 2)
        emojis += i2e.get(number)
    }
    return emojis
}