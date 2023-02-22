%%%%%%%%%%%%%%%%   Dictator game UI build %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                         Paul Stone                                     %%
%                     stone.123@wright.edu                               %%
%                   Wright State University                              %%
%                        October 2021                                    %%
%                                                                        %%
% This file launches the first of five debrief question screens          %%
%                                                                        %%
%                                                                        %%
% it launches from the build+main_game.m and to debrief_questions2.m     %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function debrief_questions1(GH,GW,GX,GY,HWXY,GBG,BBG,BH,BW,BXC,BXL,BXR,BY,Mgn,PW,UID, studyTableout, n_stages,n_rounds, n_frequency, n_final_followers,studyfilecsv, studyfile)

% create the initial UI interface
debrief_questions1UI = uifigure('Position',HWXY,'Color',GBG);

title = 'Debrief - Post Session Questions Part 1 (1-3 of 15)';

dbtitle = sprintf('%s',title);
mainTitle = uilabel(debrief_questions1UI,'Position',[Mgn 600 PW 50],'Text',dbtitle,'FontWeight','Bold');
set(mainTitle,'FontSize',20);
set(mainTitle, 'HorizontalAlignment','Center');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    Q 1  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
q1dbans="noanswer";
Question1a = '1.	On a scale from 1 (a little) to 7 (a lot), how much did you appreciate being in the role (leader or follower)';
Question1b = 'that was randomly assigned to you?';

q1 = sprintf('%s\n%s',Question1a,Question1b);
q1label = uilabel(debrief_questions1UI,'Position',[Mgn 530 PW 50],'Text',q1);
set(q1label,'FontSize',20);
set(q1label, 'HorizontalAlignment','Left');

%Radio button group q 1

q1rbs=uibuttongroup(debrief_questions1UI,'FontSize',18,'Position',[Mgn 480 PW 50],'BackgroundColor',GBG);

a1 = uiradiobutton(q1rbs,'Position',[100 5 40 30],'Tag','1','Value',0,'Text','1','FontSize',18);
a2 = uiradiobutton(q1rbs,'Position',[225 5 40 30],'Tag','2','Value',0,'Text','2','FontSize',18);
a3 = uiradiobutton(q1rbs,'Position',[350 5 40 30],'Tag','3','Value',0,'Text','3','FontSize',18);
a4 = uiradiobutton(q1rbs,'Position',[475 5 40 30],'Tag','4','Value',0,'Text','4','FontSize',18);
a5 = uiradiobutton(q1rbs,'Position',[600 5 40 30],'Tag','5','Value',0,'Text','5','FontSize',18);
a6 = uiradiobutton(q1rbs,'Position',[725 5 40 30],'Tag','6','Value',0,'Text','6','FontSize',18);
a7 = uiradiobutton(q1rbs,'Position',[850 5 40 30],'Tag','7','Value',0,'Text','7','FontSize',18);
an = uiradiobutton(q1rbs,'Position',[0 0 2 2],'Tag','n','Value',1,'Text',' ','Visible','off'); % dummy button

set(q1rbs,'SelectionChangeFcn',@q1rbcbk);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    Q 1  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    Q 2  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
q2dbans="noanswer";

Question2a = '2.	Did you notice that the payment options were the same for each decision period of the game:';
Question2b = 'yes or no?';

q2 = sprintf('%s\n%s',Question2a,Question2b);
q2label = uilabel(debrief_questions1UI,'Position',[Mgn 390 PW 50],'Text',q2);
set(q2label,'FontSize',20);
set(q2label, 'HorizontalAlignment','Left');

%Radio button group q 1

q2rbs  = uibuttongroup(debrief_questions1UI,'FontSize',12,'Position',[Mgn 340 PW 50],'BackgroundColor',GBG);

