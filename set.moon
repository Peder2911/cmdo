pairs = pairs
module "set"

return {
   contains: (xs,x) ->
      for _,v in pairs xs
         if v == x
            return true
      return false
}
