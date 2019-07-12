a={}
print(a)
for k,v in pairs(_G) do
	if a==v then
		print("catch it:",k)
	end
end
