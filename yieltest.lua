
local bob = {}
function bob:walkto(any)
	print("walkto:" .. any)
end
function bob:say(any)
	print("say:" .. any)
end
function runAsyncFunc( func, ... )
	local current = coroutine.running
	func(function (  )
	print("xxxxxxx:1")
		coroutine.resume(current)
	print("xxxxxxx:2")
	end, ...)
	coroutine.yield()
	print("xxxxxxx:0")
end

local co = coroutine.create(function (  )
	runAsyncFunc(bob.walkto, "wanghaijun")
	runAsyncFunc(bob.say, "hello")
	print("hello")
end)
assert(coroutine.resume(co))
print("hello1")

print("hellow2:",coroutine.resume(co))
print("hello2")
