export PS1=
CATS=(😺 😸 😹 😻 😼 😽 🙀 😿 😾 ⚔️  ⚽ 🎩 🐰 🌙 )
CAT=${CATS[$RANDOM % ${#CATS[@]}]}
function success_indicator() {
  if [ $? -eq 0 ] ; then echo "🟢"; else echo "🔴 $?"; fi }
export PS1='$(success_indicator)\n\n\n\w '
