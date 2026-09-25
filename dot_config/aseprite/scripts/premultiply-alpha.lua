local sprite = app.activeSprite
if not sprite then
  app.alert("No active sprite found!")
  return
end

local image = sprite.cels[1].image
for pixel in image:pixels() do
  local rgba = pixel()

  local r = app.pixelColor.rgbaR(rgba)
  local g = app.pixelColor.rgbaG(rgba)
  local b = app.pixelColor.rgbaB(rgba)
  local a = app.pixelColor.rgbaA(rgba)

  r = (r * a) // 255
  g = (g * a) // 255
  b = (b * a) // 255

  pixel(app.pixelColor.rgba(r, g, b, a))
end

local pos = sprite.cels[1].position
sprite.cels[1].image = image
sprite.cels[1].position = pos
