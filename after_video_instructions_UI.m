%%%%%%%%%%%%%%%%   Dictator game UI build %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                         Paul Stone                                     %%
%                     stone.123@wright.edu                               %%
%                   Wright State University                              %%
%                        October 2021                                    %%
%                                                                        %%
%    This file launches further, specific game instructiosn              %%
% It links from the Post_vid_quiz.m and to pregame_quiz_UI.m             %%
%                                                                        %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function after_video_instructions_UI(GH,GW,GX,GY,HWXY,GBG,BBG,BH,BW,BXC,BXL,BXR,BY,Mgn,PW,...
    cross_blUI, vidyes, device, n_stages, n_rounds, n_frequency,...
    game_start_time,n_final_followers, uID, user_age,user_gender, date_str, slfshList, slfshScore,...
    studyTable,studyfilecsv, studyfile, bln_start_flag, bln_end_flag,cltblnstrt1, cltblnstrt2, cltblnstrt3, all_repsonses,behaviours_observed)

stepcount = 1;
% create the background figure
After_video_instructions_UI = uifigure('Position',HWXY,'Color',GBG);

ptCTitle = "Payment Options";
ptCTitleLabel = uilabel(After_video_instructions_UI,'Position',[Mgn 575 PW 32],'Text',ptCTitle,'FontSize',20,'FontWeight','bold','Visible','On');

ptC1a = "The leader has a salary of 100 points in the first decision period. On the other hand, the employee has a salary of 70 points in";
ptC1aLabel = uilabel(After_video_instructions_UI,'Position',[Mgn 525 PW 25],'Text',ptC1a,'FontSize',18,'Visible','On');
ptC1b = "the first decision period. However, the leader can change their salary and that of his/her employee according to the";
ptC1bLabel = uilabel(After_video_instructions_UI,'Position',[Mgn 500 PW 25],'Text',ptC1b,'FontSize',18,'Visible','On');
ptC1c = "following three options:";
ptC1cLabel = uilabel(After_video_instructions_UI,'Position',[Mgn 475 PW 25],'Text',ptC1c,'FontSize',18,'Visible','On');

ptC2a = "Do nothing:";
ptC2aLabel = uilabel(After_video_instructions_UI,'Position',[Mgn 425 PW 25],'Text',ptC2a,'FontSize',18, 'FontWeight','bold','Visible','On');
ptC2b = "If the leader decides to do nothing, the leader and the employees receive their standard wages, i.e., a salary of 100 points for";
ptC2bLabel = uilabel(After_video_instructions_UI,'Position',[Mgn 400 PW 25],'Text',ptC2b,'FontSize',18,'Visible','On');
ptC2c = "the leader, and 70 points for the employee";
ptC2cLabel = uilabel(After_video_instructions_UI,'Position',[Mgn 375 PW 25],'Text',ptC2c,'FontSize',18,'Visible','On');    

ptC3a = "Increase the salary of the employee:";
ptC3aLabel = uilabel(After_video_instructions_UI,'Position',[Mgn 325 PW 24],'Text',ptC3a,'FontSize',18, 'FontWeight','bold','Visible','On');
ptC3b = "The leader can increase the salary of the employee by 20 points. However, this will cost him/her 10 points. Therefore, if the";
ptC3bLabel = uilabel(After_video_instructions_UI,'Position',[Mgn 300 PW 24],'Text',ptC3b,'FontSize',18,'Visible','On');
ptC3c = "leader chooses this option, the employee receives 90 points and the leader also receives 90 points."; 
ptC3cLabel = uilabel(After_video_instructions_UI,'Position',[Mgn 275 PW 24],'Text',ptC3c,'FontSize',18,'Visible','On');
    
