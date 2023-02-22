%%%%%%%%%%%%%%%%   Dictator game UI build %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                         Paul Stone                                     %%
%                     stone.123@wright.edu                               %%
%                   Wright State University                              %%
%                        October 2021                                    %%
%                                                                        %%
%    This file launches the UI with baic game instructions               %%
% It links from the pregame2_GUI and to Video_Baseline_UI.m              %%
%                                                                        %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function game_instructions_UI(GH,GW,GX,GY,HWXY,GBG,BBG,BH,BW,BXC,BXL,BXR,BY,Mgn,PW,cross_blUI, vidyes, device, n_stages, n_rounds, n_frequency,game_start_time,n_final_followers, uID, user_age,user_gender, date_str, slfshList, slfshScore, studyTable,studyfilecsv, studyfile, bln_start_flag, bln_end_flag,cltblnstrt1, cltblnstrt2, cltblnstrt3)

stepcount = 1;
% create the background figure
instructions_UI = uifigure('Position',HWXY,'Color',GBG);

%%%%%%%%%%%   Define all the text and labels for the instructions %%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ptATitle = "Game Instructions";
ptATitleLabel = uilabel(instructions_UI,'Position',[Mgn 540 PW 32],'Text',ptATitle,'FontSize',20,'FontWeight','bold','Visible','On');

ptA1a = "Our research aims to understand how leaders make decisions about resources. You can make money as you";
ptA1aLabel = uilabel(instructions_UI,'Position',[Mgn 500 PW 25],'Text',ptA1a,'FontSize',20,'Visible','On');
ptA1b = "play in the game and the amount earned will depend on your decisions as well as the decisions of other";
ptA1bLabel = uilabel(instructions_UI,'Position',[Mgn 475 PW 25],'Text',ptA1b,'FontSize',20,'Visible','On');
ptA1c = "participants playing in a separate room. Given theuse of EEG equipment, we cannot have all participants";
ptA1cLabel = uilabel(instructions_UI,'Position',[Mgn 450 PW 25],'Text',ptA1c,'FontSize',20,'Visible','On');
ptA1d = "in the lab at once, but other participants are playing the game like you are.";
ptA1dLabel = uilabel(instructions_UI,'Position',[Mgn 425 PW 25],'Text',ptA1d,'FontSize',20,'Visible','On');

ptA2a = "Importantly, every decision you make is independent of every other decision you make in the game.";
ptA2aLabel = uilabel(instructions_UI,'Position',[Mgn 385 PW 25],'Text',ptA2a,'FontSize',20,'Visible','On');
ptA2b = "That is, you can choose any option in any decision round.";
ptA2bLabel = uilabel(instructions_UI,'Position',[Mgn 360 PW 25],'Text',ptA2b,'FontSize',20,'Visible','On');

%%%%%%%%%%%%%%%%%%%%%%%% End Part A/Start Part B %%%%%%%%%%%%%%%%%%%%%%%%%%

ptBTitle = "In this game, there are two different roles - Employee, Leader:";
ptBTitleLabel = uilabel(instructions_UI,'Position',[Mgn 540 PW 32],'Text',ptBTitle,'FontSize',20,'FontWeight','bold','Visible','Off');

ptB1a = "Employees have a job, and work for a leader. The standard salary for an employee is 70 points. However,";
ptB1aLabel = uilabel(instructions_UI,'Position',[Mgn 500 PW 25],'Text',ptB1a,'FontSize',20,'Visible','Off');
ptB1b = "during each period, the head of the employee (i.e., the leader) has the opportunity to reduce or increase."; 
ptB1bLabel = uilabel(instructions_UI,'Position',[Mgn 475 PW 25],'Text',ptB1b,'FontSize',20,'Visible','Off');
ptB1c = "this salary (more information about this will follow)."; 
ptB1cLabel = uilabel(instructions_UI,'Position',[Mgn 450 PW 25],'Text',ptB1c,'FontSize',20,'Visible','Off');

ptB2a = "Each leader has an employee under his or her command. The standard salary for a leader is 100 points.";
ptB2aLabel = uilabel(instructions_UI,'Position',[Mgn 410 PW 25],'Text',ptB2a,'FontSize',20,'Visible','Off');
ptB2b = "However, by changing the salary of an employee, the leader can also change his or her own salary." ;
ptB2bLabel = uilabel(instructions_UI,'Position',[Mgn 385 PW 25],'Text',ptB2b,'FontSize',20,'Visible','Off');
ptB2c = "Importantly, the total amount of money that can be allocatedbetween the leader and employee will"  ;
ptB2cLabel = uilabel(instructions_UI,'Position',[Mgn 360 PW 25],'Text',ptB2c,'FontSize',20,'Visible','Off');
ptB2d = "change as a function of the leader’s decision (more information about this will follow)."  ;
ptB2dLabel = uilabel(instructions_UI,'Position',[Mgn 335 PW 25],'Text',ptB2d,'FontSize',20,'Visible','Off');

