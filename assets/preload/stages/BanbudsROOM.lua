
local oppx = 909.5
local oppy = 538.5

local oppxbf = 1256.5
local oppybf = 568.5

local camoffs = 20

local followchars = true
local onetime = true

function onCreate()  
    makeLuaSprite('RoomBG', 'bg', -230, -130)    
    addLuaSprite('RoomBG', false)
    setProperty('gfGroup.visible', false)

    makeLuaSprite('chair', 'chair', 230, 580)    
    addLuaSprite('chair', false)

    makeLuaSprite('microphone', 'microphone', 370, 880)    
    addLuaSprite('microphone', true)

    makeLuaSprite('white', 'white', 895, 485)    
    addLuaSprite('white', false)

    makeLuaSprite('black', 'black', 865, 485)    
    addLuaSprite('black', true)
    setProperty('black.alpha', 0);

    makeLuaSprite('table', 'table', 810, 460)    
    addLuaSprite('table', true)

    makeLuaSprite('shade', 'shade', -80, 290)    
    addLuaSprite('shade', true)

    setObjectOrder('RoomBG', 1);
    setObjectOrder('white', 2);
    setObjectOrder('dadGroup', 3);
    setObjectOrder('black', 4);
    setObjectOrder('table', 5);
    setObjectOrder('chair', 6);
    setObjectOrder('boyfriend', 7);
    setObjectOrder('microphone', 8);
    setObjectOrder('shade', 9);

    makeLuaText('suck', 'i like guys', 9999, 500)
    addLuaText('suck')
    setObjectCamera('suck', 'camother')
    setTextColor('suck', 'F9B3CD')
    setTextBorder('suck', '3', '1A1A26')
    setTextSize('suck', '25')
    screenCenter('suck','xy')
    setProperty('suck.y', 530);
    setProperty('suck.alpha', 0);

    makeLuaText('suck2', 'um', 9999, 500)
    addLuaText('suck2')
    setTextColor('suck2', '777A7C')
    setTextBorder('suck2', '3', '14161E')
    setObjectCamera('suck2', 'camother')
    setTextSize('suck2', '25')
    screenCenter('suck2','xy')
    setProperty('suck2.y', 560);
    setProperty('suck2.alpha', 0);
    
end 


function onUpdate(elapsed)

    if onetime then 
        noteTweenX("NoteMove1", 4, 90-600, 0.0001, cubeInOut)
        noteTweenX("NoteMove2", 5, 205-600, 0.0001, cubeInOut)
        noteTweenX("NoteMove3", 6, 315-600, 0.0001, cubeInOut)
        noteTweenX("NoteMove4", 7, 425-600, 0.0001, cubeInOut)
    
        noteTweenX("NoteMove16", 0, -400, 0.0001, cubeInOut)
        noteTweenX("NoteMove27", 1, -400, 0.0001, cubeInOut)
        noteTweenX("NoteMove38", 2, -400, 0.0001, cubeInOut)
        noteTweenX("NoteMove49", 3, -400, 0.0001, cubeInOut)
        onetime = false
    end

    if curStep == 64 then 
        doTweenAlpha('camHUD', 'camHUD', 1, 0.2, 'quadInOut');
        noteTweenX("NoteMove1", 4, 90, 1, quadInOut)
        noteTweenX("NoteMove2", 5, 205, 1, quadInOut)
        noteTweenX("NoteMove3", 6, 315, 1, quadInOut)
        noteTweenX("NoteMove4", 7, 425, 1, quadInOut)

    end

    if curStep == 1 then 
        doTweenAlpha('camHUD', 'camHUD', 0, 0.2, 'quadInOut');
    end  
    
    if curStep == 256 then 
        doTweenAlpha('camHUD', 'camHUD', 0, 0.4, 'quadInOut');
    end 
    
    if curStep == 320 then 
        setProperty('songSpeed', 3.1);
        doTweenAlpha('camHUD', 'camHUD', 1, 0.2, 'quadInOut');
    end  

    if curStep == 576 then 
        setProperty('songSpeed', 2.8);
    end

    if curStep == 640 then 
        setProperty('songSpeed', 2.95);
    end

    if curStep == 832 then 
        setProperty('songSpeed', 2.95);
    end

    if curStep == 320 then 
        setProperty('boyfriend.specialAnim', false);
    end

    if curStep == 838 then
        setProperty('black.alpha', 1);
        cameraFlash('camGame', 'FFFFFF', 2, true); 
        cameraFade('camGame', '000000', 0.4, true); 
        setProperty('health', 2);
    end

    if curStep == 257 then 
        setProperty('suck.alpha', 1); 
    end
    if curStep == 272 then
        setTextString('suck', 'i... really like guys') 
    end
    if curStep == 292 then
        setProperty('suck2.alpha', 1);
        setTextString('suck2', 'um') 
    end

    if curStep == 302 then
        setProperty('suck2.alpha', 0);
        setTextString('suck2', 'SHUT UP!!') 
        setTextSize('suck2', '40')
    end

    if curStep == 314 then
        setProperty('suck2.alpha', 1);
    end

    if curStep == 300 then
        setTextString('suck', 'i like to be taken from behind') 
    end

    if curStep == 320 then
        setProperty('suck.alpha', 0);
        setProperty('suck2.alpha', 0);
    end
   
    
    if followchars == true then
        if mustHitSection == false then
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',oppx-camoffs,oppy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',oppx+camoffs,oppy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',oppx,oppy-camoffs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',oppx,oppy+camoffs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',oppx,oppy);
            end
        else if mustHitSection == true then
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',oppx-camoffs,oppy)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',oppx+camoffs,oppy)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',oppx,oppy-camoffs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',oppx,oppy+camoffs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',oppx,oppy);
            end 
        else   
           
            triggerEvent('Camera Follow Pos','','');
        end
    end
    else
        triggerEvent('Camera Follow Pos','','');
    end
end

function onBeatHit()
	beatHitDance(curBeat);
end


