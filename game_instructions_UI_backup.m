%%%%% Dictator game UI build %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                         Paul Stone                                     %%
%                   Wright State University                              %%
%                        December 2020                                   %%
%                                                                        %%
%%%%% This file launches the UI that allows user to play an %%%%%%%%%%%%%%%
%%%%%   intro game to familiarize with the types of decision   %%%%%%%%%%%%
%%%%%%%%%%%%%%%  Data is then passed to the main game UI   %%%%%%%%%%%%%%%%

function game_instructions_UI_backup(cross_blUI, vidyes, device, n_stages, n_rounds, n_frequency,game_start_time,n_final_followers, uID, user_age,user_gender, date_str, slfshList, slfshScore, studyTable,studyfilecsv, studyfile, bln_start_flag, bln_end_flag,cltblnstrt1, cltblnstrt2, cltblnstrt3)

stepcount = 1;
% create the background figure
instructions_UI = uifigure('Position',[500 200 1000 500]);

%n_stages, n_rounds, n_frequency,game_start_time,n_final_followers, uID, user_age,user_gender, date_str, slfshList, slfshScore, studyTable,studyfilecsv, studyfile

%%%%%%%%%%%   Define all the text and labels for the instructions %%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ptATitle = "Game Instructions";
ptATitleLabel = uilabel(instructions_UI,'Position',[40 440 900 32],'Text',ptATitle,'FontSize',18,'FontWeight','bold','Visible','On');

  

ptA1a = "Our research aims to understand how leaders make decisions about resources. You can make money as you play in the game and the";
ptA1aLabel = uilabel(instructions_UI,'Position',[40 400 920 24],'Text',ptA1a,'FontSize',15,'Visible','On');
ptA1b = "amount earned will depend on your decisions as well as the decisions of other participants playing in a separate room. Given";
ptA1bLabel = uilabel(instructions_UI,'Position',[40 376 920 24],'Text',ptA1b,'FontSize',15,'Visible','On');
ptA1c = "the use of EEG equipment, we cannot have all participants in the lab at once, but other participants are playing the";
ptA1cLabel = uilabel(instructions_UI,'Position',[40 352 920 24],'Text',ptA1c,'FontSize',15,'Visible','On');
ptA1d = "game like you are.";
ptA1dLabel = uilabel(instructions_UI,'Position',[40 328 920 24],'Text',ptA1d,'FontSize',15,'Visible','On');


ptA2a = "In the game, the earnings will be calculated in points, and those points will then be converted into US Dollars at the end of";
ptA2aLabel = uilabel(instructions_UI,'Position',[40 264 920 24],'Text',ptA2a,'FontSize',15,'Visible','On');
ptA2b = "the game. The rate exchange in this game is: 100 Points = $1.00";
ptA2bLabel = uilabel(instructions_UI,'Position',[40 240 920 24],'Text',ptA2b,'FontSize',15,'Visible','On');

ptA3a = "In this game, there are two different roles: Employee, Leader";
ptA3aLabel = uilabel(instructions_UI,'Position',[40 200 920 24],'Text',ptA3a,'FontSize',15,'Visible','On');

%%%%%%%%%%%%%%%%%%%%%%%% End Part A/Start Part B %%%%%%%%%%%%%%%%%%%%%%%%%%

ptBTitle = "Here is the detailed description of what these different roles mean in the game:";
ptBTitleLabel = uilabel(instructions_UI,'Position',[56 440 920 32],'Text',ptBTitle,'FontSize',18,'FontWeight','bold','Visible','Off');

ptB1a = "Employees have a job, and work for a leader. The standard salary for an employee is 70 points. However, during each period, the";
ptB1aLabel = uilabel(instructions_UI,'Position',[40 400 920 24],'Text',ptB1a,'FontSize',15,'Visible','Off');
ptB1b = "head of the employee (i.e., the leader) has the opportunity to reduce or increase this salary (more information about this will follow)."; 
ptB1bLabel = uilabel(instructions_UI,'Position',[40 376 920 24],'Text',ptB1b,'FontSize',15,'Visible','Off');

