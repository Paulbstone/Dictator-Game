%%%%%%%%%%%%%%%%   Dictator game UI build %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                         Paul Stone                                     %%
%                     stone.123@wright.edu                               %%
%                   Wright State University                              %%
%                        October 2021                                    %%
%                                                                        %%
% This file launches the third of five debrief question screens          %%
%                                                                        %%
%                                                                        %%
% it launches from debrief_questions2.m and to debrief_questions4.m      %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function debrief_questions3(GH,GW,GX,GY,HWXY,GBG,BBG,BH,BW,BXC,BXL,BXR,BY,Mgn,PW,UID, studyTableout, n_stages,n_rounds, n_frequency, n_final_followers,studyfilecsv, studyfile,q1dbans,q2dbans,q3dbans,q4dbans,q5dbans,q6dbans,q7dbans)

q8dbans="noanswer";

% create the initial UI interface
debrief_questions3UI = uifigure('Position',HWXY,'Color',GBG);

title = 'Debrief - Post Session Questions Part 3 (8 of 15)';

dbtitle = sprintf('%s',title);
mainTitle = uilabel(debrief_questions3UI,'Position',[Mgn 600 PW 50],'Text',dbtitle,'FontWeight','Bold');
set(mainTitle,'FontSize',20);
set(mainTitle, 'HorizontalAlignment','Center');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    Q 8  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
q8dbans="no answer";
Question8a = '8.	Please identify from the following relations, what you think the study investigated: ';


q8 = sprintf('%s\n%s',Question8a);
q8label = uilabel(debrief_questions3UI,'Position',[Mgn 530 PW 50],'Text',q8);
set(q8label,'FontSize',20);
set(q8label, 'HorizontalAlignment','Left');

%Radio button group q 1

q8rbs=uibuttongroup(debrief_questions3UI,'FontSize',12,'Position',[Mgn 150 PW 350],'BackgroundColor',GBG);


h1 = uiradiobutton(q8rbs,'Position',[Mgn 305 790 30],'Tag','1','Value',0,'Text',' a. The relation between monetary resources and decision making.','FontSize',18);
h2 = uiradiobutton(q8rbs,'Position',[Mgn 255 790 30],'Tag','2','Value',0,'Text',' b. The relation between monetary resources and power.','FontSize',18);
h3 = uiradiobutton(q8rbs,'Position',[Mgn 205 790 30],'Tag','3','Value',0,'Text',' c. The relation between subordinates and money.','FontSize',18);
h4 = uiradiobutton(q8rbs,'Position',[Mgn 155 790 30],'Tag','4','Value',0,'Text',' d. The relation between character and corruption.','FontSize',18);
h5 = uiradiobutton(q8rbs,'Position',[Mgn 105 790 30],'Tag','5','Value',0,'Text',' e. The relation between subordinates and decision making.','FontSize',18);
h6 = uiradiobutton(q8rbs,'Position',[Mgn 55 790 30],'Tag','6','Value',0,'Text',' f. The relation between power and character.','FontSize',18);
h7 = uiradiobutton(q8rbs,'Position',[Mgn 5 790 30],'Tag','7','Value',0,'Text',' g. The relation between power and corription.','FontSize',18);


hn = uiradiobutton(q8rbs,'Position',[0 0 2 2],'Tag','n','Value',1,'Text',' ','Visible','off'); % dummy button
%set(q1rbs,'selectedO',[]) % Initially no selection
set(q8rbs,'SelectionChangeFcn',@q8rbcbk);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    Q 8  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%

closedebriefBtn = uibutton(debrief_questions3UI,'push','Text','Next','Position',[BXC, BY, BW, BH],'BackgroundColor',BBG,'FontSize',18,...
    'ButtonPushedFcn', @(closedebriefBtn,event) closedebriefBtnpush());

    function closedebriefBtnpush() 
        close(debrief_questions3UI) 
        debrief_questions4(GH,GW,GX,GY,HWXY,GBG,BBG,BH,BW,BXC,BXL,BXR,BY,Mgn,PW,...
            UID, studyTableout, n_stages,n_rounds, n_frequency, n_final_followers,studyfilecsv, studyfile, q1dbans,q2dbans,q3dbans,q4dbans,q5dbans,q6dbans,q7dbans,q8dbans) 
    end


function q8rbcbk(source,eventdata)
    switch get(eventdata.NewValue,'tag') 
                  
        case '1' 
             q8dbans = "a";       
        case '2'     
             q8dbans = "b";           
        case '3'  
            q8dbans = "c";
        case '4'  
            q8dbans = "d";
        case '5'  
            q8dbans = "e";
        case '6'  
            q8dbans = "f";
        case '7'  
            q8dbans = "g";         
        case 'n'  
            q8dbans = "no answer";
    end
    disp(q8dbans);
end 




end