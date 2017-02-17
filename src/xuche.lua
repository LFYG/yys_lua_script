function get_lag(result)
	hours = tonumber(results[1].text)*10 + tonumber(results[2].text)
	minutes = tonumber(results[3].text)*10 + tonumber(results[4].text) + 0.5
	microseconds = (hours*60+minutes)*60*1000
	sysLog('need to wait '..hours..' hours and '..minutes..' minutes('..microseconds..' microseconds)')
	my_toast(id, '需要等待'..hours..'小时'..minutes..'分钟')
	return microseconds
end
	--[[
local dict = createOcrDict("dict.txt") 
results = ocrText(dict, 1735,952,1818,985, {"0x37332e-0x505050"}, 95, 1, 1) -- 表示范围内横向搜索，以table形式返回识别到的所有结果及其坐标
--]]

function if_windmill()
	local x_1, _ = findColorInRegionFuzzy(0x516290, 95, 1903, 555, 1903, 556)
	mSleep(10)
	local x_2, _ = findColorInRegionFuzzy(0x516290, 95, 1903, 555, 1903, 556)
	mSleep(10)
	local x_3, _ = findColorInRegionFuzzy(0x516290, 95, 1903, 555, 1903, 556)
	mSleep(10)
	if x_1 + x_2 + x_3 ~= 1903*3 then
		sysLog('颜色有变换')
		return true
	else
		sysLog('颜色无变换')
		return false
	end
end


function enter_jiyang()
  enter_main_function()
	sub_function:case('guild')
	state_transit(结界点击, 式神育成, 1549, 1220)
	state_transit(式神育成, 第一灯笼, 1050, 700)									
end


function if_jiyang()
	accept_quest()
	local x, y = findColorInRegionFuzzy(0x272420, 95, 1798, 874, 1802, 876)	 --寄养的黑色+号
	if x > -1 then
		tap(1800, 875)														--点击寄存
		wait_for_state(好友寄养)
		return true
	else
		return false
	end
end


function jiyang_nextpage(times)
	if times == 0 then
		do return end
	end
	my_toast(id, '此次翻动'..times..'页')
	for i = 1, times, 1 do
	--my_swip_2(1008, 1354, 1008, 610, 40, 50, 15)
	my_swip_2(1009, 1352, 1009, 900, 200, 50, 60)
	local x, y = findMultiColorInRegionFuzzy(0xcbb59c,"12|0|0xcbb59c,24|0|0xcbb59c,35|2|0xcbb59c,48|2|0xcbb59c,-21|-12|0xcbb59c,18|-12|0xcbb59c,43|-19|0xcbb59c,63|-24|0xcbb59c,79|-22|0xcbb59c", 95, 595, 1223, 690, 1318)
	--local x, y = findMultiColorInRegionFuzzy(0x716f6d,"0|2|0xe4e4e4,0|5|0x5a5a5a,0|8|0x454545,0|12|0x29221a,-2|43|0x464646,0|49|0x7f7f7f,0|51|0xd7d7d7", 90, 568, 1185, 698, 1344)
	if x > -1 then
		sysLog('底部')
	return i
	end
	mSleep(1000)
	end
	return true
end


function found_card()
	sysLog('找到斗鱼或者太鼓')
	my_toast(id, '找到斗鱼或者太鼓')
	sysLog(_G.ss_type)
	mSleep(2000)
	tap(1048, 336)
	mSleep(2000)
	tap(100, 1427)
	mSleep(500)
	if _G.ss_type == 0 then
		tap(73, 1077)
	elseif _G.ss_type == 1 then
		tap(222, 1100)
	elseif _G.ss_type == 2 then
		tap(346, 1182)
	elseif _G.ss_type == 3 then
		tap(423, 1309)
	else
		tap(440, 1455)
	end
	mSleep(2000)
	return ss_jiyang()
end


function check_one_friend()
	mSleep(_G.refresh_lag)
	local if_has_card_x, if_has_card_y = myFindColor(不动风车)
	local if_jiyang_x, if_jiyang_y = myFindColor(寄养)
	if if_jiyang_x == -1 then 
		my_toast(id, '此好友没有车可以上了')
		return true
	end
	while if_has_card_x == -1 do
		mSleep(200)
		if_has_card_x, if_has_card_y = myFindColor(不动风车)
	end
	--local s = ColorCheck:new_ColorCheckSystem({{1926,580},{1938,588}},nil,10)
	--if s:ColorCheck_TF() then 
	if not if_windmill() then
		--sysLog("无变化")
		my_toast(id, '好友没有结界卡(风车没转)')
		state_transit(不动风车, 式神育成, 67, 71)
		--tap(67, 71)
	else 
		my_toast(id, '好友有结界卡(风车在转)')
		--sysLog("有变化") 
		state_transit(不动风车, 结界卡, 1868, 727)
		local red_cross_x, _ = findMultiColorInRegionFuzzy(0x612c32,"0|26|0xe8d4cf,3|54|0x753743", 95, 1849, 264, 1939, 346)
		while red_cross_x == -1 do
			mSleep(200)
			red_cross_x, _ = findMultiColorInRegionFuzzy(0x612c32,"0|26|0xe8d4cf,3|54|0x753743", 95, 1849, 264, 1939, 346)
		end
		keepScreen(true)
		local douyu_x, douyu_y = myFindColor(斗鱼)
		local taigu_x, taigu_y = myFindColor(太鼓)
		keepScreen(false)
		tap(red_cross_x, _)
		if _G.card_type == '0' then
			if douyu_x > -1 then
				return found_card()
			else
				my_toast(id, '没找到车')
				state_transit(好友结界, 式神育成, 67, 71)
			end
		elseif _G.card_type == '1' then
			if taigu_x>-1 then
				return found_card()
			else
				my_toast(id, '没找到车')
				state_transit(好友结界, 式神育成, 67, 71)
			end
		else
			if taigu_x> - 1 or douyu_x > -1 then
				return found_card()
			else
				my_toast(id, '没找到车')
				state_transit(好友结界, 式神育成, 67, 71)
			end
		end
	end
	state_transit(式神育成, 第一灯笼, 1043, 750, true)
	state_transit(第一灯笼, 好友寄养, 1800, 875)
	return false
