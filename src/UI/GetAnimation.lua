local tweenInfo = TweenInfo.new

local TWN = game:GetService('TweenService')

local function GetAnimation(object, duration, propertyGoals, easingStyle, easingDirection, reverse, repeatCount, delayTime)
	return TWN:Create(object, tweenInfo(duration, easingStyle or Enum.EasingStyle.Quad, easingDirection or Enum.EasingDirection.Out, repeatCount or 0, reverse or false, delayTime or 0), propertyGoals)
end

return GetAnimation
