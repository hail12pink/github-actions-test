local module = {}

module.print = function()
  print("success!")
end

module.randomError = function()
  if math.random(0,1) == 1 then
    error("who could have expected that", 2)
  else
    print("who could have expected that")
  end
end -- imported from ../modules/print.lua
local SignalConnection = {}
SignalConnection.ClassName = "SignalConnection"
SignalConnection.__index = SignalConnection

function SignalConnection.new(container, index, handler)
	return setmetatable({
		_container = container;
		_index = index;
		_handler = handler;
	}, SignalConnection)
end

function SignalConnection:Disconnect()
	if self._container then
		self._container[self._index] = nil
	end
end

local Signal = {}
Signal.ClassName = "Signal"
Signal.__index = Signal

function Signal.new()
	return setmetatable({
		_waits = {};
		_handlers = {};
	}, Signal)
end

function Signal:Fire(...)
	for i, v in ipairs(self._waits) do
		coroutine.resume(v, ...)
		table.remove(self._waits, i)
	end

	for i, v in pairs(self._handlers) do
		local thread = coroutine.create(v._handler)
		coroutine.resume(thread, ...)
	end
end

function Signal:Connect(handler)
	assert(type(handler) == "function", "Passed value is not a function")

	local index = #self._handlers + 1
	local connection = SignalConnection.new(self._handlers, index, handler)

	table.insert(self._handlers, index, connection)
	
	return connection
end

function Signal:Wait()
	table.insert(self._waits, coroutine.running())
	return coroutine.yield()
end

function Signal:Destroy()
	for i, v in ipairs(self._waits) do
		coroutine.resume(v)
		table.remove(self._waits, i)
	end

	for i, connection in pairs(self._handlers) do
		connection:Disconnect()
	end
end -- imported from ../modules/signal.lua
module.print()

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