ptC4a = "Reduce the salary of the employee:";
ptC4aLabel = uilabel(After_video_instructions_UI,'Position',[Mgn 225 PW 24],'Text',ptC4a,'FontSize',18, 'FontWeight','bold','Visible','On');
ptC4b = "The leader also has the opportunity to reduce the employee’s salary by 60 points. In this case, the leader receives a salary";
ptC4bLabel = uilabel(After_video_instructions_UI,'Position',[Mgn 200 PW 24],'Text',ptC4b,'FontSize',18,'Visible','On');
ptC4c = "increase of 50 points. Therefore, if the leader chooses this option, the leader gets 150 points, and the employee gets 10 points.";
ptC4cLabel = uilabel(After_video_instructions_UI,'Position',[Mgn 175 PW+25 24],'Text',ptC4c,'FontSize',18,'Visible','On');

%%%%%%%%%%%%%%%%%%%%%%%% End Part C/Start Part D %%%%%%%%%%%%%%%%%%%%%%%%%%

ptDTitle = "Instructions continued...";
ptDTitleLabel = uilabel(After_video_instructions_UI,'Position',[Mgn 575 PW 32],'Text',ptDTitle,'FontSize',18,'Visible','Off');

ptD1a = "According to the participants in the experiment, a responsible leader would endorse the “do nothing” option.";
ptD1aLabel = uilabel(After_video_instructions_UI,'Position',[Mgn 525 PW 25],'Text',ptD1a,'FontSize',18,'Visible','Off');

ptD2a = "Also, as you see in these three different options, the total amount allocated across both the leader and employee changes";
ptD2aLabel = uilabel(After_video_instructions_UI,'Position',[Mgn 475 PW 25],'Text',ptD2a,'FontSize',18,'Visible','Off');
ptD2b = "depending on the leader’s decision. For example, if the leader chooses to do nothing, the total amount of points that is";
ptD2bLabel = uilabel(After_video_instructions_UI,'Position',[Mgn 450 PW 25],'Text',ptD2b,'FontSize',18,'Visible','Off');
ptD2c = "split is 170, whereas if the leader increases or reduces their employee’s salary, the total amounts are 180 points and";
ptD2cLabel = uilabel(After_video_instructions_UI,'Position',[Mgn 425 PW 25],'Text',ptD2c,'FontSize',18,'Visible','Off');
ptD2d = "160 points respectively.";
ptD2dLabel = uilabel(After_video_instructions_UI,'Position',[Mgn 400 PW 25],'Text',ptD2d,'FontSize',18,'Visible','Off');


ptD3a = "We are now going to start the first decision round of the game.";
ptD3aLabel = uilabel(After_video_instructions_UI,'Position',[Mgn 350 PW 25],'Text',ptD3a,'FontSize',18,'Visible','Off');

ptD4a = "Please remember that you may make money as you play and that the earnings will be calculated in points. These points";
ptD4aLabel = uilabel(After_video_instructions_UI,'Position',[Mgn 300 PW+25 25],'Text',ptD4a,'FontSize',18,'Visible','Off','FontWeight','bold');
ptD4b = "will then be converted into US Dollars at the end of the game. The rate exchange in this game is: 100 Points = $1.00.";
ptD4bLabel = uilabel(After_video_instructions_UI,'Position',[Mgn 275 PW+25 25],'Text',ptD4b,'FontSize',18,'Visible','Off','FontWeight','bold');
%%%%%%%%%%%%%%%%%%%%% Generate interface controls %%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

next_btn = uibutton(After_video_instructions_UI,'push','Text','Next','Visible','On','Position',[BXR, BY, BW, BH],'FontSize',18,...
    'BackgroundColor',BBG,'ButtonPushedFcn', @(next_btn,event) next_btn_push());
prev_btn = uibutton(After_video_instructions_UI,'push','Text','Back','Visible','Off','Position',[BXL, BY, BW, BH],'FontSize',18,...
    'BackgroundColor',BBG,'ButtonPushedFcn', @(prev_btn,event) prev_btn_push());
%%%%%%%%%%%%% submit button set to off until final step %%%%%%%%%%%%%%%%%%%
submit_btn = uibutton(After_video_instructions_UI,'push','Text','Proceed','Visible','Off','Position',[BXR, BY, BW, BH],'FontSize',18,...
    'BackgroundColor',BBG,'ButtonPushedFcn', @(submit_btn,event) submit_btn_push());


