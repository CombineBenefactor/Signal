# Signal

A simple module that allows you to create custom signals in Roblox. This is meant for module based backends.

[Download here](https://github.com/CombineBenefactor/Signal/releases)

## Usage
### Non-Module Based Usage:
```luau
local Signal = require(script.Signal) -- / YOU CAN ALSO DO require(130755412990963), NOTE THAT REQUIRE ONLY WORKS ON THE SERVER SIDE
local OnDamage = Signal.new() -- / CREATE A NEW SIGNAL

-- / LATER ON, FOR EXAMPLE IF A PLAYER WAS KILLED
OnDamage:Fire(ShootingPlayer, HitPlayer, Damage)

-- / CONNECT THE EVENT
OnDamage:Connect(function(ShootingPlayer:Player, HitPlayer:Player|Model, Damage:number)
	-- Do anything you want here
end)
```

### Module Backend Usage:
```luau
CombatServer.OnDamage = CombatServer.Shared.Objects.Signal.new()

-- / WHEN THE PLAYER WAS KILLED FOR EXAMPLE
CombatServer.OnDamage:Fire(Player, HitPlayer, Damage)

-- / CONNECT THE EVENT IN ANOTHER MODULE, IN THIS CASE "StatCounter"
StatCounter.Services.CombatServer.OnDamage:Connect(function(ShootingPlayer:Player, HitPlayer:Player|Model, Damage:number)

end)
```
