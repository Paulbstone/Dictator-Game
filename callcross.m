        
function callcross(cross_blUI,HWXY,GBG,BBG, Mgn,PW,BXC,BY,BW,BH)

    Cross_Message = uifigure('Position',HWXY,'Color',GBG);

    ptA1a = "We are going to take another baseline reading of your resting brain activity to ensure the equipment is ";
    ptA1aLabel = uilabel(Cross_Message,'Position',[Mgn 480 PW 25],'Text',ptA1a,'FontSize',20,'Visible','On');
    ptA1b = "attached appropriately. This will only take a second and we will do this a few times throughout the";
    ptA1bLabel = uilabel(Cross_Message,'Position',[Mgn 455 PW 25],'Text',ptA1b,'FontSize',20,'Visible','On');
    ptA1c = "experiment. Please look at the cross that will appear on your screen momentarily";
    ptA1cLabel = uilabel(Cross_Message,'Position',[Mgn 430 PW 25],'Text',ptA1c,'FontSize',20,'Visible','On');

    close_btn = uibutton(Cross_Message,'push','Text','Ok','Visible','On','Position',[BXC, BY, BW, BH],'FontSize',18,...
        'BackgroundColor',BBG,'ButtonPushedFcn', @(close_btn,event) close_btn_push());

    waitfor(Cross_Message);

set(cross_blUI,'Visible','Off') % these lines needed to ensure cross appears on top and smooth on/off
pause(0.1)
cross_blUI.Position =[0 15 1960 1045];
set(cross_blUI,'Visible','On')
senddata =10;
writedata(senddata);

pause(3)

cross_blUI.Position =[2000 15 1960 1045];

senddata =12;
writedata(senddata);

    function close_btn_push()
        close(Cross_Message)
    end
end




