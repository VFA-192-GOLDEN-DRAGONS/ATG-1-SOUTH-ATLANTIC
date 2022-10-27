env.info("spawnremoval Loading", false)


function SEF_BASECAP_REMOVE ()

  Mov=SET_GROUP:New():FilterPrefixes("Mov CS"):FilterActive(true):FilterOnce()
  kbSAM=SET_GROUP:New():FilterPrefixes("kbSAM"):FilterActive(true):FilterOnce() 
  CAS=SET_GROUP:New():FilterPrefixes("CAS"):FilterActive(true):FilterOnce()
  Ship=SET_STATIC:New():FilterPrefixes("Ship"):FilterOnce()
  CASBlue=SET_STATIC:New():FilterPrefixes("CAS_blue"):FilterOnce()

  --=====================================================================================
  
  local Movcount=Mov:Count()
    for i = 1, Movcount do
      local grpObj = Mov:GetRandom()
      --env.info(grpObj:GetName())
      grpObj:Destroy(true)
    end
      
  local kbSAMcount=kbSAM:Count()
    for i = 1, kbSAMcount do
      local grpObj = kbSAM:GetRandom()
      --env.info(grpObj:GetName())
      grpObj:Destroy(true)
    end    
   
  local CAScount=CAS:Count()
    for i = 1, CAScount do
      local grpObj = CAS:GetRandom()
      --env.info(grpObj:GetName())
      grpObj:Destroy(true)
    end 
    
  local Shipcount=Ship:Count()
    for i = 1, Shipcount do
      local grpObj = Ship:GetRandom()
      --env.info(grpObj:GetName())
      grpObj:Destroy(true)
    end   
     
    local CASBluecount=CASBlue:Count()
    for i = 1, CASBluecount do
      local grpObj = CASBlue:GetRandom()
      --env.info(grpObj:GetName())
      grpObj:Destroy(true)
    end      
end

timer.scheduleFunction(SEF_BASECAP_REMOVE, nil, timer.getTime() + 1)

env.info("spawnremoval Complete", false)

