# https://loige.co/random-emoji-in-your-prompt-how-and-why/
fortune|cowsay
export PS1=''
CATS=(😺 😸 😹 😻 😼 😽 🙀 😿 😾)
CAT=${CATS[$RANDOM % ${#CATS[@]}]};
function success_indicator() {
    if [ $? -eq 0 ] ; then echo "🟢"; else echo "🔴 $?"; fi }
export PS1=' $(success_indicator)\n\n\n $CAT \e[0;35m⬢ \w\e[0m '
