%%%%%%%%%%%%%%%%   Dictator game UI build %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                         Paul Stone                                     %%
%                     stone.123@wright.edu                               %%
%                   Wright State University                              %%
%                        October 2021                                    %%
%                                                                        %%
% This file launches the fifth of five debrief question screens          %%
%  These questions are additional to the core debrief                    %%
% The debrief question responses are all are saved to a txt file here    %%
%                                                                        %%
% it launches from debrief_questions4.m and to debrief.m                 %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function debrief_questions5(GH,GW,GX,GY,HWXY,GBG,BBG,BH,BW,BXC,BXL,BXR,BY,Mgn,PW,...
    UID, studyTableout, n_stages,n_rounds, n_frequency, n_final_followers,studyfilecsv, studyfile,q1dbans,q2dbans,q3dbans,q4dbans,q5dbans,q6dbans,q7dbans,q8dbans,q9dbans,q10dbans,q11dbans,q12dbans)

q13dbans="noanswer";
q14dbans="noanswer";
q15dbans="noanswer";

% create the initial UI interface
debrief_questions5UI = uifigure('Position',HWXY,'Color',GBG);

title = 'Debrief - Post Session Questions Part 5 (13-15 of 15)';

dbtitle = sprintf('%s',title);
mainTitle = uilabel(debrief_questions5UI,'Position',[Mgn 600 PW 50],'Text',dbtitle,'FontWeight','Bold');
set(mainTitle,'FontSize',20);
set(mainTitle, 'HorizontalAlignment','Center');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    Q 13  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
q13dbans="no answer";
Question13a = '13.	Do you agree that corporations have a greater responsibility to contribute resources, such as money,';
Question13b = 'towards sustainable development?';

q13 = sprintf('%s\n%s\n%s',Question13a,Question13b);
q13label = uilabel(debrief_questions5UI,'Position',[Mgn 540 PW 60],'Text',q13);
set(q13label,'FontSize',20);
set(q13label, 'HorizontalAlignment','Left');

%Radio button group q 1
q13rbs=uibuttongroup(debrief_questions5UI,'FontSize',12,'Position',[Mgn 490 PW 50],'BackgroundColor',GBG);

m1 = uiradiobutton(q13rbs,'Position',[10 5 175 30],'Tag','1','Value',0,'Text',' Strongly disagree','FontSize',18);
m2 = uiradiobutton(q13rbs,'Position',[225 5 175 30],'Tag','2','Value',0,'Text','Disagree','FontSize',18);
m3 = uiradiobutton(q13rbs,'Position',[390 5 175 30],'Tag','3','Value',0,'Text','Unsure/do not know','FontSize',18);
m4 = uiradiobutton(q13rbs,'Position',[605 5 175 30],'Tag','4','Value',0,'Text','Agree','FontSize',18);
m5 = uiradiobutton(q13rbs,'Position',[770 5 175 30],'Tag','5','Value',0,'Text','Strongly Agree','FontSize',18);

mn = uiradiobutton(q13rbs,'Position',[0 0 2 2],'Tag','n','Value',1,'Text',' ','Visible','off'); % dummy button
set(q13rbs,'SelectionChangeFcn',@q13rbcbk);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    Q 13  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    Q 14  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
q14dbans="no answer";
Question14a = '14.	In upcoming weeks, how likely will you tell family or friends to avoid buying a product because it uses';
Question14b = 'materials from endangered animals or causes damage to the environment, which increases climate change?';
q14 = sprintf('%s\n%s',Question14a,Question14b);
q14label = uilabel(debrief_questions5UI,'Position',[Mgn 420 PW 50],'Text',q14);
set(q14label,'FontSize',20);
set(q14label, 'HorizontalAlignment','Left');

%Radio button group q 1
q14rbs=uibuttongroup(debrief_questions5UI,'FontSize',12,'Position',[Mgn 360 PW 50],'BackgroundColor',GBG);

n1 = uiradiobutton(q14rbs,'Position',[10 5 175 30],'Tag','1','Value',0,'Text','Never','FontSize',18);
n2 =uiradiobutton(q14rbs,'Position',[225 5 175 30],'Tag','2','Value',0,'Text','Unlikely','FontSize',18);
n3 = uiradiobutton(q14rbs,'Position',[390 5 175 30],'Tag','3','Value',0,'Text','Unsure/do not know','FontSize',18);
n4 = uiradiobutton(q14rbs,'Position',[605 5 175 30],'Tag','4','Value',0,'Text','Likely','FontSize',18);
n5 = uiradiobutton(q14rbs,'Position',[770 5 175 30],'Tag','5','Value',0,'Text','Very Likely','FontSize',18);

nn = uiradiobutton(q14rbs,'Position',[0 0 2 2],'Tag','n','Value',1,'Text',' ','Visible','off'); % dummy button
set(q14rbs,'SelectionChangeFcn',@q14rbcbk);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    Q 14  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    Q 15  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%