%%%%%%%%%%%%%%%%%%%%% Control Functions %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% next button function
    function next_btn_push()

            set(prev_btn,'Visible','On')
            
            set(ptCTitleLabel,'Visible','Off')          
            set(ptC1aLabel,'Visible','Off')
            set(ptC1bLabel,'Visible','Off')
            set(ptC1cLabel,'Visible','Off')
            
            
            set(ptC2aLabel,'Visible','Off')
            set(ptC2bLabel,'Visible','Off')
            set(ptC2cLabel,'Visible','Off')
            
            set(ptC3aLabel,'Visible','Off')
            set(ptC3bLabel,'Visible','Off')
            set(ptC3cLabel,'Visible','Off')
            
            set(ptC4aLabel,'Visible','Off')
            set(ptC4bLabel,'Visible','Off')
            set(ptC4cLabel,'Visible','Off')
            
            
            set(ptDTitleLabel,'Visible','On') 
            
            set(ptD1aLabel,'Visible','On')
            
            set(ptD2aLabel,'Visible','On')
            set(ptD2bLabel,'Visible','On')
            set(ptD2cLabel,'Visible','On')
            set(ptD2dLabel,'Visible','On')
            
            
            set(ptD3aLabel,'Visible','On')
            
            set(ptD4aLabel,'Visible','On')
            set(ptD4bLabel,'Visible','On')

            set(next_btn,'Visible','Off')
            set(submit_btn,'Visible','On')
    end

    function prev_btn_push()
        
            
            set(ptCTitleLabel,'Visible','On')          
            set(ptC1aLabel,'Visible','On')
            set(ptC1bLabel,'Visible','On')
            set(ptC1cLabel,'Visible','On')
             
            set(ptC2aLabel,'Visible','On')
            set(ptC2bLabel,'Visible','On')
            set(ptC2cLabel,'Visible','On')
            
            set(ptC3aLabel,'Visible','On')
            set(ptC3bLabel,'Visible','On')
            set(ptC3cLabel,'Visible','On')
            
            set(ptC4aLabel,'Visible','On')
            set(ptC4bLabel,'Visible','On')
            set(ptC4cLabel,'Visible','On')
            
            
            set(ptDTitleLabel,'Visible','Off') 
            
            set(ptD1aLabel,'Visible','Off')
            
            set(ptD2aLabel,'Visible','Off')
            set(ptD2bLabel,'Visible','Off')
            set(ptD2cLabel,'Visible','Off')
            set(ptD2dLabel,'Visible','Off')
            
            set(ptD3aLabel,'Visible','Off')
            
            set(ptD4aLabel,'Visible','Off')
            set(ptD4bLabel,'Visible','Off')
            
            set(prev_btn,'Visible','Off')
            set(next_btn,'Visible','On')
            set(submit_btn,'Visible','Off')

    end

%%%%%%%%%%%% INTERNAL FUNCTION TO CHANGE TEXT AND CLOSE PANEL  %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%% ON PRESS OF THE BUTTON %%%%%%%%%%%%%%%%%%%%%%%%
    function submit_btn_push()
        close(After_video_instructions_UI);         
        
        %Open the post video quiz to capture the user responses
        
        
        pregame_quiz_UI(GH,GW,GX,GY,HWXY,GBG,BBG,BH,BW,BXC,BXL,BXR,BY,Mgn,PW,...
            cross_blUI, vidyes, device, n_stages, n_rounds, n_frequency,...
            game_start_time,n_final_followers, uID, user_age,user_gender, date_str,...
            slfshList, slfshScore, studyTable,studyfilecsv, studyfile, bln_start_flag,...
            bln_end_flag,cltblnstrt1, cltblnstrt2, cltblnstrt3,all_repsonses,behaviours_observed) 
    end           
end
