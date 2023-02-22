%%%%%%%%%%%%%%%%   Dictator game UI build %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                         Paul Stone                                     %%
%                     stone.123@wright.edu                               %%
%                   Wright State University                              %%
%                        October 2021                                    %%
%                                                                        %%
% This file launches the fourth of five debrief question screens         %%
%  These questions are additional to the core debrief                    %%
%                                                                        %%
% it launches from debrief_questions3.m and to debrief_questions5.m      %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function debrief_questions4(GH,GW,GX,GY,HWXY,GBG,BBG,BH,BW,BXC,BXL,BXR,BY,Mgn,PW,...
    UID, studyTableout, n_stages,n_rounds, n_frequency, n_final_followers,studyfilecsv, studyfile, q1dbans,q2dbans,q3dbans,q4dbans,q5dbans,q6dbans,q7dbans,q8dbans)

q9dbans="noanswer";
q10dbans="noanswer";
q11dbans="noanswer";
q12dbans="noanswer";


% create the initial UI interface
debrief_questions4UI = uifigure('Position',HWXY,'Color',GBG);

title = 'Debrief - Post Session Questions Part 4 (9-12 of 15)';

dbtitle = sprintf('%s',title);
mainTitle = uilabel(debrief_questions4UI,'Position',[Mgn 625 PW 50],'Text',dbtitle,'FontWeight','Bold');
set(mainTitle,'FontSize',20);
set(mainTitle, 'HorizontalAlignment','Center');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    Q 9  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
q9dbans="no answer";
Question9a = '9.	Developed countries pollute more CO2 per person than most developing countries and have larger economies to adapt to';
Question9b = 'climatic events easily. Do you agree that developed countries have a greater responsibility to apply more';
Question9c = 'regulations and contribute more money to global climate mitigation and adaptation?';

q9 = sprintf('%s\n%s\n%s',Question9a,Question9b,Question9c);
q9label = uilabel(debrief_questions4UI,'Position',[Mgn 560 PW 70],'Text',q9);
set(q9label,'FontSize',20);
set(q9label, 'HorizontalAlignment','Left');

%Radio button group q 1
q9rbs=uibuttongroup(debrief_questions4UI,'FontSize',12,'Position',[Mgn 500 PW 50],'BackgroundColor',GBG);

i1 = uiradiobutton(q9rbs,'Position',[10 5 175 30],'Tag','1','Value',0,'Text',' Strongly disagree','FontSize',18);
i2 = uiradiobutton(q9rbs,'Position',[225 5 175 30],'Tag','2','Value',0,'Text','Disagree','FontSize',18);
i3 = uiradiobutton(q9rbs,'Position',[390 5 175 30],'Tag','3','Value',0,'Text','Unsure/do not know','FontSize',18);
i4 = uiradiobutton(q9rbs,'Position',[605 5 175 30],'Tag','4','Value',0,'Text','Agree','FontSize',18);
i5 = uiradiobutton(q9rbs,'Position',[770 5 175 30],'Tag','5','Value',0,'Text','Strongly Agree','FontSize',18);

in = uiradiobutton(q9rbs,'Position',[0 0 2 2],'Tag','n','Value',1,'Text',' ','Visible','off'); % dummy button
set(q9rbs,'SelectionChangeFcn',@q9rbcbk);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    Q 9  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    Q 10  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
q10dbans="no answer";
Question10a = '10.	How much do you think climate change will threaten you and your family personally?';

q10 = sprintf('%s',Question10a);
q10label = uilabel(debrief_questions4UI,'Position',[Mgn 460 PW 30],'Text',q10);
set(q10label,'FontSize',20);
set(q10label, 'HorizontalAlignment','Left');

%Radio button group q 1
q10rbs=uibuttongroup(debrief_questions4UI,'FontSize',18,'Position',[Mgn 400 PW 50],'BackgroundColor',GBG);

j1 = uiradiobutton(q10rbs,'Position',[10 5 175 30],'Tag','1','Value',0,'Text','Very much','FontSize',18);
j2 = uiradiobutton(q10rbs,'Position',[225 5 175 30],'Tag','2','Value',0,'Text','Ocassionally','FontSize',18);
j3 = uiradiobutton(q10rbs,'Position',[390 5 175 30],'Tag','3','Value',0,'Text','Unsure/do not know','FontSize',18);
j4 = uiradiobutton(q10rbs,'Position',[605 5 175 30],'Tag','4','Value',0,'Text','Rarely','FontSize',18);
j5 = uiradiobutton(q10rbs,'Position',[770 5 175 30],'Tag','5','Value',0,'Text','Never','FontSize',18);

jn = uiradiobutton(q10rbs,'Position',[0 0 2 2],'Tag','n','Value',1,'Text',' ','Visible','off'); % dummy button
set(q10rbs,'SelectionChangeFcn',@q10rbcbk);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    Q 10  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    Q 11  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
q11dbans="no answer";
Question11a = '11.	How willing would you be to pay 5% more for things like gas, electricity, water, and taxes if you know those';
Question11b = 'funds would be used to create sustainable infrastructure, jobs, transportation, and energy production to mitigate';
Question11c = 'climate change?';

q11 = sprintf('%s\n%s\n%s',Question11a,Question11b,Question11c);
q11label = uilabel(debrief_questions4UI,'Position',[Mgn 320 PW 70],'Text',q11);
set(q11label,'FontSize',20);
set(q11label, 'HorizontalAlignment','Left');

