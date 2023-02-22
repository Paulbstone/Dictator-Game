%%%%%%%%%%%%%%%%   Dictator game UI build %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                         Paul Stone                                     %%
%                     stone.123@wright.edu                               %%
%                   Wright State University                              %%
%                        October 2021                                    %%
%                                                                        %%
% This file launches the second of five debrief question screens         %%
%                                                                        %%
%                                                                        %%
% it launches from debrief_questions1.m and to debrief_questions3.m      %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function debrief_questions2(GH,GW,GX,GY,HWXY,GBG,BBG,BH,BW,BXC,BXL,BXR,BY,Mgn,PW,UID, studyTableout, n_stages,n_rounds, n_frequency, n_final_followers,studyfilecsv, studyfile,q1dbans,q2dbans,q3dbans)

q4dbans="noanswer";
q5dbans="noanswer";
q6dbans="noanswer";
q7dbans="noanswer";

% create the initial UI interface
debrief_questions2UI = uifigure('Position',HWXY,'Color',GBG);

title = 'Debrief - Post Session Questions Part 2 (4-7 of 15)';

dbtitle = sprintf('%s',title);
mainTitle = uilabel(debrief_questions2UI,'Position',[Mgn 600 PW 50],'Text',dbtitle,'FontWeight','Bold');
set(mainTitle,'FontSize',20);
set(mainTitle, 'HorizontalAlignment','Center');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    Q 4  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
q4dbans="no answer";
Question4a = '4.	If you were in the role of leader, on a scale from 1 (not at all) to 7 (very much), how powerful did you feel';
Question4b = 'while you played the game? ';

q4 = sprintf('%s\n%s',Question4a,Question4b);
q4label = uilabel(debrief_questions2UI,'Position',[Mgn 540 PW 50],'Text',q4);
set(q4label,'FontSize',20);
set(q4label, 'HorizontalAlignment','Left');

%Radio button group q 1

q4rbs=uibuttongroup(debrief_questions2UI,'FontSize',18,'Position',[Mgn 480 PW 50],'BackgroundColor',GBG);

d8 = uiradiobutton(q4rbs,'Position',[100 5 60 30],'Tag','8','Value',0,'Text','N/A','FontSize',18);
d1 = uiradiobutton(q4rbs,'Position',[200 5 40 30],'Tag','1','Value',0,'Text','1 ','FontSize',18);
d2 = uiradiobutton(q4rbs,'Position',[300 5 40 30],'Tag','2','Value',0,'Text','2','FontSize',18);
d3 = uiradiobutton(q4rbs,'Position',[400 5 40 30],'Tag','3','Value',0,'Text','3','FontSize',18);
d4 = uiradiobutton(q4rbs,'Position',[500 5 40 30],'Tag','4','Value',0,'Text','4','FontSize',18);
d5 = uiradiobutton(q4rbs,'Position',[600 5 40 30],'Tag','5','Value',0,'Text','5','FontSize',18);
d6 = uiradiobutton(q4rbs,'Position',[700 5 40 30],'Tag','6','Value',0,'Text','6','FontSize',18);
d7 = uiradiobutton(q4rbs,'Position',[800 5 40 30],'Tag','7','Value',0,'Text','7','FontSize',18);


dn = uiradiobutton(q4rbs,'Position',[0 0 2 2],'Tag','n','Value',1,'Text',' ','Visible','off'); % dummy button
%set(q1rbs,'selectedO',[]) % Initially no selection
set(q4rbs,'SelectionChangeFcn',@q4rbcbk);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    Q 4  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    Q 5  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
q5dbans="no answer";

Question5a = '5.	If you were in the role of leader, did you feel more powerful as you kept playing the game?';
Question5b = 'Yes, No, Maybe (unsure), not in role of leader:';

q5 = sprintf('%s\n%s',Question5a,Question5b);
q5label = uilabel(debrief_questions2UI,'Position',[Mgn 415 PW 50],'Text',q5);
set(q5label,'FontSize',20);
set(q5label, 'HorizontalAlignment','Left');

%Radio button group q 5

q5rbs  = uibuttongroup(debrief_questions2UI,'FontSize',18,'Position',[Mgn 355 PW 50],'BackgroundColor',GBG);

e1 = uiradiobutton(q5rbs,'Position',[100 5 180 30],'Tag','1','Value',0,'Text','Yes','FontSize',18);
e2 = uiradiobutton(q5rbs,'Position',[300 5 180 30],'Tag','2','Value',0,'Text','No','FontSize',18);
e3 = uiradiobutton(q5rbs,'Position',[500 5 180 30],'Tag','3','Value',0,'Text','Maybe (Unsure)','FontSize',18);
e4 = uiradiobutton(q5rbs,'Position',[700 5 180 30],'Tag','4','Value',0,'Text','Not in role of leader','FontSize',18);

bn = uiradiobutton(q5rbs,'Position',[0 0 2 2],'Tag','n','Value',1,'Text',' ','Visible','off'); % dummy button
set(q5rbs,'SelectionChangeFcn',@q5rbcbk);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    Q 5  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    Q 6  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
q6dbans="no answer";

Question6a = '6.	Do you see power as: responsibility or freedom?';