ptB2a = "Each leader has an employee under his or her command. The standard salary for a leader is 100 points. However, by changing the";
ptB2aLabel = uilabel(instructions_UI,'Position',[40 336 920 24],'Text',ptB2a,'FontSize',15,'Visible','Off');
ptB2b = "salary of an employee, the leader can also change his or her own salary. Importantly, the total amount of money that can be allocated" ;
ptB2bLabel = uilabel(instructions_UI,'Position',[40 312 920 24],'Text',ptB2b,'FontSize',15,'Visible','Off');
ptB2c = "between the leader and employee will change as a function of the leader’s decision (more information about this will follow)."  ;
ptB2cLabel = uilabel(instructions_UI,'Position',[40 288 920 24],'Text',ptB2c,'FontSize',15,'Visible','Off');

ptB3a = "Employees do not see their wages during the experiment. They cannot know what decision the leader takes. They will receive";
ptB3aLabel = uilabel(instructions_UI,'Position',[40 248 920 24],'Text',ptB3a,'FontSize',15,'Visible','Off');
ptB3b = "detailed information from each decision round at the end of the experiment, along with a final pay-out, ";
ptB3bLabel = uilabel(instructions_UI,'Position',[40 224 920 24],'Text',ptB3b,'FontSize',15,'Visible','Off');
ptB3c = "yet they will never know who their leader was.";
ptB3cLabel = uilabel(instructions_UI,'Position',[40 200 920 24],'Text',ptB3c,'FontSize',15,'Visible','Off');

%%%%%%%%%%%%%%%%%%%%%%%% End Part B/Start Part C%%%%%%%%%%%%%%%%%%%%%%%%%%

ptCTitle = "Payment Options";
ptCTitleLabel = uilabel(instructions_UI,'Position',[40 440 920 32],'Text',ptCTitle,'FontSize',18,'FontWeight','bold','Visible','Off');

ptC1a = "The leader has a salary of 100 points in the first decision period. On the other hand, the employee has a salary of 70 points in";
ptC1aLabel = uilabel(instructions_UI,'Position',[40 400 920 24],'Text',ptC1a,'FontSize',15,'Visible','Off');
ptC1b = "the first decision period. However, the leader can change their salary and that of his/her employee according to the following three options:";
ptC1bLabel = uilabel(instructions_UI,'Position',[40 376 920 24],'Text',ptC1b,'FontSize',15,'Visible','Off');

ptC2a = "Do nothing:";
ptC2aLabel = uilabel(instructions_UI,'Position',[40 336 920 24],'Text',ptC2a,'FontSize',15, 'FontWeight','bold','Visible','Off');
ptC2b = "If the leader decides to do nothing, the leader and the employees receive their standard wages, i.e., a salary of 100 points for";
ptC2bLabel = uilabel(instructions_UI,'Position',[40 312 920 24],'Text',ptC2b,'FontSize',15,'Visible','Off');
ptC2c = "the leader, and 70 points for the employee";
ptC2cLabel = uilabel(instructions_UI,'Position',[40 288 920 24],'Text',ptC2c,'FontSize',15,'Visible','Off');    

ptC3a = "Increase the salary of the employee:";
ptC3aLabel = uilabel(instructions_UI,'Position',[40 248 920 24],'Text',ptC3a,'FontSize',15, 'FontWeight','bold','Visible','Off');
ptC3b = "The leader can increase the salary of the employee by 20 points. However, this will cost him/her 10 points. Therefore, if the";
ptC3bLabel = uilabel(instructions_UI,'Position',[40 224 920 24],'Text',ptC3b,'FontSize',15,'Visible','Off');
ptC3c = "leader chooses this option, the employee receives 90 points and the leader also receives 90 points."; 
ptC3cLabel = uilabel(instructions_UI,'Position',[40 200 920 24],'Text',ptC3c,'FontSize',15,'Visible','Off');
    
