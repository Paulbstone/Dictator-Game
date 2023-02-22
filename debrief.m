%%%%%%%%%%%%%%%%   Dictator game UI build %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                         Paul Stone                                     %%
%                     stone.123@wright.edu                               %%
%                   Wright State University                              %%
%                        October 2021                                    %%
%                                                                        %%
% This file launches the debrief info screen                             %%
% After a delay to prevent participant button press,                     %%
% continue and exit buttons are presented to the researcher              %%
%                                                                        %%
% it launches from debrief_questions5.m                                  %%
% If continue is pressed the game resets and loops back to Vid_select.m  %%
% if close study is pressed, the game closes all windows                 %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function debrief(GH,GW,GX,GY,HWXY,GBG,BBG,BH,BW,BXC,BXL,BXR,BY,Mgn,PW,...
    uID, studyTableout, n_stages,n_rounds, n_frequency, n_final_followers,studyfilecsv, studyfile)           

% create the initial UI interface
debrief_UI = uifigure('Position',HWXY,'Color',GBG);

titleLine1 = 'In general, our research aims to understand how (and why) leaders make decisions about monetary resources. Specifically,';
titleLine2 = 'the game design allowed us to increase the power of the leaders across each decision period (through number of followers';
titleLine3 = 'and decision options). We expect that as leaders gain more power, their decisions would become more corrupt meaning they';
titleLine4 = 'would contravene the social norm of what a responsible leader would do to ultimately gain more money. There is experimental';
titleLine5 = 'evidence that this indeed happens as power is considered to be a strong social force that affects how leaders make decisions.';
titleLine6 = 'For some of our leaders, we had them watch a video clip from the movie Invictus, which recounts an important event in the life';
titleLine7 = 'of Nelson Mandela, South Africa’s first democratically elected leader in the 1990s. Those who watched this clip were asked to';
titleLine8 = 'Identify certain behaviors exhibited by Mandela during his first day on the job. These behaviors are all considered to be ';
titleLine9 = 'virtues and together, create a model of what it means to be a leader of character. Our hope is that those exposed to these  ';
titleLine10 = 'behaviors and that video would make less corrupt decisions as they played the game, even while their power was increasing.';


titleText = sprintf('%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s',titleLine1,titleLine2,titleLine3,titleLine4,titleLine5,titleLine6,titleLine7,titleLine8,titleLine9,titleLine10);
mainTitle = uilabel(debrief_UI,'Position',[Mgn 250 PW+20 300],'Text',titleText);
set(mainTitle,'FontSize',18);
set(mainTitle, 'HorizontalAlignment','Left');

titleLine2a = 'You are now officially done with the experiment. Please let the experimenter know if you have any additional questions or';
titleLine2b = 'concerns about your participation in this experiment. We sincerely appreciate you taking part in it! ';

titleText2 = sprintf('%s\n%s',titleLine2a,titleLine2b);
mainTitle2 = uilabel(debrief_UI,'Position',[Mgn 200 PW 50],'Text',titleText2);
set(mainTitle2,'FontSize',18);
set(mainTitle2, 'HorizontalAlignment','Left');

pause(2) %20

titleLine3a = 'Research team, please wait for the game to re-initialize';

titleText3 = sprintf('%s',titleLine3a);
mainTitle2 = uilabel(debrief_UI,'Position',[Mgn 100 PW 50],'Text',titleText3);
set(mainTitle2,'FontSize',18);
set(mainTitle2, 'HorizontalAlignment','Left');

pause(2) %20

set(mainTitle2,'Text','Game re-initialization complete, select an option');
set(mainTitle2,'Color','Green');


continuestudybtn = uibutton(debrief_UI,'push','Text','Continue Study','Position',[BXL, BY, BW, BH],'FontSize',18,...
    'BackgroundColor','green','ButtonPushedFcn', @(continuestudybtn,event) continuestudybtnpush());

closedestudybtn = uibutton(debrief_UI,'push','Text','Close Study','Position',[BXR, BY, BW, BH],'FontSize',18,...
    'BackgroundColor','red','ButtonPushedFcn', @(closedestudybtn,event) closedestudybtnpush());

    function continuestudybtnpush() 
       % close any open figures

        all_fig = findall(0, 'type', 'figure');
        close(all_fig)    
        
        % loop back to vid select UI 
        
        vid_select_UI(GH,GW,GX,GY,HWXY,GBG,BBG,BH,BW,BXC,BXL,BXR,BY,Mgn,PW,...
            uID, studyTableout, n_stages,n_rounds, n_frequency, n_final_followers,studyfilecsv, studyfile)  

    end

    function closedestudybtnpush() 
        
        % close any open figures

        all_fig = findall(0, 'type', 'figure');
        close(all_fig)

    end
end