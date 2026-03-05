local Signal = {}
Signal.__index = Signal

function Signal.new()
	return setmetatable(
		{Listeners = {}},
		Signal
	)
end

function Signal:Connect(Listener)
	table.insert(self.Listeners, Listener)
end

function Signal:Fire(...)
	for _, Listener in pairs(self.Listeners) do
		task.spawn(Listener, ...)
	end
end

function Signal:Disconnect()
	self.Listeners = nil
	setmetatable(self, nil)
end

return Signal
