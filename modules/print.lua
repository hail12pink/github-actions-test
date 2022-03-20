local module = {}

module.print = function()
  print("success!")
end

module.randomError = function()
  if math.random(0,1) == 1 then
    error("who could have expected that", 2)
  else
    print("who could have expected that)
  end
end
