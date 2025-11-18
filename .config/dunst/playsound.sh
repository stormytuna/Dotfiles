if [ "$DUNST_CATEGORY" == "SILENT" ]
then
  exit 0
fi

if [ "$DUNST_URGENCY" == "CRITICAL" ]
then
  play ~/.config/dunst/sounds/dialog-error-serious.oga
  exit 0
fi

case "$DUNST_APP_NAME" in
  "discord"|"vencord"|"vesktop")
    play ~/.config/dunst/sounds/message-new-instant.oga
    exit 0
esac

if [ "$DUNST_URGENCY" == "LOW" ]
then
  play ~/.config/dunst/sounds/dialog-information.oga
  exit 0
fi

play ~/.config/dunst/sounds/completion-success.oga
