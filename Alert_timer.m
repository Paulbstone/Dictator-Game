function Alert_timer(message,GBG, BBG)

Alertmsg = uifigure('Position',[800 350 400 300], 'Color',GBG);
studyLabel = uilabel(Alertmsg,'Position',[50 100 300 100],'Text',...
    message,'FontSize',20,'HorizontalAlignment','Center');

pause(3)

close(Alertmsg)

end