ptC4a = "Reduce the salary of the employee:";
ptC4aLabel = uilabel(instructions_UI,'Position',[40 160 920 24],'Text',ptC4a,'FontSize',15, 'FontWeight','bold','Visible','Off');
ptC4b = "The leader also has the opportunity to reduce the employee’s salary by 60 points. In this case, the leader receives a salary increase";
ptC4bLabel = uilabel(instructions_UI,'Position',[40 136 920 24],'Text',ptC4b,'FontSize',15,'Visible','Off');
ptC4c = "of 50 points. Therefore, if the leader chooses this option, the leader gets 150 points, and the employee gets 10 points.";
ptC4cLabel = uilabel(instructions_UI,'Position',[40 112 920 24],'Text',ptC4c,'FontSize',15,'Visible','Off');

%%%%%%%%%%%%%%%%%%%%%%%% End Part C/Start Part D %%%%%%%%%%%%%%%%%%%%%%%%%%

ptDTitle = "Instructions continued...";
ptDTitleLabel = uilabel(instructions_UI,'Position',[40 440 920 32],'Text',ptDTitle,'FontSize',15,'Visible','Off');

ptD1a = "According to the participants in the experiment, a responsible leader would endorse the “do nothing” option.";
ptD1aLabel = uilabel(instructions_UI,'Position',[40 400 920 24],'Text',ptD1a,'FontSize',15,'Visible','Off');

ptD2a = "Also, as you see in these three different options, the total amount allocated across both the leader and employee changes depending";
ptD2aLabel = uilabel(instructions_UI,'Position',[40 360 920 24],'Text',ptD2a,'FontSize',15,'Visible','Off');
ptD2b = "on the leader’s decision. For example, if the leader chooses to do nothing, the total amount of points that is split is 170, whereas";
ptD2bLabel = uilabel(instructions_UI,'Position',[40 336 920 24],'Text',ptD2b,'FontSize',15,'Visible','Off');
ptD2c = "if the leader increases or reduces their employee’s salary, the total amounts are 180 points and 160 points respectively. ";
ptD2cLabel = uilabel(instructions_UI,'Position',[40 312 920 24],'Text',ptD2c,'FontSize',15,'Visible','Off');

ptD3a = "We are now going to start the first decision round of the game.";
ptD3aLabel = uilabel(instructions_UI,'Position',[40 272 920 24],'Text',ptD3a,'FontSize',15,'Visible','Off','FontWeight','bold');

ptD4a = "Please remember that you may make money as you play and that the earnings will be calculated in points. These points will then ";
ptD4aLabel = uilabel(instructions_UI,'Position',[40 232 920 24],'Text',ptD4a,'FontSize',15,'Visible','Off','FontWeight','bold');
ptD4b = "be converted into US Dollars at the end of the game. The rate exchange in this game is: 100 Points = $1.00.";
ptD4bLabel = uilabel(instructions_UI,'Position',[40 208 920 24],'Text',ptD4b,'FontSize',15,'Visible','Off','FontWeight','bold');

%%%%%%%%%%%%%%%%%%%%% Generate interface controls %%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

next_btn = uibutton(instructions_UI,'push','Text','next','Visible','On','Position',[768, 24, 160, 40],'ButtonPushedFcn', @(next_btn,event) next_btn_push());
prev_btn = uibutton(instructions_UI,'push','Text','back','Visible','Off','Position',[72, 24, 160, 40],'ButtonPushedFcn', @(prev_btn,event) prev_btn_push());
%%%%%%%%%%%%% submit button set to off until final step %%%%%%%%%%%%%%%%%%%
submit_btn = uibutton(instructions_UI,'push','Text','Start Game','Visible','Off','Position',[768, 24, 160, 40],'ButtonPushedFcn', @(submit_btn,event) submit_btn_push());

%confirmText1 = "Please check this box to confirm you have read and understood these instructions.";
%confirmText2 = "You can go back to review now or at any time during the game by clicking INSTRUCTIONS.";
%confirmLabel1 = uilabel(instructions_UI,'Position',[208 104 584 24],'Text',confirmText1,'FontSize',14,'Visible','Off');
%confirmLabel2 = uilabel(instructions_UI,'Position',[208 80 584 24],'Text',confirmText2,'FontSize',14,'Visible','Off');