ptB3a = "Employees do not see their wages during the experiment. They cannot know what decision the leader takes.";
ptB3aLabel = uilabel(instructions_UI,'Position',[Mgn 295 PW 25],'Text',ptB3a,'FontSize',20,'Visible','Off');
ptB3b = "They will receive detailed information from each decision round at the end of the experiment, along with";
ptB3bLabel = uilabel(instructions_UI,'Position',[Mgn 270 PW 25],'Text',ptB3b,'FontSize',20,'Visible','Off');
ptB3c = "a final pay-out, yet they will never know who their leader was.";
ptB3cLabel = uilabel(instructions_UI,'Position',[Mgn 245 PW 25],'Text',ptB3c,'FontSize',20,'Visible','Off');

%%%%%%%%%%%%%%%%%%%%% Generate interface controls %%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

next_btn = uibutton(instructions_UI,'push','Text','Next','Visible','On','Position',[BXR, BY, BW, BH],'FontSize',18,...
    'BackgroundColor',BBG,'ButtonPushedFcn', @(next_btn,event) next_btn_push());
prev_btn = uibutton(instructions_UI,'push','Text','Back','Visible','Off','Position',[BXL, BY, BW, BH],'FontSize',18,...
    'BackgroundColor',BBG,'ButtonPushedFcn', @(prev_btn,event) prev_btn_push());

%%%%%%%%%%%%% submit button set to off until final step %%%%%%%%%%%%%%%%%%%
submit_btn = uibutton(instructions_UI,'push','Text','Proceed','Visible','Off','Position',[BXR, BY, BW, BH],'FontSize',18,...
'BackgroundColor',BBG,'ButtonPushedFcn', @(submit_btn,event) submit_btn_push());

%%%%%%%%%%%%%%%%%%%%% Control Functions %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% next button function
    function next_btn_push()

            set(prev_btn,'Visible','On')
            
            set(ptATitleLabel,'Visible','Off')          
            set(ptA1aLabel,'Visible','Off')
            set(ptA1bLabel,'Visible','Off')
            set(ptA1cLabel,'Visible','Off')
            set(ptA1dLabel,'Visible','Off')
            
            set(ptA2aLabel,'Visible','Off')
            set(ptA2bLabel,'Visible','Off')
            
            set(ptBTitleLabel,'Visible','On') 
            
            set(ptB1aLabel,'Visible','On')
            set(ptB1bLabel,'Visible','On')
            set(ptB1cLabel,'Visible','On')
            
            set(ptB2aLabel,'Visible','On')
            set(ptB2bLabel,'Visible','On')
            set(ptB2cLabel,'Visible','On')
            set(ptB2dLabel,'Visible','On')
            
            set(ptB3aLabel,'Visible','On')
            set(ptB3bLabel,'Visible','On')
            set(ptB3cLabel,'Visible','On')

            set(next_btn,'Visible','Off')
            set(submit_btn,'Visible','On')
    end

    function prev_btn_push()
        
            set(prev_btn,'Visible','Off')
            set(next_btn,'Visible','On')
            set(submit_btn,'Visible','Off')
            
            set(ptATitleLabel,'Visible','On')    
            
            set(ptA1aLabel,'Visible','On')
            set(ptA1bLabel,'Visible','On')
            set(ptA1cLabel,'Visible','On')
            set(ptA1dLabel,'Visible','On')
            
            set(ptA2aLabel,'Visible','On')
            set(ptA2bLabel,'Visible','On')

            set(ptBTitleLabel,'Visible','Off') 
            
            set(ptB1aLabel,'Visible','Off')
            set(ptB1bLabel,'Visible','Off')
            set(ptB1cLabel,'Visible','Off')
            
            set(ptB2aLabel,'Visible','Off')
            set(ptB2bLabel,'Visible','Off')
            set(ptB2cLabel,'Visible','Off')
            set(ptB2dLabel,'Visible','Off')

            set(ptB3aLabel,'Visible','Off')
            set(ptB3bLabel,'Visible','Off')
            set(ptB3cLabel,'Visible','Off')
    end

%%%%%%%%%%%% INTERNAL FUNCTION TO CHANGE TEXT AND CLOSE PANEL  %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%% ON PRESS OF THE BUTTON %%%%%%%%%%%%%%%%%%%%%%%%
    function submit_btn_push()
        close(instructions_UI); 
        
        callcross(cross_blUI,HWXY,GBG,BBG, Mgn,PW,BXC,BY,BW,BH)
        
        Video_Baseline_UI(GH,GW,GX,GY,HWXY,GBG,BBG,BH,BW,BXC,BXL,BXR,BY,Mgn,PW,cross_blUI, vidyes, device, n_stages, n_rounds, n_frequency,game_start_time,n_final_followers, uID, user_age,user_gender, date_str, slfshList, slfshScore, studyTable,studyfilecsv, studyfile, bln_start_flag, bln_end_flag,cltblnstrt1, cltblnstrt2, cltblnstrt3)    
    end           
end
