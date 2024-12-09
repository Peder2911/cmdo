
mode = "i"
commandbuffer = {} 
cursor = 0
kerning = 10

cmd = require("cmd")

love.load = ->
   font = love.graphics.newImageFont("imagefont.png",
       " abcdefghijklmnopqrstuvwxyz" ..
       "ABCDEFGHIJKLMNOPQRSTUVWXYZ0" ..
       "123456789.,!?-+/():;%&`'*#=[]\"")
   love.graphics.setFont(font)
   commandbuffer = {} 

love.draw = ->
   love.graphics.rectangle("fill",400+((cursor)*kerning),300,10,15)
   for i,c in pairs commandbuffer
      love.graphics.print(c,400+(i*kerning),300)
   love.graphics.print(mode, 10, 10)
   love.graphics.setBackgroundColor(0,0,0)

love.keypressed = (key) ->
   if key == "return"
      words = cmd.parse(commandbuffer)
      print(words[1])
      if words[1] == "exit"
         love.event.quit()
      commandbuffer = {} 
      cursor = 0
   if key == "escape"
      mode = "n"
      return

   if mode == "n"
      if key == "h" and cursor > 0
         cursor = cursor - 1
      if key == "l" and not (cursor > #commandbuffer)
         cursor = cursor + 1
      if key == "i"
         mode = "i"
         return
      if key == "a"
         mode = "a"
         return

   if mode == "i"
      if cmd.is_letter(key) or cmd.is_number(key)
         table.insert(commandbuffer,cursor,key)
         cursor = cursor + 1
      else if key == "space"
         table.insert(commandbuffer,cursor," ")
         cursor = cursor + 1
      else if key == "backspace"
         table.remove(commandbuffer, cursor)
         cursor = cursor - 1
