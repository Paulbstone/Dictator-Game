%%%%%%%%%%%%%%%%   Dictator game UI build %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                         Paul Stone                                     %%
%                     stone.123@wright.edu                               %%
%                   Wright State University                              %%
%                        October 2021                                    %%
%                                                                        %%
%    This file launches the UI that collects baseline data               %%
% It links from the User_details_UI.m and to ctl_baselineUI.m            %%
%                                                                        %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%  %%%%%%%%%%%%%%%
%%%%%%  Data is then passed to the     %%%%%%%%%%%%%%%%%%%%%

function eeg_baselineUI(GH,GW,GX,GY,HWXY,GBG,BBG,BH,BW,BXC,BXL,BXR,BY,Mgn,PW,cross_blUI, vidyes, device, n_stages, n_rounds, n_frequency, n_final_followers, uID, user_age, user_gender, date_str, studyTable, studyfilecsv, studyfile)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% create the UI
baseline_UI = uifigure('Position',HWXY,'Color',GBG);

% create the title and text
uid_title = uilabel(baseline_UI,'Position',[Mgn 450 PW 25],'Text','We are first going to take a baseline reading of your “resting” brain activity to ensure the equipment is','HorizontalAlignment','Left');
uid_title.FontSize = 20;
uid_title2 = uilabel(baseline_UI,'Position',[Mgn 425 PW 25],'Text','attached appropriately. This will only take a second and we will do this a few times throughout the experiment.','HorizontalAlignment','Left');
uid_title2.FontSize = 20;
uid_title3 = uilabel(baseline_UI,'Position',[Mgn 400 PW 25],'Text','Please look at the cross that will appear appear on your screen momentarily.','HorizontalAlignment','Left');
uid_title3.FontSize = 20;
uid_title4 = uilabel(baseline_UI,'Position',[Mgn 375 PW 25],'Text','','HorizontalAlignment','Left');
uid_title4.FontSize = 20;

% create the button to start baseline assessment
startBaselineBtn = uibutton(baseline_UI,'push','Text','Start Baseline','Position',[BXC, BY, BW, BH],'BackgroundColor',BBG,'FontSize',18,...
    'ButtonPushedFcn', @(startBaselineBtn,event) startBaseline());
    
% This function runs on press of the button 
    function startBaseline()
        delete(startBaselineBtn)
        
        % Generate the baseline start flag for the .csv file  
        baseline_start = datetime('now','Format','HH:mm:ss'); 

        bln_start_flag = baseline_start;
        
        %WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS
        %    Write to Serial port to confirm start                        %
        %WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS
        
        sendcode = 12;  
        writedata(sendcode);
        
        %move cross to visible and back
        
        cross_blUI.Position =[0 15 1960 1045];
        set(cross_blUI,'Visible','Off') % required on/off to ensure the cross is on top
        set(cross_blUI,'Visible','On')
        senddata =10;
        writedata(senddata);
        close(baseline_UI);
        pause(3)

        % Generate the baseline start flag for the .csv file  
        baseline_end = datetime('now','Format','HH:mm:ss'); 
        bln_end_flag = baseline_end;
        
        cross_blUI.Position =[2000 15 1960 1045];
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%%%% Launch the commitment to lead baseline UI %%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        ctl_baselineUI(GH,GW,GX,GY,HWXY,GBG,BBG,BH,BW,BXC,BXL,BXR,BY,Mgn,PW,...
            cross_blUI, vidyes, device, n_stages, n_rounds, n_frequency,...
            n_final_followers, uID, user_age, user_gender, date_str, studyTable,...
            studyfilecsv, studyfile, bln_start_flag, bln_end_flag); 
    end
end
