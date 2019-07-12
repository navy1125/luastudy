LogClass = {}
function LogClass:Debug(...)
	print(self:GetName() .. ":" .. unpack(arg))
end
if CopySceneClass ~= nil then
	CopySceneClass = nil 
	unilight.error("CopySceneClass被意外全局初始化,这里强制重置成类:CopySceneClass")
end
CopySceneClass = {}
setmetatable(CopySceneClass, { __index = LogClass})

function CreateCopyScene()
	local scene = {}
	scene.name="wanghaijun"
	setmetatable(scene, { __index = CopySceneClass})
	return scene
end
function CopySceneClass:GetName()
	return "CopySceneClass"
end
function CopySceneClass:Print()
	print(self.name)
end
function Print()
	print "wangsong"
end
local scene = CreateCopyScene()
scene:Print()
scene:Debug("whj")
aa = CopySceneClass.Print
aa(scene)
funcmap={}
funcmap["Print"]=Print
funcmap["Print"]()
--funcmap["scenePrint"]="CopySceneClass:Print"
--funcmap["scenePrint"]()
