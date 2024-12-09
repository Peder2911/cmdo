pairs = pairs
table = table 
require = require
module "cmds"

set = require("set")

letters = {"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"}
numbers={"1","2","3","4","5","6","7","8","9","0",}

return {
   is_letter: (x)->
      set.contains(letters,x)
   is_number: (x)->
      set.contains(numbers,x)
   parse: (xs) ->
      words = {}
      word = ""
      for i,c in pairs xs
         if c == " "
            table.insert(words,word)
            word = ""
         else
            word = word .. c
      table.insert(words,word)
      return words
}