end


function ss_jiyang()
  sysLog('ss_jiyang')
  keepScreen(true)
  for i = 1, 7, 1 do
    accept_quest()
    local emty_x, emty_y = findMultiColorInRegionFuzzy(0xf7dfa3,"-1|-1|0xc4a578,-2|-2|0xddb687,-2|3|0xd1ab7e,-2|0|0xa07e59,-1|0|0xd3b684,-5|-5|0xae8c65,-4|6|0xb08a63,-6|-7|0xa68763,-8|-8|0xad8c65",80,ssjiejie_position[i][1], ssjiejie_position[i][2], ssjiejie_position[i][3], ssjiejie_position[i][4]);
    local full_x, full_y = findMultiColorInRegionFuzzy(0xffca0d,"-8|1|0xfdcc0b,8|-1|0xfbc30e", 95, ssjiejie_position[i][1], ssjiejie_position[i][2], ssjiejie_position[i][3], ssjiejie_position[i][4])  --满字
    if emty_x > -1  and full_x == -1 then
			sysLog('找到gl'..emty_x..'.'..emty_y)
			local new_x = emty_x+100
			local new_y = emty_y+100
			sysLog('new_x '..new_x..';new_y '..new_y)
			local new = pos:new(new_x, new_y)
			local move = {x=1803, y=556}
			local step = 28
			local sleep1,sleep2 = 500,20
			new:touchMoveTo(move,step,sleep1,sleep2)
			--swip(new_x, new_y, ss_position[slot_num][1], ss_position[slot_num][2])
			mSleep(2000)
			--tap(59, 56)
			--mSleep(2000)
			keepScreen(false)
			local x, y = findMultiColorInRegionFuzzy(0xf3b25e,"-321|-4|0xdf6851,-1|57|0xf3b25e,-316|53|0xdf6851", 95, 1089, 979, 1276, 1067)
			while x == -1 do
				mSleep(200)
				x, y = findMultiColorInRegionFuzzy(0xf3b25e,"-321|-4|0xdf6851,-1|57|0xf3b25e,-316|53|0xdf6851", 95, 1089, 979, 1276, 1067)
			end
			tap(x, y)
			mSleep(3000)
			my_exist(_G.exist_method)
    else
      sysLog(i..'号位未找到')
    end
  end
  keepScreen(false)
  my_swip_2(1822, 1378, 185, 1378, 50, 40, 15)
	mSleep(500)
  return ss_jiyang()
end


function jiyang_once()
	enter_jiyang()
	if if_jiyang() then
		wait_for_state(好友寄养)
		my_toast(id, '开始找车')
		--if_jiyang()
		local end_condition = 0 --连续三次找不到寄养则为
		for pages = 0, 10, 1 do
			for single_friend = 1, 10 ,1 do
				my_toast(id, '找第'..(pages+1)..'页第'..single_friend..'个好友的车')
				my_swip_2(1008, 1354, 1008, 1306, 40, 50, 5)
				mSleep(500)
				jiyang_nextpage(pages)
				tap(jiejie_friend[single_friend][1], jiejie_friend[single_friend][2])
				if not wait_for_state(好友结界, 10000) then
					sysLog('10秒没找到, 好友没有结界')
					tap(1800, 875)														--点击寄存
					state_transit(第一灯笼, 好友寄养, 1800, 875)
				else
					if check_one_friend() then
						state_transit(好友结界, 式神育成, 67, 71)
						end_condition = end_condition + 1
						sysLog(end_condition)
						if end_condition == 3 then
						 my_toast(id, '连续三次没车上, 休息三分钟再找')
						 tap(67, 71)
						 enter_main_function()
						 waiting_clock(18000)
						 return jiyang_once()
						end
						state_transit(式神育成, 第一灯笼, 1043, 750, true)
						state_transit(第一灯笼, 好友寄养, 1800, 875)
					else
						end_condition = 0
					end
				end
			end
		end
	else
		my_toast(id, '不能寄养')
		accept_quest()
		results = ocrText(dict, 1735,952,1818,985, {"0x37332e-0x505050"}, 95, 1, 1)
		waiting_time = get_lag(results)
		tap(70, 70)
		enter_main_function()
		get_lag(results)
		waiting_clock(waiting_time)
		return jiyang_once()
	end
end


function main_xuche(xuche_ret, xuche_results)
  if xuche_ret==0 then	
    toast("您选择了取消，停止脚本运行")
    lua_exit()
  end
  _G.card_type = xuche_results['10']
  _G.ss_type = tonumber(xuche_results['100'])
	_G.refresh_lag = tonumber(xuche_results['101'])*1000
	return jiyang_once()
end

--ss_jiyang('2')
--[[
for k,v in pairs(results) do
  sysLog(string.format('{x=%d, y=%d, text=%s}', v.x, v.y, v.text))
end
--]]