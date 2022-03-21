module.print()

module.randomError()

local onThreeSecondsWaited = Signal.new() -- creates the signal and gives it an appropriate variable name for the situation we'll use it for

--[[
the line below connects the passed function to the signal in a way where when the signal is fired, the function will also run. 
this also returns a SignalConnection object which you can save to a variable to disconnect the function from the signal. 
you can add as many connections to one signal as you want
]]

local signalConnection = onThreeSecondsWaited:Connect(function()
   -- do something hehe!
end)

wait(3)

onThreeSecondsWaited:Fire() -- fires the signal, causing the handler function we set earlier to run

signalConnection:Disconnect() -- disconnects the connection so that the handler function above will stop executing when the signal is fired
