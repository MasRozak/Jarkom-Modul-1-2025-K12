#!/bin/bash
source ./function.sh

download 1PWxEBqlnWzRYx9yv8vI6ZXoYfEJ-fT62 hiddenmsg.zip

#elite ball knowledge
declare -A usb_codes=(
    ["0x04"]="a A" ["0x05"]="b B" ["0x06"]="c C" ["0x07"]="d D" ["0x08"]="e E" ["0x09"]="f F"
    ["0x0A"]="g G" ["0x0B"]="h H" ["0x0C"]="i I" ["0x0D"]="j J" ["0x0E"]="k K" ["0x0F"]="l L"
    ["0x10"]="m M" ["0x11"]="n N" ["0x12"]="o O" ["0x13"]="p P" ["0x14"]="q Q" ["0x15"]="r R"
    ["0x16"]="s S" ["0x17"]="t T" ["0x18"]="u U" ["0x19"]="v V" ["0x1A"]="w W" ["0x1B"]="x X"
    ["0x1C"]="y Y" ["0x1D"]="z Z" ["0x1E"]="1 !" ["0x1F"]="2 @" ["0x20"]="3 #" ["0x21"]="4 $"
    ["0x22"]="5 %" ["0x23"]="6 ^" ["0x24"]="7 &" ["0x25"]="8 *" ["0x26"]="9 (" ["0x27"]="0 )"
    ["0x28"]="\n \n" ["0x29"]="[ESC] [ESC]" ["0x2A"]="[BACKSPACE] [BACKSPACE]" ["0x2B"]="\t \t"
    ["0x2C"]="  " ["0x2D"]="- _" ["0x2E"]="= +" ["0x2F"]="[ {" ["0x30"]="] }" ["0x31"]="\\ |"
    ["0x32"]="# ~" ["0x33"]="; :" ["0x34"]="' \"" ["0x36"]=", <" ["0x37"]=". >" ["0x38"]="/ ?"
    ["0x39"]="[CAPSLOCK] [CAPSLOCK]"
)

pcap_file="hiddenmsg.pcapng"

# ------------- Decoder function -------------
decode_keystrokes() {
    local filter="$1"
    local output hid_data modifier=0

    output=$(tshark -r "$pcap_file" -Y "$filter" -T fields -e "$filter")

    hid_data=""
    while read -r line; do
        buffer="${line}"
        code="0x$(echo "$buffer" | cut -c5-6 | tr 'a-f' 'A-F')"

        if [[ "$buffer" =~ ^02 || "$buffer" =~ ^20 ]]; then
            # SHIFT modifier path
            if [[ "$code" == "0x2A" ]]; then
                hid_data="${hid_data%?}"
            elif [[ -n "${usb_codes[$code]}" ]]; then
                hid_data+=$(echo "${usb_codes[$code]}" | awk '{print $2}')
            fi
        else
            if [[ "$buffer" =~ ^01 ]]; then
                modifier=$((modifier+1))
                continue
            fi
            if [[ "$code" == "0x2A" ]]; then
                hid_data="${hid_data%?}"
            elif [[ -n "${usb_codes[$code]}" ]]; then
                hid_data+=$(echo "${usb_codes[$code]}" | awk '{print $1}')
            fi
        fi
    done <<< "$output"

    echo "$hid_data"
}

# ------------- Run with usb.capdata first -------------
result=$(decode_keystrokes "usb.capdata")

if [ -z "$result" ]; then
    echo -e "\n[+] Using filter \"usbhid.data\" Retrieved HID Data:\n"
    decode_keystrokes "usbhid.data"
    echo -e "\n"
else
    echo -e "\n[+] Using filter \"usb.capdata\" Retrieved HID Data:\n"
    echo "$result"
fi
