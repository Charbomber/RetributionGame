-- Retribution
-- Notes:
-- Page Types: 0 - Continue / 1 - Yes or No / 2 - Item Get / 3 - Item Jump / 4 - Jump / 5 - Item Count Jump (Unused) / 6 - Ending / 7 - ???
-- Items: 0 - Rope / 1 - Sword / 2 - Time / 3 - Platinum Drive / 4 - Dagger / 5 - Twarsmyier

function love.load()
 p={}
 p.room=0
 p.stars=0
 p.stuff={}

 option=0
 text=""
 textdata={
 --1
 {"(Hello! Welcome to Retribution.)\n(press space or enter to continue)",0},
 --2
 {"(Are you ready to begin?)\n(please choose an option)",1,{"Nope.",2},{"Yeah.",3}},
 --3
 {"You have just bested the temptations of the hero's\nsword. Not satisfied, you begin to head towards the\nnearest hamlet and gather the materials needed to\ndestroy the evil sword.",0},
 --4
 {"What do you need?",1,{"Rope, of course!",5},{"A new sword!",7}},
 --5
 {"Of course, of course. To pull the sword out of\nthe lake again, you need something to pull it out\nwith. Luckily, a merchant selling simple rope is\nvery close and welcome to sell.",2,0},
 --6
 {"Rope Get!",4,9},
 --7
 {"Without a sword, you don't have anything to defend yourself!\nYou quickly head to the nearest blacksmith and buy yourself a mighty sword!",2,1}, -- 7
 --8
 {"It's almost as if the Stars themselved are saying: 'It's dangerous to go alone,\nso you get this!'. Beautiful,",7},
 --9
 {"Well, you've almost forgot! You're on borrowed time!\nYou head yourself on back to the lake, to destroy this sword once and for all.",0}, -- 9
 --10
 {"...Holy crap.\nThe shadow in the water is gone already.\nThe sword is gone.",0}, -- 10
 --11
 {"Someone must've found it, but there are no fresh footprints here, only yours.\nSome fisherman on a raft must've found it,\nthe sword is probably already brainwashing him at this very moment.",0}, --11
 --12
 {"With this said, you should probably head downstream, since\nno one could've gotten it by walking. You need to run, and FAST.",0}, -- 12
 --13
 {"There's a small fork in the road to the Howling Cliffs and the Mad Forest.\nWhere are you going?",1,{"Cliffs",14},{"Forest",20}}, -- 13
 --14
 {"The Howling Cliffs may be scary, but the Mad Forest is more scary. Fuck. That.\nTo the Howling Cliffs you go!",0},
 --15
 {"You've arrived at the large canyons that make up the Howling Cliffs.\nMan, this place is poorly named.\nYou can see a shortcut down a steep ledge, but it looks like you need some kinda rope to get down.\nThere's always the other path down, but you fear that taking too long will be your downfall.",0},
 --16
 {"So, which path?",1,{"Cliff",17},{"Longcut",26}},
 --17
 {"You have reached the cliff.",3,0,19},
 --18
 {"However, you don't have anything to CLIMB,\nyou gosh darned idiot!",4,26}, -- 18
 --19
 {"Using your rope, it was easy to get across! Now to get back on track!",4,56}, -- 19
 --20
 {"The Howling Cliffs seem a little dangerous for now.\nBesides, the woods aren't too scary!",0},
 --21
 {"You've come into the Mad Forest. It's actually quite peaceful for a while,\nuntil you get to a dark patch.\nThere's an easy way AROUND this part, but it's length has something to be\ndesired.",0},
 --22
 {"So, which path?",1,{"Scary Part",23},{"Boring Part",26}},
 --23
 {"Unfortunately, the scary part looked like a fun adventure at-first, but there are\nbrambles lining every nook and cranny. This will NOT be fun.",3,1,25}, -- 23
 --24
 {"The amount of brambles you had to wade through basically made the trip through\nnot worth the shortcut. Owie.",4,26}, -- 24
 --25
 {"Thankfully, swords make for unsurprisingly good machetes!\nYou head on through with little issue.",4,56}, -- 25
 --26
 {"Welp, now you can just take your time. It's not like you were in a hurry.\nOh wait, you are!",2,2}, -- 26
 --27
 {"You hurry down the path back to the river. There's blood in the water.\nAs you continue down the stream, you notice even more blood...\nand an occasional fish corpse, gutted.\nThat's not good.",0}, -- 27
 --28
 {"You COULD try to make a raft, but you would\nneed wood (which you get with something sharp) and rope,\nbut you're missing one of those.",0},
 --29
 {"Thankfully, as if the Stars aligned, there's a raft parked right by the shore here!\nWith fresh footprints walking away from it?\nHeaded towards a town... oh no.",7},
 --30
 {"You need to stop this. But how?",1,{"Stop this head-on!",31},{"Sneak attack!",40}}, -- 30
 --31
 {"Right. The only way to stop this is charging right through the front-gate\nYou walk through.",0},
 --32
 {"You're too late. Houses are burning, blood runs through the streets.\nIt's a massacre.",0},
 --33
 {"Here he is. The man behind all of this carnage. In his hand is a distinct steel sword, with an eye in the hilt.\nThis fight will determine the fate of the world.\nAre you ready?",1,{"No.",34},{"Yes.",45}}, -- 33
 --34
 {"You're right.",3,1,37},
 --35
 {"You don't even have a weapon!",0},
 --36
 {"Before he can see you, you're already ducked behind some rubble.\nThankfully, there's a broken-down guards post nearby. You can probably get a spear or something there.",4,40}, -- 36
 --37
 {"You can't do this.\nYou're no hero anymore, right? He's the one with the hero's sword.",0}, -- 37
 --38
 {"You flee. This isn't your problem, right? You're not a hero.\nSurely some hero will come to stop this madness, right?",0},
 --39
 {"Unfortunately, a hero HAS come. And they are the angel of\ndeath that will destroy all life if unopposed.",6,B},
 --40
 {"You arrive at the guards post, or at-least what's left of it.\nLining the walls are racks full of weapons engraved with Stars!\nOr at-least what's left of them.",2,4},
 --41
 {"The only weapon left in the rubble is a lone and resistant dagger.\nYou take it.",7},
 --42
 {"Now that you have a weapon, it's time to face him.",0},
 --43
 {"Here he is. The man behind all of this carnage. In his hand is a distinct steel sword, with an eye in the hilt.\nThis fight will determine the fate of the world.\nAre you ready?",1,{"No.",44},{"Yes.",45}}, -- 33
 --44
 {"You're right.",4,37},
 --45
 {"This is the final fight.",3,1,47},
 --46
 {"Drawing your-",3,4,53},
 --47
 {"Wait, you didn't bring a weapon.\nThat was a really big mistake.\nYou showed up to a swordfight without a weapon?",4,55},
 --48
 {"Drawing your sword, you know you're more skilled than him.\nHe's only a fisherman, after-all.",0},
 --49
 {"With your virtues as your shield and your sword as your... sword,\nYou strike decisive blows at just the right places.",0},
 --50
 {"The 'hero' has fallen. He's only hurt, not killed.\nNow it's time to destroy this sword once and for all!",0},
 --51
 {"\n\nYou pierce the eye of the weapon with your own.\nShards like that of Stars begin to fly.",7},
 --52
 {"Sure these shards look pretty evil, but they're just shards, right?\nShards can't do anything on their own.\n\n...right?",6,A},
 --53
 {"Oh, right, you brought a dagger.\nWelp, this is going to be lot harder, but you can still win.",0},
 --54
 {"Your fight with the false hero begins.\nYou get sliced a bit, but it's nothing you can't handle.\nDespite being heavily wounded, you come out on top.",4,51},
 --55
 {"You get wiped on the floor like a mop.\nFragged, even.\n\nNow there's no one left to stop death incarnate.",6,B},
 --56 / Route 2 AKA "Goin' Down The Fast Way"
 {"You head down the road back to the river.\nYou don't have time for this.\nDown the river you see it,\nthe sword. Being held by none other than a poor fisher boy,\nlistening to all the lies in the world.",0},
 --57
 {"Thank goodness! You can stop this before it's too late!",1,{"Wave him down",58},{"Run. Fast.",66}},
 --58
 {"You try to wave him down. He waves back.\nThis isn't working.",1,{"Wave him down",59},{"Run. Fast.",66}},
 --59
 {"You try to wave him down. He waves back.\nThis isn't working.",1,{"Wave him down",60},{"Run. Fast.",66}},
 --60
 {"You try to wave him down. He waves back.\nThis isn't working.",1,{"Wave him down",61},{"Run. Fast.",66}},
 --61
 {"You try to wave him down. He waves back.\nThis isn't working.",1,{"Wave him down",62},{"Run. Fast.",66}},
 --62
 {"You try to wave him down. He waves back.\nThis isn't working.",1,{"Wave him down",63},{"Run. Fast.",66}},
 --63
 {"After all this waving, the fisher boy actually leads his raft to land\nand walks towards you like the Northern Star!\nI guess that worked out, somehow.",7},
 --64
 {"You explain the situation calmly and you destroy the sword.\nThat was surprisingly easy!",0},
 --65
 {"Shattering the eye, bits of shard come out.\nVery evil shards.\nVery IMMOBILE evil shards.\n\nYou're done! And nothing will ever go wrong again...?",6,A},
 --66
 {"You try to run to the raft. This understandibly freaks the boy out a little,\nwho then decides to row the boat a little faster.\nSucks to suck, because you're faster than a boy on a raft.",0},
 --67
 {"When you get to the raft, the boy runs away, taking the sword with him.\n When you catch up to him, he's terrified.",1,{"Good Cop",68},{"Bad Cop",75}},
 --68
 {"You calmly try to relax the boy and take the sword from him. Y'know, like a normal person.",2,5},
 --69 (nice)
 {"You've gotten Twarsmyier, the evil sword!\nNow, how to destroy it...",1,{"Crush the Eye",70},{"Bury it far underground",72}},
 --70
 {"Of course. The only way to make sure it's done for good is to destroy the core.\nWith the soul in your heart and the sole in your shoe, you crush the thing that plagues humanity.",0},
 --71
 {"You've done it. You've got your retribution.\n\nBut is it really over...?",6,A},
 --72
 {"There might be no *REAL* way to destroy it for good,\nbut perhaps there's a way to seal it away for a very long time...?",0},
 --73
 {"With the help of funding from some nearby lords and a lot of shovels, you dig far into the earth.\nNot satisfied with just putting it in a hole, you make sure to add some cool traps,\njust in-case some future Star graverobber finds this place and mistakes it for a tomb.",0},
 --74
 {"That's the end for this evil artifact.\n\nRight???",6,A},
 --75
 {"You try to yank the sword away.\nDarnit, this kid's agile. Damn the power of bright young heroes!\nYou need to do something about this.",1,{"Destroy the Sword",77},{"Use the move 'agility'",76}},
 --76
 {"That's not a real option, player! Choose something real!",4,75},
 --77
 {"That's right! Just because you need to destroy the sword doesn't mean you have to\ndetach the child, first!",0},
 --78
 {"You throw a rock at the sword.\nWith your incredible aim, you hit the sword square in the eye.",4,71},
 --79
 {"Wait a sec! According to the manual, with the pure amount of things you have, you can summon\nStuffatron to stomp the sword and have your TRUE retribution!",0},
 --80
 {"Stuff in-hand, like some kind of mystical serpent spheres, the collide into an ultimate\nblackhole and summon Stuffatron. Twarsmyier is destroyed and all is peaceful.\nDon't ask what the implications of a gundam mech in a medieval world is, alright?\nI don't make the rules.",6,D},
 --81
 {"Well that was a fun game. Your computer is still broken, though. There's this weird black rectangle taking up\nthe entire top half of the screen. Thankfully, you've called some repairmen, and they're set to arrive soon.",0},
 --82
 {"Oh! Well that was quick!\nSome cyborg looking dude and some other guy just came in and fixed your computer at a very high speed!\nWhat great repairmen! You should call them again!",0},
 --83
 {"Welp, that's that.\n\nSay, where did this shiny weird hard-drive come from?",6,C},
 }

 text=textdata[1][1]
 textline=1

 itemnames={
 "Rope",
 "Sword",
 "Time",
 "Platinum Drive",
 "Dagger",
 "Twarsmyier"
 }

 spaceKeyDown=false
 leftKeyDown=false
 rightKeyDown=false
