function love.load()
  -- titulo do jogo
  love.window.setTitle('Head or Tails')

  -- colocar as fontes
  pixelFont = love.graphics.newFont('fonts/Minecraft.ttf', 26)
  pixelFont:setFilter("nearest", "nearest")

  -- imagem do fundo
  background = love.graphics.newImage('imgs/fundo.jpg')

  -- imagem das moedas
  coins = love.graphics.newImage('imgs/coins.png')
  local coinsW, coinsH = 30, 30
  local coinssetW, coinssetH = coins:getWidth(), coins:getHeight()
  tails = love.graphics.newQuad(0, 0, coinsW, coinsH, coinssetW, coinssetH)
  head = love.graphics.newQuad(32, 0, coinsW, coinsH, coinssetW, coinssetH)
  coins:setFilter('nearest', 'nearest')

  -- valores da moeda
  coinText = 'Nil'
  coinValue = nil

  -- som da moeda
  local data = love.sound.newSoundData("sounds/coin.wav")
  coinSound = love.audio.newSource(data)
end

function love.update(dt)
end

function love.draw()
  -- colocar a cor de fundo
  love.graphics.setBackgroundColor(1, 1, 1)

  -- colocar a fonte
  love.graphics.setFont(pixelFont)
  interface()
end

function interface()
  -- desenhar fundo na tela
  love.graphics.setColor(1, 1, 1, .6)
  love.graphics.draw(background, 0, -300, 0, 3, 1.6)

  -- desenhar as moedas na tela
  love.graphics.setColor(1, 1, 1)
  if coinValue == 1 then
    love.graphics.draw(coins, tails, 330, 200, 0, 4)
    coinText = 'Tails'
  elseif coinValue == 2 then
    love.graphics.draw(coins, head, 330, 200, 0, 4)
    coinText = 'Head'
  else
    love.graphics.setColor(0, 0, 0)
    love.graphics.draw(coins, head, 330, 200, 0, 4)
  end

  -- retangulo do texto
  love.graphics.setColor(0, 0, 0, .9)
  love.graphics.rectangle("fill", 150, 390, 480, 40, 15)
  love.graphics.rectangle("fill", 340, 130, 100, 40, 15)

  -- desenhar o texto na tela
  love.graphics.setColor(1, 1, 1)
  love.graphics.print(coinText, 360, 140, 0)
  love.graphics.print("clique a letra   para girar a moeda", 170, 400, 0)
  love.graphics.setColor(220 / 255, 211 / 255, 19 / 255)
  love.graphics.print("r", 338, 400, 0)
end

-- tocar o som da moeda ao girar
function playSound(source)
  local clone = source:clone()
  clone:play()
end

-- binds
function love.keypressed(key, scancode, isrepeat)
  if key == "escape" then
    love.event.quit()
  elseif key == 'r' then
    playSound(coinSound)
    coinValue = love.math.random(1, 2)
  end
end


  
