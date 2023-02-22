%%%%%%%%%%%%%%%%   Dictator game UI build %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                         Paul Stone                                     %%
%                     stone.123@wright.edu                               %%
%                   Wright State University                              %%
%                        October 2021                                    %%
%                                                                        %%
%    This file launches the UI that plays the ctl audio baselines        %%
% It links from the to ctl_baselineUI.m  and to the pregame2_gui.m       %%
%                                                                        %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ~~~~~~ IMPORTANT: change the time of CTL audio here  ~~~~~~~~~~~~~~~~~~

function ctl_baselineUI(GH,GW,GX,GY,HWXY,GBG,BBG,BH,BW,BXC,BXL,BXR,BY,Mgn,PW,cross_blUI, vidyes, device, n_stages, n_rounds, n_frequency, n_final_followers, uID, user_age, user_gender, date_str, studyTable, studyfilecsv, studyfile, bln_start_flag, bln_end_flag)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% THIS IS THE TIME FOR THE CTL AUDIO TRACKS - CHANGE TO 80s for build  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

audiotime = 2; %80 or short for test runs

% create the figure
ctl_baseline_UI = uifigure('Position',HWXY,'Color',GBG);

% create the title
uid_title2 = uilabel(ctl_baseline_UI,'Position',[Mgn 450 PW 25],'Text','Now, we are going to get an initial recording of how your brain responds to sound. We will have you listen to','HorizontalAlignment','Left');
uid_title2.FontSize = 20;

uid_title3 = uilabel(ctl_baseline_UI,'Position',[Mgn 425 PW 25],'Text','a number of phrases that will be read aloud to you. Please listen to each phrase you hear in a relaxed, yet','HorizontalAlignment','Left');
uid_title3.FontSize = 20;

uid_title4 = uilabel(ctl_baseline_UI,'Position',[Mgn 400 PW 25],'Text','attentive state. We ask that you look at the cross at center of the screen and keep your gaze steady','HorizontalAlignment','Left');
uid_title4.FontSize = 20;

uid_title5 = uilabel(ctl_baseline_UI,'Position',[Mgn 375 PW 25],'Text','throughout. This portion of the experiment takes about five minutes so please ensure you remaing sitting','HorizontalAlignment','Left');
uid_title5.FontSize = 20;

uid_title6 = uilabel(ctl_baseline_UI,'Position',[Mgn 350 PW 25],'Text','comfortably as you listen to the phrases.','HorizontalAlignment','Left');
uid_title6.FontSize = 20;

uid_title7 = uilabel(ctl_baseline_UI,'Position',[Mgn 325 PW 25],'Text','','HorizontalAlignment','Left');
uid_title7.FontSize = 20;

uid_title8 = uilabel(ctl_baseline_UI,'Position',[Mgn 300 PW 25],'Text','','HorizontalAlignment','Left');
uid_title8.FontSize = 20;


% load data for the 3 audio files
[data1,Fs1] = audioread('aspiration.mp3');
[data2,Fs2] = audioread('Engagement.mp3');
[data3,Fs3] = audioread('Sacrifice.mp3');

% build the buttons to start each audio CTL baseline
startctlBaselineBtn = uibutton(ctl_baseline_UI,'push','Text','Baseline 2 part A','Position',[BXC, BY, BW, BH],'FontSize',18,...
    'BackgroundColor',BBG,'ButtonPushedFcn', @(startctlBaselineBtn,event) startctlBaseline());
startctlBaselineBtn2 = uibutton(ctl_baseline_UI,'push','Text','Baseline 2 part B','Position',[BXC, BY, BW, BH],'FontSize',18,...
    'BackgroundColor',BBG,'ButtonPushedFcn', @(startctlBaselineBtn2,event) startctlBaseline2());
startctlBaselineBtn3 = uibutton(ctl_baseline_UI,'push','Text','Baseline 2 part C','Position',[BXC, BY, BW, BH],'FontSize',18,...
    'BackgroundColor',BBG,'ButtonPushedFcn', @(startctlBaselineBtn3,event) startctlBaseline3());