%confirm_cbx = uicheckbox(instructions_UI,'Visible','Off','Position',[808 92 24 24],'Text','','FontSize',14); 

%%%%%%%%%%%%%%%%%%%%% Control Functions %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% next button function
    function next_btn_push()
       stepcount = stepcount +1;
       if stepcount == 2
            set(prev_btn,'Visible','On')
            
            set(ptATitleLabel,'Visible','Off')          
            set(ptA1aLabel,'Visible','Off')
            set(ptA1bLabel,'Visible','Off')
            set(ptA1cLabel,'Visible','Off')
            set(ptA1dLabel,'Visible','Off')
            set(ptA2aLabel,'Visible','Off')
            set(ptA2bLabel,'Visible','Off')
            set(ptA3aLabel,'Visible','Off')
            
            set(ptBTitleLabel,'Visible','On') 
            set(ptB1aLabel,'Visible','On')
            set(ptB1bLabel,'Visible','On')
            set(ptB2aLabel,'Visible','On')
            set(ptB2bLabel,'Visible','On')
            set(ptB2cLabel,'Visible','On')
            set(ptB3aLabel,'Visible','On')
            set(ptB3bLabel,'Visible','On')
            set(ptB3cLabel,'Visible','On')
            
            set(ptCTitleLabel,'Visible','Off')             
            set(ptC1aLabel,'Visible','Off')
            set(ptC1bLabel,'Visible','Off')
            set(ptC2aLabel,'Visible','Off')
            set(ptC2bLabel,'Visible','Off')
            set(ptC2cLabel,'Visible','Off')
            set(ptC3aLabel,'Visible','Off')
            set(ptC3bLabel,'Visible','Off')
            set(ptC3cLabel,'Visible','Off')
            set(ptC4aLabel,'Visible','Off')
            set(ptC4bLabel,'Visible','Off')
            set(ptC4cLabel,'Visible','Off')

            set(ptDTitleLabel,'Visible','Off') 
            set(ptD1aLabel,'Visible','Off')
            set(ptD2aLabel,'Visible','Off') 
            set(ptD2bLabel,'Visible','Off')
            set(ptD2cLabel,'Visible','Off') 
            set(ptD3aLabel,'Visible','Off')
            set(ptD4aLabel,'Visible','Off')
            set(ptD4bLabel,'Visible','Off')
  
       elseif stepcount == 3
            set(ptATitleLabel,'Visible','Off')          
            set(ptA1aLabel,'Visible','Off')
            set(ptA1bLabel,'Visible','Off')
            set(ptA1cLabel,'Visible','Off')
            set(ptA1dLabel,'Visible','Off')
            set(ptA2aLabel,'Visible','Off')
            set(ptA2bLabel,'Visible','Off')
            set(ptA3aLabel,'Visible','Off')
            
            set(ptBTitleLabel,'Visible','Off') 
            set(ptB1aLabel,'Visible','Off')
            set(ptB1bLabel,'Visible','Off')
            set(ptB2aLabel,'Visible','Off')
            set(ptB2bLabel,'Visible','Off')
            set(ptB2cLabel,'Visible','Off')
            set(ptB3aLabel,'Visible','Off')
            set(ptB3bLabel,'Visible','Off')
            set(ptB3cLabel,'Visible','Off')
            
            set(ptCTitleLabel,'Visible','On')             
            set(ptC1aLabel,'Visible','On')
            set(ptC1bLabel,'Visible','On')
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
            set(ptD3aLabel,'Visible','Off')
            set(ptD4aLabel,'Visible','Off')
            set(ptD4bLabel,'Visible','Off')           
       else
            set(next_btn,'Visible','Off')
            set(submit_btn,'Visible','On')
