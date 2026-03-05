# Signal

A simple module that allows you to create custom signals in Roblox. This is meant for module based backends.

[Download here](https://github.com/CombineBenefactor/Signal/releases)

## Usage
### Built In Functions
Connect to a function
```luau
Signal:Connect()
```
Connect to a function once
```luau
Signal:Once()
```
Wait until event is fired, returns fired args
```luau
Signal:Wait()
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
