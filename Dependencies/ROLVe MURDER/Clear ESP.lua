for _,v in pairs(game.CoreGui:GetChildren()) do
  if v.Name == 'tracker' and v:isA('BillboardGui') then
    v:Destroy()
  end
end
end
