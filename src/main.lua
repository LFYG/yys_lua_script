--
--init("0", 1)
setScreenScale(1536,2048)
init("0", 1)


width,height = getScreenSize()
sysLog("width: "..width.."; height: "..height)


require "utils"
require "party_info"
require "yuhun_info"
require "inCombat"
require "tansuo"
require "xuche"
require "tupo"
require "spec"
require "richang"
require 'xsfy'
pos = require("bblibs/pos")

dict = createOcrDict("dict.txt") 
id = createHUD()     --创建一个HUD
my_toast(id,"欢迎使用大便脚本！")     --显示HUD内容




function main()
  ret,results = showUI("ui.json")
  if ret==0 then	
    toast("您选择了取消，停止脚本运行")
    lua_exit()
  else
    toast_screensize()
    --↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓获取UI配置↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
    -------------------------------------------个人突破--------------------------------------
    if results['100'] == '0' then	
      tupo_ret,tupo_results = showUI("tupo.json")
      main_tupo(tupo_ret,tupo_results)
      
      -------------------------------------------悬赏封印--------------------------------------
    elseif results['100'] == '1' then
      toast("功能处于测试版本,请阅读脚本说明以及教程后进行设置,若出现问题请加q群反馈bug")
      悬赏封印_ret,悬赏封印_results = showUI("xsfy.json")
      main_xsfy(悬赏封印_ret,悬赏封印_results)
      
      -------------------------------------------御魂10--------------------------------------
    elseif results['100'] == '2' then
      yh_ret,yh_results = showUI("yuhun.json")
      main_yh(yh_ret,yh_results)
      -------------------------------------------阴阳寮续车--------------------------------------	
    elseif results['100'] == '3' then
      xuche_ret, xuche_results = showUI("xuche.json")
			main_xuche(xuche_ret, xuche_results)
      -------------------------------------------探索--------------------------------------
    elseif results['100'] == '4' then
      ts_ret,ts_results = showUI("tansuo.json")
      main_tansuo(ts_ret, ts_results)
      
      -------------------------------------------业原火--------------------------------------	
    elseif results['100'] == '5' then
      enter_yeyuanhuo()
      yyh_ret,yyh_results = showUI("yeyuanhuo.json")
      main_yeyuanhuo(yyh_ret,yyh_results)
      -------------------------------------------妖气封印--------------------------------------	
    elseif results['100'] == '6' then
      yqfy_ret,yqfy_results = showUI("yqfy.json")
      main_yqfy(yqfy_ret, yqfy_results)
      
      -------------------------------------------日常杂项--------------------------------------	
    elseif results['100'] == '7' then
      richang_ret,richang_results = showUI("richang.json")
      main_richang(richang_ret,richang_results)
      -------------------------------------------一条龙挂机--------------------------------------	
    elseif results['100'] == '8' then
      dialog('功能马上完成, 敬请期待')
      -------------------------------------------开发中--------------------------------------	
      
    else 
      toast("您什么都没有设置")
      lua_exit()
    end
    my_exist(true)
  end
end

main()
--my_swip_2(1305, 1241, 1305, 380, 10, 200, 40)

--]]
--
--check_current_state()
--[[
enter_main_function()
  my_swip(200, 1250, 1800, 1250, 50)
  local feng_x, feng_y = myFindColor(悬赏)
  if feng_x > -1 then tap(feng_x, feng_y) else sysLog('couldnt find feng') end
  ]]--
  


--[[
my_swip_2(1008, 1354, 1008, 1306, 40, 50, 5)
mSleep(3000)
tap(jiejie_friend[1][1], jiejie_friend[1][2])
mSleep(3000)
local if_can_jiyang_x, if_can_jiyang_y = myFindColor(寄养)
if if_can_jiyang_x > -1 then
	
else
	return false
end
--]]




















--enter_jiyang()
--if_jiyang()
  --[[
      
    x, y = myFindColor(不动风车)
    if x > -1 then
      sysLog('没有结界卡')
    end
    --]]
    ------------------------------------------------------------------------------
    
    
    -----------------------------------------------------------------------------
    
    --[[
    find_yaoqi(海坊主)
    find_yaoqi(小黑)
    find_yaoqi(经验)
    find_yaoqi(金币)
    find_yaoqi(椒图)
    find_yaoqi(二口女)
    find_yaoqi(骨女)
    find_yaoqi(哥哥)
    find_yaoqi(饿鬼)
    --snapshot("invite_na.png", 697,693,805,734); --全屏截图（分辨率1080*1920）
    --]]
    
    --/User/Library/XXIDEHelper/xsp/Temp/5星.png
    
    --page 2
    
   