%             set(confirmLabel1,'Visible','On')
%             set(confirmLabel2,'Visible','On')
%             set(confirm_cbx,'Visible','On')            


            
            set(ptATitleLabel,'Visible','Off')          
            set(ptA1aLabel,'Visible','Off')
            set(ptA1bLabel,'Visible','Off')
            set(ptA1cLabel,'Visible','Off')
            set(ptA1dLabel,'Visible','Off')
            set(ptA2aLabel,'Visible','Off')
            set(ptA2bLabel,'Visible','Off')
            set(ptA3aLabel,'Visible','Off')

            
            set(ptBTitleLabel,'Visible','Off') 
            set(ptB1aLabel,'Visible','Off')
            set(ptB1bLabel,'Visible','Off')
            set(ptB2aLabel,'Visible','Off')
            set(ptB2bLabel,'Visible','Off')
            set(ptB2cLabel,'Visible','Off')
            set(ptB3aLabel,'Visible','Off')
            set(ptB3bLabel,'Visible','Off')
            set(ptB3cLabel,'Visible','Off')
            
            set(ptCTitleLabel,'Visible','Off')             
            set(ptC1aLabel,'Visible','Off')
            set(ptC1bLabel,'Visible','Off')
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
            set(ptD3aLabel,'Visible','On')
            set(ptD4aLabel,'Visible','On')
            set(ptD4bLabel,'Visible','On')  
           
       end
    end



    function prev_btn_push()
        
        stepcount = stepcount - 1;
        if stepcount == 2
            set(ptATitleLabel,'Visible','Off')          
            set(ptA1aLabel,'Visible','Off')
            set(ptA1bLabel,'Visible','Off')
            set(ptA1cLabel,'Visible','Off')
            set(ptA1dLabel,'Visible','Off')
            set(ptA2aLabel,'Visible','Off')
            set(ptA2bLabel,'Visible','Off')
            set(ptA3aLabel,'Visible','Off')
            
            set(ptBTitleLabel,'Visible','On') 
            set(ptB1aLabel,'Visible','On')
            set(ptB1bLabel,'Visible','On')
            set(ptB2aLabel,'Visible','On')
            set(ptB2bLabel,'Visible','On')
            set(ptB2cLabel,'Visible','On')
            set(ptB3aLabel,'Visible','On')
            set(ptB3bLabel,'Visible','On')
            set(ptB3cLabel,'Visible','On')
            
            set(ptCTitleLabel,'Visible','Off')             
            set(ptC1aLabel,'Visible','Off')
            set(ptC1bLabel,'Visible','Off')
            set(ptC2aLabel,'Visible','Off')
            set(ptC2bLabel,'Visible','Off')
            set(ptC2cLabel,'Visible','Off')
            set(ptC3aLabel,'Visible','Off')
            set(ptC3bLabel,'Visible','Off')
            set(ptC3cLabel,'Visible','Off')
            set(ptC4aLabel,'Visible','Off')
            set(ptC4bLabel,'Visible','Off')
            set(ptC4cLabel,'Visible','Off')

            set(ptDTitleLabel,'Visible','Off') 
            set(ptD1aLabel,'Visible','Off')
            set(ptD2aLabel,'Visible','Off') 
            set(ptD2bLabel,'Visible','Off')
            set(ptD2cLabel,'Visible','Off')            
            set(ptD3aLabel,'Visible','Off')
            set(ptD4aLabel,'Visible','Off')
            set(ptD4bLabel,'Visible','Off')
  
  
       elseif stepcount == 3
            set(next_btn,'Visible','On')
            set(submit_btn,'Visible','Off')