b1 = uiradiobutton(q2rbs,'Position',[150 5 50 30],'Tag','1','Value',0,'Text','Yes','FontSize',18);
b2 = uiradiobutton(q2rbs,'Position',[400 5 50 30],'Tag','2','Value',0,'Text','No','FontSize',18);
b3 = uiradiobutton(q2rbs,'Position',[650 5 100 30],'Tag','3','Value',0,'Text','Unsure','FontSize',18);

bn = uiradiobutton(q2rbs,'Position',[0 0 2 2],'Tag','n','Value',1,'Text',' ','Visible','off'); % dummy button
set(q2rbs,'SelectionChangeFcn',@q2rbcbk);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    Q 2  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    Q 3  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
q3dbans="noanswer";

Question3a = '3.	You were asked to watch a video at the beginning of the game. If you were in the role of leader, did';
Question3b = 'what you observe impact the decisions you made – and if so, in what way?';

q3 = sprintf('%s\n%s',Question3a,Question3b);
q3label = uilabel(debrief_questions1UI,'Position',[Mgn 250 PW 50],'Text',q3);
set(q3label,'FontSize',20);
set(q3label, 'HorizontalAlignment','Left');

%Radio button group q 1

q3rbs  = uibuttongroup(debrief_questions1UI,'FontSize',12,'Position',[Mgn 150 PW 100],'BackgroundColor',GBG);

c1 = uiradiobutton(q3rbs,'Position',[300 55 50 30],'Tag','1','Value',0,'Text','Yes','FontSize',18);
c2 = uiradiobutton(q3rbs,'Position',[600 55 50 30],'Tag','2','Value',0,'Text','No','FontSize',18);

bn = uiradiobutton(q3rbs,'Position',[0 0 2 2],'Tag','n','Value',1,'Text',' ','Visible','off'); % dummy button

q3text="";

q3response = uieditfield(debrief_questions1UI,'text','Position',[Mgn+5 155 PW-10 50],'FontSize',18,'ValueChangedFcn',@(q3response,event) q3Changed(q3text));

closedebriefBtn = uibutton(debrief_questions1UI,'push','Text','Next','Position',[BXC, BY, BW, BH],'BackgroundColor',BBG,'FontSize',18,...
    'ButtonPushedFcn', @(closedebriefBtn,event) closedebriefBtnpush());

    function q3Changed(q3text) 
        q3text=q3response.Value;  
        disp(q3text)
        q3dbans=q3text;
    end

set(q3rbs,'SelectionChangeFcn',@q3rbcbk);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    Q 3  END %%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    function closedebriefBtnpush() 
        close(debrief_questions1UI) 
        debrief_questions2(GH,GW,GX,GY,HWXY,GBG,BBG,BH,BW,BXC,BXL,BXR,BY,Mgn,PW,...
            UID, studyTableout, n_stages,n_rounds, n_frequency, n_final_followers,studyfilecsv, studyfile, q1dbans,q2dbans,q3dbans) 
    end

function q1rbcbk(source,eventdata)
    switch get(eventdata.NewValue,'tag') 
                  
        case '1' 
             q1dbans = 1;       
        case '2'     
             q1dbans = 2;           
        case '3'  
            q1dbans = 3;
        case '4'  
            q1dbans = 4;
        case '5'  
            q1dbans = 5;
        case '6'  
            q1dbans = 6;
        case '7'  
            q1dbans = 7;
        case 'n'  
            q1dbans = "no answer";
    end
    disp(q1dbans);
end 

function q2rbcbk(source,eventdata)
    switch get(eventdata.NewValue,'tag') 
                  
        case '1' 
             q2dbans = "yes";     
        case '2'     
             q2dbans = "no";
       case '3'     
             q2dbans = "unsure";  
    end
    
    disp(q2dbans);
end 

function q3rbcbk(source,eventdata)
    switch get(eventdata.NewValue,'tag')   
        case '1' 
             q3dbans = q3text;
        case '2'     
             q3dbans = "no";
    end
        disp(q3dbans);
end 


end