end

function love.update()
  spaceKey=love.keyboard.isDown('space','return')
  leftKey=love.keyboard.isDown('left','a')
  rightKey=love.keyboard.isDown('right','d')
  stupidassKey=love.keyboard.isDown('`')

  if spaceKey then

    if spaceKeyDown==false then
      if textdata[textline][2]==0 then
        textline=textline+1
        text=textdata[textline][1]
      elseif textdata[textline][2]==1 then
        textline=(textdata[textline][3+option][2])
        option=0
        text=textdata[textline][1]
      elseif textdata[textline][2]==2 then
       p.stuff[#p.stuff+1]=textdata[textline][3]
       textline=textline+1
       text=textdata[textline][1]
      elseif textdata[textline][2]==3 then
        local hit=false
        for i=1,#p.stuff do
          if p.stuff[i]==textdata[textline][3] then
            hit=true
          end
        end
        if hit==true then
          textline=textdata[textline][4]
        else
          textline=textline+1
        end
        text=textdata[textline][1]
      elseif textdata[textline][2]==4 then
        textline=textdata[textline][3]
        text=textdata[textline][1]
      elseif textdata[textline][2]==5 then
        if #p.stuff >= textdata[textline][3] then
          textline=textdata[textline][4]
          text=textdata[textline][1]
        else
          textline=textline+1
          text=textdata[textline][1]
        end
      elseif textdata[textline][2]==6 then

      elseif textdata[textline][2]==7 then
        p.stars=p.stars+1
        if p.stars == 3 then
          p.stuff[#p.stuff+1]=3
        end
        textline=textline+1
        text=textdata[textline][1]
      end
    end

    spaceKeyDown=true
  else
    spaceKeyDown=false
  end

  if leftKey and not rightKey then
    option=0
  end
  if rightKey and not leftKey then
    option=1
  end

  if stupidassKey then
    if #p.stuff >= 3 then
      textline=79
      text=textdata[textline][1]
    end
  end

end

function love.draw()
  love.graphics.setColor(1,1,1)
  love.graphics.rectangle('line', 2, 366, 508, 120)
  love.graphics.print(text, 4, 368)
  if #p.stuff > 0 then
    love.graphics.print("Your things:",2,2)
    for i=1,#p.stuff do
      love.graphics.print(itemnames[p.stuff[i]+1],2,i*16+2)
    end
  end
  if textdata[textline][2]==1 then
    if option==0 then love.graphics.setColor(1,1,0) else love.graphics.setColor(1,1,1) end
    love.graphics.rectangle('line', 126, 244, 128, 32)
    love.graphics.print(textdata[textline][3][1], 190-(#textdata[textline][3][1]*3), 252)
    if option==1 then love.graphics.setColor(1,1,0) else love.graphics.setColor(1,1,1) end
    love.graphics.rectangle('line', 258, 244, 128, 32)
    love.graphics.print(textdata[textline][4][1], 322-(#textdata[textline][3][1]*3), 252)
  end
end