%hide and disable the buttons not in use 
set(startctlBaselineBtn2,'enable','off')
set(startctlBaselineBtn2,'visible','off')              
set(startctlBaselineBtn3,'enable','off')
set(startctlBaselineBtn3,'visible','off') 
cltblnstrt1 = "";
cltblnstrt2 = "";
cltblnstrt3 = "";


%%%%%%% execute this code when the CTL start button 1-3 is pressed  %%%%%%%
%%%%%%%%%%%%%%%%%%%%%% - contatins com write lines %%%%%%%%%%%%%%%%%%%%%%%%

    function startctlBaseline()
        
        delete(startctlBaselineBtn)                                         %remove the baseline 1 start button
                                                    
        sound(data1, Fs1)                                                   %set the sound file
        time_secs = audiotime;                                              %reset the time of the ctl audio
        ctl_baseline_start1 = datetime('now','Format','HH:mm:ss');          %recor
        cltblnstrt1=ctl_baseline_start1;
        
            %WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS 
            %     Write to Serial port to confirm start ctl 1                       
            %WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS
            sendcode = 20;
            writedata(sendcode);

        while time_secs > 0
            pause(1);
            time_secs = time_secs -1;
            time_text = int2str(time_secs);
            time_label.Text = time_text;
        end

        if time_secs == 0
            clear sound
            %WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS 
            %            Write to Serial port to confirm end ctl 1                      
            %WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS
            sendcode = 22;
            writedata(sendcode);
                      
            %set next button enabled and visible
            set(startctlBaselineBtn2,'enable','on')
            set(startctlBaselineBtn2,'visible','on') 
        else
        end
        
    end

    function startctlBaseline2()
        delete(startctlBaselineBtn2)
        sound(data2, Fs2)
        time_secs = audiotime;
        ctl_baseline_start2 = datetime('now','Format','HH:mm:ss'); 
        cltblnstrt2=ctl_baseline_start2;
        
        %WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS 
        %            Write to Serial port to confirm start ctl 2                       
        %WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS
        sendcode = 20;
        writedata(sendcode);
    
        while time_secs > 0
            pause(1);
            time_secs = time_secs -1;
            time_text = int2str(time_secs);
            time_label.Text = time_text;
        end

        if time_secs == 0
             clear sound
             %WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS 
             %            Write to Serial port to confirm end ctl 2                       
             %WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS
             sendcode = 22;
             writedata(sendcode);
                        
             % set new button enabled and visible
             set(startctlBaselineBtn3,'enable','on')
             set(startctlBaselineBtn3,'visible','on')           
        end
    end

    function startctlBaseline3()
        
        delete(startctlBaselineBtn3)
        sound(data3, Fs3)
        time_secs = audiotime;
        ctl_baseline_start3 = datetime('now','Format','HH:mm:ss'); 
        cltblnstrt3=ctl_baseline_start3;
    
        %WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS 
        %            Write to Serial port to confirm start                       
        %WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS
        sendcode = 20;
        writedata(sendcode);
        
        while time_secs > 0
            pause(1);
            time_secs = time_secs -1;
            time_text = int2str(time_secs);
            time_label.Text = time_text;
        end

        if time_secs == 0
            clear sound
            %WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS 
            %            Write to Serial port to confirm start                       
            %WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS
            sendcode = 22;
            writedata(sendcode);

            
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            %%%%%% Launch the pregame practice baseline UI %%%%%%%%%%%%%%
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            disp(cltblnstrt1)
            disp(cltblnstrt2)
            disp(cltblnstrt3)
            disp(bln_start_flag)
            disp(bln_end_flag)
            
            pregame2_GUI(GH,GW,GX,GY,HWXY,GBG,BBG,BH,BW,BXC,BXL,BXR,BY,Mgn,PW,cross_blUI, vidyes, device,...
                n_stages, n_rounds, n_frequency, n_final_followers, uID, user_age, user_gender, date_str,...
                studyTable, studyfilecsv, studyfile, bln_start_flag, bln_end_flag, cltblnstrt1, cltblnstrt2, cltblnstrt3); %Open next figure
            close(ctl_baseline_UI);
        else
            
        end
        
    end

end
