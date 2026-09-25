local sprite = app.activeSprite
if not sprite then
  app.alert("No active sprite found!")
  return
end

app.command.AutocropSprite()
sprite:resize(sprite.width * 2, sprite.height * 2, "NearestNeighbor")