q15dbans="no answer";
Question15a = '15. The results from this study will help create a proposal to send to local public officials about the urgent need of';
Question15b = 'stronger climate policy. How willing would you be to sign the supporting petition?';

q15 = sprintf('%s\n%s',Question15a,Question15b);
q15label = uilabel(debrief_questions5UI,'Position',[Mgn 280 PW 50],'Text',q15);
set(q15label,'FontSize',20);
set(q15label, 'HorizontalAlignment','Left');

%Radio button group q 11
q15rbs=uibuttongroup(debrief_questions5UI,'FontSize',18,'Position',[Mgn 220 PW 50],'BackgroundColor',GBG);

o1 = uiradiobutton(q15rbs,'Position',[10 5 175 30],'Tag','1','Value',0,'Text','Totally unwilling','FontSize',18);
o2 = uiradiobutton(q15rbs,'Position',[225 5 175 30],'Tag','2','Value',0,'Text','Unwilling','FontSize',18);
o3 = uiradiobutton(q15rbs,'Position',[390 5 175 30],'Tag','3','Value',0,'Text','Unsure/do not know','FontSize',18);
o4 = uiradiobutton(q15rbs,'Position',[605 5 175 30],'Tag','4','Value',0,'Text','Willing','FontSize',18);
o5 = uiradiobutton(q15rbs,'Position',[770 5 175 30],'Tag','5','Value',0,'Text','Completely willing','FontSize',18);

on = uiradiobutton(q15rbs,'Position',[0 0 2 2],'Tag','n','Value',1,'Text',' ','Visible','off'); % dummy button
set(q15rbs,'SelectionChangeFcn',@q15rbcbk);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    Q 15  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%


closedebriefBtn = uibutton(debrief_questions5UI,'push','Text','Next','Position',[BXC, BY, BW, BH],'BackgroundColor',BBG,'FontSize',18,...
    'ButtonPushedFcn', @(closedebriefBtn,event) closedebriefBtnpush());

    function closedebriefBtnpush() 
        
        %%%%%%%   SAVE DEBRIEF QUESIONS TO A TXT FILE  %%%%%%%%%%%%%%%%%%%%

        olduid = UID-1;
        debrief_output = [{"1"},{q1dbans};{"2"},q2dbans;{"3"},{q3dbans};{"4"},{q4dbans};{"5"},{q5dbans};{"6"},q6dbans;{"7"},{q7dbans};{"8"},{q8dbans};{"9"},{q9dbans};{"10"},q10dbans;{"11"},{q11dbans};{"12"},{q12dbans};{"13"},{q13dbans};{"14"},q14dbans;{"15"},{q15dbans}]; 
        debrief_output_table = cell2table(cellstr(debrief_output));                %Convert to table
        uIDtext = sprintf('user%d',olduid);
        %debrief_output_table.Properties.VariableNames = {uIDtext};          %Change variable name to uid
        filename=sprintf('Debrief_answers_User%d.txt',olduid);         %generate filename
        writetable(debrief_output_table,filename)           % output a file for the participant data to ensure a backup
           
        %%%%%%%%%%%%%%%%%%%%% Close debrief Qs and open final message %%%%%%%%%%%
        
        close(debrief_questions5UI)         
        debrief(GH,GW,GX,GY,HWXY,GBG,BBG,BH,BW,BXC,BXL,BXR,BY,Mgn,PW,...
            UID, studyTableout, n_stages,n_rounds, n_frequency, n_final_followers,...
            studyfilecsv, studyfile)                                        % call the User details UI ready for the next user     
        
    end

function q13rbcbk(source,eventdata)
    switch get(eventdata.NewValue,'tag') 
                  
        case '1' 
             q13dbans = "Strongly disagree";     
        case '2'     
             q13dbans = "Disagree";
        case '3' 
             q13dbans = "Unsure/do not know";     
        case '4'     
             q13dbans = "Agree";
         case '5'     
             q13dbans = "Strongly agree";
    end
    
    disp(q13dbans);
end 

function q14rbcbk(source,eventdata)
    switch get(eventdata.NewValue,'tag') 
                  
        case '1' 
             q14dbans = "Never";     
        case '2'     
             q14dbans = "Unlikely";
        case '3' 
             q14dbans = "Unsure/do not know";     
        case '4'     
             q14dbans = "Likely";
         case '5'     
             q14dbans = "Very likely";
    end
    
    disp(q14dbans);
end 

function q15rbcbk(source,eventdata)
    switch get(eventdata.NewValue,'tag') 
                  
        case '1' 
             q15dbans = "Totally unwilling";     
        case '2'     
             q15dbans = "unwilling";
        case '3' 
             q15dbans = "Unsure/do not know";     
        case '4'     
             q15dbans = "Willing";
         case '5'     
             q15dbans = "Completely willing";
    end
    
    disp(q15dbans);
end 

end