%             set(confirmLabel1,'Visible','Off')
%             set(confirmLabel2,'Visible','Off')
%             set(confirm_cbx,'Visible','Off')
            
            set(ptATitleLabel,'Visible','Off')          
            set(ptA1aLabel,'Visible','Off')
            set(ptA1bLabel,'Visible','Off')
            set(ptA1cLabel,'Visible','Off')
            set(ptA1dLabel,'Visible','Off')
            set(ptA2aLabel,'Visible','Off')
            set(ptA2bLabel,'Visible','Off')
            set(ptA3aLabel,'Visible','Off')
            
            set(ptBTitleLabel,'Visible','Off') 
            set(ptB1aLabel,'Visible','Off')
            set(ptB1bLabel,'Visible','Off')
            set(ptB2aLabel,'Visible','Off')
            set(ptB2bLabel,'Visible','Off')
            set(ptB2cLabel,'Visible','Off')
            set(ptB3aLabel,'Visible','Off')
            set(ptB3bLabel,'Visible','Off')
            set(ptB3cLabel,'Visible','Off')
            
            set(ptCTitleLabel,'Visible','On')             
            set(ptC1aLabel,'Visible','On')
            set(ptC1bLabel,'Visible','On')
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
            set(ptD3aLabel,'Visible','Off')
            set(ptD4aLabel,'Visible','Off')
            set(ptD4bLabel,'Visible','Off')           
        else
            set(prev_btn,'Visible','Off')
            
            set(ptATitleLabel,'Visible','On')          
            set(ptA1aLabel,'Visible','On')
            set(ptA1bLabel,'Visible','On')
            set(ptA1cLabel,'Visible','On')
            set(ptA1dLabel,'Visible','On')
            set(ptA2aLabel,'Visible','On')
            set(ptA2bLabel,'Visible','On')
            set(ptA3aLabel,'Visible','On')
            
            set(ptBTitleLabel,'Visible','Off') 
            set(ptB1aLabel,'Visible','Off')
            set(ptB1bLabel,'Visible','Off')
            set(ptB2aLabel,'Visible','Off')
            set(ptB2bLabel,'Visible','Off')
            set(ptB2cLabel,'Visible','Off')
            set(ptB3aLabel,'Visible','Off')
            set(ptB3bLabel,'Visible','Off')
            set(ptB3cLabel,'Visible','Off')
            
            set(ptCTitleLabel,'Visible','Off')             
            set(ptC1aLabel,'Visible','Off')
            set(ptC1bLabel,'Visible','Off')
            set(ptC2aLabel,'Visible','Off')
            set(ptC2bLabel,'Visible','Off')
            set(ptC2cLabel,'Visible','Off')
            set(ptC3aLabel,'Visible','Off')
            set(ptC3bLabel,'Visible','Off')
            set(ptC3cLabel,'Visible','Off')
            set(ptC4aLabel,'Visible','Off')
            set(ptC4bLabel,'Visible','Off')
            set(ptC4cLabel,'Visible','Off')

            set(ptDTitleLabel,'Visible','Off') 
            set(ptD1aLabel,'Visible','Off')
            set(ptD2aLabel,'Visible','Off') 
            set(ptD2bLabel,'Visible','Off')
            set(ptD2cLabel,'Visible','Off') 
            set(ptD3aLabel,'Visible','Off')
            set(ptD4aLabel,'Visible','Off')
            set(ptD4bLabel,'Visible','Off')
        end
    end

%%%%%%%%%%%% INTERNAL FUNCTION TO CHANGE TEXT AND CLOSE PANEL  %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%% ON PRESS OF THE BUTTON %%%%%%%%%%%%%%%%%%%%%%%%
    function submit_btn_push()
%         if confirm_cbx.Value == 1
        
        %pregame_quiz_UI(vidyes, device, n_stages, n_rounds, n_frequency,game_start_time,n_final_followers, uID, user_age,user_gender, date_str, slfshList, slfshScore, studyTable,studyfilecsv, studyfile, bln_start_flag, bln_end_flag,cltblnstrt1, cltblnstrt2, cltblnstrt3) 
        % now goes via video UI to pregame quiz
        
        callcross(cross_blUI)
        pause(5)
        
        Video_Baseline_UI(cross_blUI, vidyes, device, n_stages, n_rounds, n_frequency,game_start_time,n_final_followers, uID, user_age,user_gender, date_str, slfshList, slfshScore, studyTable,studyfilecsv, studyfile, bln_start_flag, bln_end_flag,cltblnstrt1, cltblnstrt2, cltblnstrt3)    
  
        %build_main_game_UI(device, n_stages, n_rounds, n_frequency,game_start_time,n_final_followers, uID, user_age,user_gender, date_str, slfshList, slfshScore, studyTable,studyfilecsv, studyfile, bln_start_flag, bln_end_flag,cltblnstrt1, cltblnstrt2, cltblnstrt3) 
        close(instructions_UI); 
%         else
%             waitfor(msgbox('Please confirm you have read the instructions'));
%         end
        
    end           
end
