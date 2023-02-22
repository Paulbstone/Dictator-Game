        
function finalcross(cross_blUI,HWXY,GBG,BBG, Mgn,PW,BXC,BY,BW,BH)

    Cross_final_Message = uifigure('Position',HWXY,'Color',GBG);

        ptA1a = "Before you begin the debrief, we are going to take one final baseline reading of your resting brain activity";
        ptA1aLabel = uilabel(Cross_final_Message,'Position',[Mgn 380 PW 25],'Text',ptA1a,'FontSize',20,'Visible','On');
        ptA1b = "to ensure the equipment is attached appropriately. Please look at the cross that will appear on your";
        ptA1bLabel = uilabel(Cross_final_Message,'Position',[Mgn 356 PW 25],'Text',ptA1b,'FontSize',20,'Visible','On');
        ptA1c = "screen momentarily";
        ptA1cLabel = uilabel(Cross_final_Message,'Position',[Mgn 332 PW 25],'Text',ptA1c,'FontSize',20,'Visible','On');

        close_btn = uibutton(Cross_final_Message,'push','Text','Ok','Visible','On','Position',[BXC, BY, BW, BH],'BackgroundColor',BBG,...
            'FontSize',18,'ButtonPushedFcn', @(close_btn,event) close_btn_push());

    waitfor(Cross_final_Message);
    
set(cross_blUI,'Visible','Off')
cross_blUI.Position =[0 15 1960 1045];

pause(0.1)
set(cross_blUI,'Visible','On')
senddata =10;
writedata(senddata);

pause(3)
cross_blUI.Position =[2000 15 1960 1045];

senddata =12;
writedata(senddata);

    function close_btn_push()
        close(Cross_final_Message)
    end
end