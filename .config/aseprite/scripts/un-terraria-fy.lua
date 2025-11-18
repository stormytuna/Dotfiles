local sprite = app.activeSprite
if not sprite then
  app.alert("No active sprite found!")
  return
end

sprite:resize(sprite.width / 2, sprite.height / 2, "NearestNeighbor")
app.command.CanvasSize {
  left = sprite.width / 2,
  top = sprite.height / 2,
  right = sprite.height / 2,
  bottom = sprite.height / 2,
  ui = false,
}
