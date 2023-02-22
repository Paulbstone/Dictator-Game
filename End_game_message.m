function End_game_message(GH,GW,GX,GY,HWXY,GBG,BBG,BH,BW,BXC,BXL,BXR,BY,Mgn,PW)

    End_game_message = uifigure('Position',HWXY,'Color',GBG);

   
    ptATitle = "Thank you for playing this game!";
    ptATitleLabel = uilabel(End_game_message,'Position',[Mgn 440 PW 32],'Text',ptATitle,'FontSize',20,'FontWeight','bold','Visible','On','HorizontalAlignment','Center');
    
    ptA1a = "The experimenter will now calculate how much money you have earned by taking part in the game based on";
    ptA1aLabel = uilabel(End_game_message,'Position',[Mgn 380 PW 24],'Text',ptA1a,'FontSize',20,'Visible','On');
    ptA1b = "the decisions made and will update you on this shortly. In the meantime, there are a few final questions we";
    ptA1bLabel = uilabel(End_game_message,'Position',[Mgn 356 PW 24],'Text',ptA1b,'FontSize',20,'Visible','On');
    ptA1c = "would like you to complete and the experimenter will disconnect the EEG equipment and answer any";
    ptA1cLabel = uilabel(End_game_message,'Position',[Mgn 332 PW 24],'Text',ptA1c,'FontSize',20,'Visible','On');
    ptA1d = "additional questions you may have.";
    ptA1dLabel = uilabel(End_game_message,'Position',[Mgn 308 PW 24],'Text',ptA1d,'FontSize',20,'Visible','On');               

    closeeg_btn = uibutton(End_game_message,'push','Text','Close','Visible','On','Position',[BXC, BY, BW, BH],'BackgroundColor',BBG,'FontSize',18,...
        'ButtonPushedFcn', @(closeeg_btn,event) closeeg_btn_push());

    waitfor(End_game_message)  

    function closeeg_btn_push()
        close(End_game_message)
    end


end
