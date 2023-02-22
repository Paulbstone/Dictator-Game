function Alert(message,GBG, BBG)

message=sprintf(message);

Alertmsg = uifigure('Position',[800 350 400 300], 'Color',GBG);
studyLabel = uilabel(Alertmsg,'Position',[50 100 300 120],'Text',...
    message,'FontSize',20,'HorizontalAlignment','Center');

Alert_Close_btn = uibutton(Alertmsg,'push','Text','Ok','Position',[150, 50, 100, 50],'FontSize',18,...
    'BackgroundColor',BBG,'ButtonPushedFcn', @(Alert_Close_btn,event) Alert_Close_btn_push());

waitfor(Alertmsg);

    function Alert_Close_btn_push()
        close(Alertmsg)
    end

end
