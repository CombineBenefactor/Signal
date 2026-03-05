local Signal = {}
Signal.__index = Signal

export type Signal = {
	Connect: (Function:any) -> (),
	Disconnect: () -> (),
	Once: (Function:any) -> (),
	Wait: () -> (...any),
}

function Signal.new()
	return setmetatable(
		{Listeners = {}, OnceListeners = {}},
		Signal
	)
end

function Signal:Connect(Listener:() -> ())
	table.insert(self.Listeners, Listener)
end

function Signal:Fire(...)
	for _, Listener in ipairs(self.Listeners) do
		task.spawn(Listener, ...)
	end

	for Index = #self.OnceListeners, 1, -1 do
		local Listener = self.OnceListeners[Index]
		task.spawn(Listener, ...)
		table.remove(self.OnceListeners, Index)
	end
end

function Signal:Once(Listener:() -> ())
	table.insert(self.OnceListeners, Listener)
end

function Signal:Wait()
	local Thread = coroutine.running()
	local result

	self:Once(function(...)
		result = {...}
		task.spawn(coroutine.resume, Thread)
	end)
	
	coroutine.yield(Thread)
	return table.unpack(result)
end

function Signal:Disconnect()
	setmetatable(self, nil)
end

return Signal