%Radio button group q 11
q11rbs=uibuttongroup(debrief_questions4UI,'FontSize',12,'Position',[Mgn 260 PW 50],'BackgroundColor',GBG);

k1 = uiradiobutton(q11rbs,'Position',[10 5 175 30],'Tag','1','Value',0,'Text','Totally unwilling','FontSize',18);
k2 = uiradiobutton(q11rbs,'Position',[225 5 175 30],'Tag','2','Value',0,'Text','Unwilling','FontSize',18);
k3 = uiradiobutton(q11rbs,'Position',[390 5 175 30],'Tag','3','Value',0,'Text','Unsure/do not know','FontSize',18);
k4 = uiradiobutton(q11rbs,'Position',[605 5 175 30],'Tag','4','Value',0,'Text','Willing','FontSize',18);
k5 = uiradiobutton(q11rbs,'Position',[770 5 175 30],'Tag','5','Value',0,'Text','Completely willing','FontSize',18);

kn = uiradiobutton(q11rbs,'Position',[0 0 2 2],'Tag','n','Value',1,'Text',' ','Visible','off'); % dummy button
set(q11rbs,'SelectionChangeFcn',@q11rbcbk);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    Q 11  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    Q 12  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
q12dbans="no answer";
Question12a = '12.	Recently, a public official used their power and influence to vote against a bill regarding sustainable jobs ';
Question12b = 'and infrastructure which went against their voters’ concerns, because a firm contributed to their campaign. Do';
Question12c = 'you agree this official should be punished?';

q12 = sprintf('%s\n%s\n%s',Question12a,Question12b,Question12c);
q12label = uilabel(debrief_questions4UI,'Position',[Mgn 180 PW 70],'Text',q12);
set(q12label,'FontSize',20);
set(q12label, 'HorizontalAlignment','Left');

%Radio button group q 1
q12rbs=uibuttongroup(debrief_questions4UI,'FontSize',18,'Position',[Mgn 120 PW 50],'BackgroundColor',GBG);

l1 = uiradiobutton(q12rbs,'Position',[10 5 175 30],'Tag','1','Value',0,'Text',' Strongly disagree','FontSize',18);
l2 = uiradiobutton(q12rbs,'Position',[225 5 175 30],'Tag','2','Value',0,'Text','Disagree','FontSize',18);
l3 = uiradiobutton(q12rbs,'Position',[390 5 175 30],'Tag','3','Value',0,'Text','Unsure/do not know','FontSize',18);
l4 = uiradiobutton(q12rbs,'Position',[605 5 175 30],'Tag','4','Value',0,'Text','Agree','FontSize',18);
l5 = uiradiobutton(q12rbs,'Position',[770 5 175 30],'Tag','5','Value',0,'Text','Strongly Agree','FontSize',18);

ln = uiradiobutton(q12rbs,'Position',[0 0 2 2],'Tag','n','Value',1,'Text',' ','Visible','off'); % dummy button
set(q12rbs,'SelectionChangeFcn',@q12rbcbk);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    Q 12  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%

closedebriefBtn = uibutton(debrief_questions4UI,'push','Text','Next','Position',[BXC, BY, BW, BH],'BackgroundColor',BBG,'FontSize',18,...
    'ButtonPushedFcn', @(closedebriefBtn,event) closedebriefBtnpush());


    function closedebriefBtnpush() 
        close(debrief_questions4UI) 
        debrief_questions5(GH,GW,GX,GY,HWXY,GBG,BBG,BH,BW,BXC,BXL,BXR,BY,Mgn,PW,...
            UID, studyTableout, n_stages,n_rounds, n_frequency, n_final_followers,studyfilecsv, studyfile,q1dbans,q2dbans,q3dbans,q4dbans,q5dbans,q6dbans,q7dbans,q8dbans,q9dbans,q10dbans,q11dbans,q12dbans) 
    end

function q9rbcbk(source,eventdata)
    switch get(eventdata.NewValue,'tag') 
                  
        case '1' 
             q9dbans = "Strongly disagree";     
        case '2'     
             q9dbans = "Disagree";
        case '3' 
             q9dbans = "Unsure/do not know";     
        case '4'     
             q9dbans = "Agree";
         case '5'     
             q9dbans = "Strongly agree";
    end
    
    disp(q9dbans);
end 

function q10rbcbk(source,eventdata)
    switch get(eventdata.NewValue,'tag') 
                  
        case '1' 
             q10dbans = "Very much";     
        case '2'     
             q10dbans = "Occasionally";
        case '3' 
             q10dbans = "Unsure/do not know";     
        case '4'     
             q10dbans = "Rarely";
         case '5'     
             q10dbans = "Never";
    end
    
    disp(q10dbans);
end 

function q11rbcbk(source,eventdata)
    switch get(eventdata.NewValue,'tag') 
                  
        case '1' 
             q11dbans = "Totally unwilling";     
        case '2'     
             q11dbans = "unwilling";
        case '3' 
             q11dbans = "Unsure/do not know";     
        case '4'     
             q11dbans = "Willing";
         case '5'     
             q11dbans = "Completely willing";
    end
    
    disp(q11dbans);
end 
function q12rbcbk(source,eventdata)
    switch get(eventdata.NewValue,'tag') 
                  
        case '1' 
             q12dbans = "Strongly disagree";     
        case '2'     
             q12dbans = "Disagree";
        case '3' 
             q12dbans = "Unsure/do not know";     
        case '4'     
             q12dbans = "Agree";
         case '5'     
             q12dbans = "Strongly agree";
    end
    
    disp(q12dbans);
end 
end