q6 = sprintf('%s\n%s',Question6a);
q6label = uilabel(debrief_questions2UI,'Position',[Mgn 280 PW 50],'Text',q6);
set(q6label,'FontSize',20);
set(q6label, 'HorizontalAlignment','Left');

%Radio button group q 1

q6rbs  = uibuttongroup(debrief_questions2UI,'FontSize',12,'Position',[Mgn 240 PW 50],'BackgroundColor',GBG);

f1 = uiradiobutton(q6rbs,'Position',[300 5 290 30],'Tag','1','Value',0,'Text','Responsibility','FontSize',18);
f2 = uiradiobutton(q6rbs,'Position',[600 5 290 30],'Tag','2','Value',0,'Text','Power','FontSize',18);

bn = uiradiobutton(q6rbs,'Position',[0 0 2 2],'Tag','n','Value',1,'Text',' ','Visible','off'); % dummy button

    function q3Changed(q3text) 
        q3text=q3response.Value;  
        disp(q3text)
    end


set(q6rbs,'SelectionChangeFcn',@q6rbcbk);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    Q 6  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    Q 7  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
q7dbans="no answer";
Question7a = '7.	On a scale from 1 (not really) to 7 (very much so), do you see yourself as a person of character?';

q7 = sprintf('%s\n%s',Question7a);
q7label = uilabel(debrief_questions2UI,'Position',[Mgn 175 PW 50],'Text',q7);
set(q7label,'FontSize',20);
set(q7label, 'HorizontalAlignment','Left');

%Radio button group q 1

q7rbs=uibuttongroup(debrief_questions2UI,'FontSize',12,'Position',[Mgn 135 PW 50],'BackgroundColor',GBG);

g1 = uiradiobutton(q7rbs,'Position',[100 5 40 30],'Tag','1','Value',0,'Text','1','FontSize',18);
g2 = uiradiobutton(q7rbs,'Position',[225 5 40 30],'Tag','2','Value',0,'Text','2','FontSize',18);
g3 = uiradiobutton(q7rbs,'Position',[350 5 40 30],'Tag','3','Value',0,'Text','3','FontSize',18);
g4 = uiradiobutton(q7rbs,'Position',[475 5 40 30],'Tag','4','Value',0,'Text','4','FontSize',18);
g5 = uiradiobutton(q7rbs,'Position',[600 5 40 30],'Tag','5','Value',0,'Text','5','FontSize',18);
g6 = uiradiobutton(q7rbs,'Position',[725 5 40 30],'Tag','6','Value',0,'Text','6','FontSize',18);
g7 = uiradiobutton(q7rbs,'Position',[850 5 40 30],'Tag','7','Value',0,'Text','7','FontSize',18);
dn = uiradiobutton(q7rbs,'Position',[0 0 2 2],'Tag','n','Value',1,'Text',' ','Visible','off'); % dummy button

set(q7rbs,'SelectionChangeFcn',@q7rbcbk);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    Q 7  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%

closedebriefBtn = uibutton(debrief_questions2UI,'push','Text','Next','Position',[BXC, BY, BW, BH],'FontSize',18,...
    'BackgroundColor',BBG,'ButtonPushedFcn', @(closedebriefBtn,event) closedebriefBtnpush());

    function closedebriefBtnpush() 
        close(debrief_questions2UI) 
        debrief_questions3(GH,GW,GX,GY,HWXY,GBG,BBG,BH,BW,BXC,BXL,BXR,BY,Mgn,PW,...
            UID, studyTableout, n_stages,n_rounds, n_frequency, n_final_followers,studyfilecsv, studyfile, q1dbans,q2dbans,q3dbans,q4dbans,q5dbans,q6dbans,q7dbans) 
    end


function q4rbcbk(source,eventdata)
    switch get(eventdata.NewValue,'tag') 
                  
        case '1' 
             q4dbans = 1;       
        case '2'     
             q4dbans = 2;           
        case '3'  
            q4dbans = 3;
        case '4'  
            q4dbans = 4;
        case '5'  
            q4dbans = 5;
        case '6'  
            q4dbans = 6;
        case '7'  
            q4dbans = 7;
         case '8'  
            q4dbans = "n/a";           
        case 'n'  
            q4dbans = "no answer";
    end
    disp(q4dbans);
end 

function q5rbcbk(source,eventdata)
    switch get(eventdata.NewValue,'tag') 
                  
        case '1' 
             q5dbans = "yes";     
        case '2'     
             q5dbans = "no";
        case '3' 
             q5dbans = "maybe";     
        case '4'     
             q5dbans = "not in role of leader";
    end
    
    disp(q5dbans);
end 

function q6rbcbk(source,eventdata)
    switch get(eventdata.NewValue,'tag')   
        case '1' 
             q6dbans = "Responsibility";

        case '2'     
             q6dbans = "Power";
    end
        disp(q6dbans);
end 

function q7rbcbk(source,eventdata)
    switch get(eventdata.NewValue,'tag') 
                  
        case '1' 
             q7dbans = 1;       
        case '2'     
             q7dbans = 2;           
        case '3'  
            q7dbans = 3;
        case '4'  
            q7dbans = 4;
        case '5'  
            q7dbans = 5;
        case '6'  
            q7dbans = 6;
        case '7'  
            q7dbans = 7;       
        case 'n'  
            q7dbans = "no answer";
    end
    disp(q7dbans);
end 



end