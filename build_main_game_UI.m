%%%%%%%%%%%%%%%%   Dictator game UI build %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                         Paul Stone                                     %%
%                     stone.123@wright.edu                               %%
%                   Wright State University                              %%
%                        October 2021                                    %%
%                                                                        %%
% This file launches the main game, cylcing through the number of rounds %%
% and stages as specific in the build_researcherUI.m                     %%
%                                                                        %%
% it launches from the pregame_quizUI.m and to debrief_questions1.m      %%
% at the end of the final round of the final stage, csv and txt files are %
% saved and the game enters the debrief phase                            %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function build_main_game_UI(GH,GW,GX,GY,HWXY,GBG,BBG,BH,BW,BXC,BXL,BXR,BY,Mgn,PW,...
    cross_blUI, vidyes, device, n_stages, n_rounds, n_frequency, game_start_time, n_final_followers,...
    uID, user_age, user_gender, date_str, slfshList, slfshScore, studyTable, studyfilecsv, studyfile, bln_start_flag, bln_end_flag,...
    cltblnstrt1, cltblnstrt2, cltblnstrt3, all_repsonses,behaviours_observed)

reset_pause =1;
highest_power =3;  %%%% CHANGE THIS TO 3 FOR EXTRA SELFISH OPTION 
btn_press_count = 0;
round_counter = 1;
stage_counter = 1;
total_l_points = 0;
total_f_points = 0;
clicks = 0;

% reset the question result to null
question_result = 'null';
%set initial power level
power_level=100; 

%initialize variables
ID = {uID};
gender = {user_gender};
age = {user_age};
date = {date_str};
bl_cn = ("Baseline control Results");
BC_Start = {bln_start_flag};
BC_End = {bln_end_flag};
bl_ctl = ("Baseline ctl Results");
BCtlA_Start = {cltblnstrt1};
BCtlB_Start = {cltblnstrt2};
BCtlC_Start = {cltblnstrt3};

preGame = {"Pre-Game Results"};
sqr1 = {slfshList{1,1}};
sqr2 = {slfshList{1,2}};
sqr3 = {slfshList{1,3}};
sqrs = {slfshScore};
game = {"Game Results"};
gameStart = {game_start_time};
srId = {sprintf("Stage %d Round %d", stage_counter, round_counter)};

%behaviours_observed = [];
response = {};
tentative_response ={};
all_repsonses = [ID; date; age; gender; {""}; {""}; bl_cn; BC_Start; BC_End; bl_ctl; BCtlA_Start; BCtlB_Start; BCtlC_Start; preGame; sqrs; sqr1; sqr2; sqr3;{""};all_repsonses;behaviours_observed;{""};game; gameStart; srId];

% create the figure
game_GUI = uifigure('Position',HWXY,'Color',GBG);

% create the button group
op1rbs  = uibuttongroup(game_GUI,'FontSize',12,'Position',[Mgn 125 PW GH-250],'BackgroundColor',GBG);

% create instructions button
ins_btn = uibutton(game_GUI,'push','Text','Guide','FontColor','white','FontSize',18,...
 'BackgroundColor',BBG,'Position',[GW-100, GH-80, 80, 50],...
 'ButtonPushedFcn', @(ins_btn,event) ins_btn_push());

% Launch the in-game instructions 
function ins_btn_push()
    if stage_counter ==1
        IGG1_UI(GH,GW,GX,GY,HWXY,GBG,BBG,BH,BW,BXC,BXL,BXR,BY,Mgn,PW)
        %in_game_instructions_UI()
    elseif stage_counter ==2
        IGG2_UI(GH,GW,GX,GY,HWXY,GBG,BBG,BH,BW,BXC,BXL,BXR,BY,Mgn,PW)
        %stage_two_in_game_instructions_UI()
    else
        IGG3_UI(GH,GW,GX,GY,HWXY,GBG,BBG,BH,BW,BXC,BXL,BXR,BY,Mgn,PW)
        %stage_three_in_game_instructions_UI()
    end
end

% Position variables
pos1 = 230;
pos2 = 180;
pos3 = 130;
pos4 = 80;

total_x = 810;
employee_x = 640;
leader_x = 410;

%Create titles
Leader_title = uilabel(op1rbs,'Position',[leader_x-10 pos1+50 100 60],'Text','Leader','FontSize',20,'FontWeight','bold','HorizontalAlignment','Right');
Follower_title = uilabel(op1rbs,'Position',[employee_x-50 pos1+50 250 60],'Text','Employee','FontSize',20,'FontWeight','bold');
Total_title = uilabel(op1rbs,'Position',[total_x-10 pos1+50 200 60],'Text','Total','FontSize',20,'FontWeight','bold');

% add the radio buttons and button group

%make the group
u5 = uiradiobutton(op1rbs,'Position',[270 300 40 30],'Tag','1','Value',1,'Text',' ','Visible','off'); %dummy button


%Set x value for rbs
rb_xval = 390;

% add radio buttons
u1 = uiradiobutton(op1rbs,'Position',[rb_xval pos2+20 40 30],'Tag','2','Value',0,'Text',' ');
u2 = uiradiobutton(op1rbs,'Position',[rb_xval pos1+20 40 30],'Tag','3','Value',0,'Text',' ');
u3 = uiradiobutton(op1rbs,'Position',[rb_xval pos3+20 40 30],'Tag','4','Value',0,'Text',' ');
u4 = uiradiobutton(op1rbs,'Position',[rb_xval pos4+20 40 30],'Tag','5','Value',0,'Text',' ','Visible','off');

% create labels for the radio buttons

Follower_mid = uilabel(op1rbs,'Position',[employee_x pos1 80 60],'Text','70','FontSize',20);
Follower_high = uilabel(op1rbs,'Position',[employee_x pos2 80 60],'Text','90','FontSize',20);
Follower_low = uilabel(op1rbs,'Position',[employee_x pos3 80 60],'Text','10','FontSize',20);
Follower_xlow = uilabel(op1rbs,'Position',[employee_x pos4 80 60],'Text','10','FontSize',20,'Visible','Off');

Leader_mid = uilabel(op1rbs,'Position',[leader_x pos1 80 60],'Text','100','FontSize',20,'HorizontalAlignment','Right');
Leader_low = uilabel(op1rbs,'Position',[leader_x pos2 80 60],'Text','90','FontSize',20,'HorizontalAlignment','Right');
Leader_high = uilabel(op1rbs,'Position',[leader_x pos3 80 60],'Text','150','FontSize',20,'HorizontalAlignment','Right');
Leader_xhigh = uilabel(op1rbs,'Position',[leader_x pos4 80 60],'Text','250','FontSize',20,'HorizontalAlignment','Right','Visible','Off');

Total_mid = uilabel(op1rbs,'Position',[total_x pos1 80 60],'Text','170','FontSize',20);
Total_high = uilabel(op1rbs,'Position',[total_x pos2 80 60],'Text','180','FontSize',20);
Total_low = uilabel(op1rbs,'Position',[total_x pos3 80 60],'Text','160','FontSize',20);
Total_xlow = uilabel(op1rbs,'Position',[total_x pos4 80 60],'Text','280','FontSize',20,'Visible','Off');

% BE CAREFUL - ORDER IS SLIGHTLY STRANGE AS IT RELATES TO THE INITIAL
% POSITION/Option for employee salary

opmid = uilabel(op1rbs,'Position',[50 pos1+10 310 50],'Text','Do Nothing:','FontSize',20,'HorizontalAlignment','Right');
ophigh = uilabel(op1rbs,'Position',[50 pos2+10 310 50],'Text','Increase employee salary:','FontSize',20,'HorizontalAlignment','Right');
oplow = uilabel(op1rbs,'Position',[50 pos3+10 310 50],'Text','Increase your salary:','FontSize',20,'HorizontalAlignment','Right');
opxlow = uilabel(op1rbs,'Position',[50 pos4+10 310 50],'Text','Increase your salary further:','FontSize',20,'HorizontalAlignment','Right','Visible','Off');

number_of_followers = 1;
             
game_power_text = sprintf('As the leader, please select one option given the information found in this table:');       
game_power_instruction = uilabel(op1rbs,'Position',[Mgn-50 GH-350 PW-100 50],'Text',game_power_text,'FontSize',20,'FontWeight','bold','HorizontalAlignment','Center');

%show start time in window
%start_text = 'The Game started at %s';
start_time_text = sprintf('The Game started at %s',game_start_time);
time_label = uilabel(game_GUI,'Position',[Mgn GH-80 300 50],'Text',start_time_text);
time_label.FontSize =20;
             
%generate the submit button
submit_btn = uibutton(game_GUI,'push','Text','Submit Choice','Position',[BXC, BY, BW, BH],'BackgroundColor',BBG,'FontSize',18,...
    'ButtonPushedFcn', @(submit_btn,event) submit_btn_push());

%show choice in window
choice_text = 'You selected %s';
choice = 'standard payments';
choice_select_text = sprintf(choice_text,choice);
choice_label = uilabel(op1rbs,'Position',[BXC-250 BY 500 30],'Text','Please Select a Payment Option','HorizontalAlignment','Center','FontWeight','bold');
choice_label.FontSize =20;

% set the callbacks for the radio buttons to indicate tentative pushes
%set(op1rbs,'SelectedObject',[]);  % No selection
set(op1rbs,'SelectionChangeFcn',@dpbcbk);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  THIS IS WHERE MOST GAME LOOP FUNCTIONALITY IS EXCECUTED   %%%%%%%%%%%%
%this is what happens each time the submit button is pushed - output varies
% %%%%%%%%%%%%%%%%%%%depending on the cycle  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function submit_btn_push()
    
    set(submit_btn, 'Enable', 'Off')

    if u5.Value == 1
        message = 'Please select \na payment option';
        Alert(message,GBG, BBG)
        set(submit_btn, 'Enable', 'On')
    else
        btn_press_count = btn_press_count +1;                   %total button presses - not sure this is used

        decision_time = datetime('now','Format','HH:mm:ss'); 
        ts=datevec(datenum(game_start_time));
        tn=datevec(datenum(decision_time));
        decision_game_time = etime(tn,ts);

        % update response file for confirmed entry
        if question_result == 'P'
            
        %         WRITE THE SUBMITTED CHOICE TO THE SERIAL PORT
        % WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS
        %            Write to Serial port to confirm Choice                       
        % WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS
        senddata  = 210;
        writedata(senddata);
        
            if stage_counter == 1
                total_l_points = total_l_points + 90;
                total_f_points = total_f_points + 90;
            else
                total_l_points = total_l_points + 90;
                total_f_points = total_f_points + 270;
            end
        elseif question_result == 'D'  
         
        %         WRITE THE SUBMITTED CHOICE TO THE SERIAL PORT
        % WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS
        %            Write to Serial port to confirm Choice                       
        % WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS
        senddata  = 212;
        writedata(senddata);
            
            if stage_counter == 1
                total_l_points = total_l_points + 100;
                total_f_points = total_f_points + 70;
            else
                total_l_points = total_l_points + 100;
                total_f_points = total_f_points + 210; 
            end
        elseif question_result == 'A' 
            
        %         WRITE THE SUBMITTED CHOICE TO THE SERIAL PORT
        % WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS
        %            Write to Serial port to confirm Choice                       
        % WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS
        senddata  = 214;
        writedata(senddata);
            
            if stage_counter == 1
                total_l_points = total_l_points + 150;
                total_f_points = total_f_points + 10;
            else
                total_l_points = total_l_points + 150;
                total_f_points = total_f_points + 150; 
            end
        elseif question_result == 'V' 
            
        %         WRITE THE SUBMITTED CHOICE TO THE SERIAL PORT
        % WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS
        %            Write to Serial port to confirm Choice                       
        % WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS
        senddata  = 216;
        writedata(senddata);
            
                total_l_points = total_l_points + 250;
                total_f_points = total_f_points + 30; 
        end

        response_entry = {};
        response_entry = {sprintf('S%dR%dCA%s@%s',stage_counter,round_counter,question_result,decision_game_time)};

        tentative_response = {tentative_response; response_entry};
        all_repsonses = [all_repsonses; response_entry];

        %reset form rbs and message
        set(u5,'Value',1);
        set(choice_label,'Text','Please Select a Payment Option')

        if round_counter < n_rounds
           if stage_counter < n_stages
                if round_counter == 1
                    setheights(pos3, pos2, pos1, pos4)
                elseif round_counter == 2
                    setheights(pos1, pos3, pos2, pos4)
                 elseif round_counter == 3
                    setheights(pos2, pos1, pos3, pos4)
                 elseif round_counter == 4
                    setheights(pos3, pos2, pos1, pos4)
                 elseif round_counter == 5
                    setheights(pos1, pos3, pos2, pos4)
                 elseif round_counter == 6
                    setheights(pos2, pos1, pos3, pos4)
                 elseif round_counter == 7
                    setheights(pos3, pos2, pos1, pos4)               
                 elseif round_counter == 8
                    setheights(pos1, pos3, pos2, pos4)              
                 elseif round_counter == 9
                     setheights(pos2, pos1, pos3, pos4)              
                end
           else
                if round_counter == 1
                    setheights(pos3, pos2, pos4, pos1)
                elseif round_counter == 2
                    setheights(pos4, pos3, pos1, pos2)
                 elseif round_counter == 3
                    setheights(pos1, pos4, pos2, pos3)
                 elseif round_counter == 4
                    setheights(pos2, pos1, pos3, pos4)
                 elseif round_counter == 5
                    setheights(pos3, pos2, pos4, pos1)
                 elseif round_counter == 6
                    setheights(pos4, pos3, pos1, pos2)
                 elseif round_counter == 7
                    setheights(pos1, pos4, pos2, pos3)               
                 elseif round_counter == 8
                    setheights(pos2, pos1, pos3, pos4)              
                 elseif round_counter == 9
                     setheights(pos3, pos2, pos4, pos1)              
                end               
           end
           
            message = sprintf('That completes round %d of %d',round_counter, n_rounds);
            Alert_timer(message,GBG, BBG);
            set(submit_btn, 'Enable', 'On')

        end

        if  round_counter  == n_rounds

            %hide old game environment while new instructions are given
            set(game_GUI,'Visible','Off')

            if stage_counter == 1 
                
                stage_two_instructions_UI(GH,GW,GX,GY,HWXY,GBG,BBG,BH,BW,BXC,BXL,BXR,BY,Mgn,PW,...
                    cross_blUI, game_GUI)
                set(ophigh,'Text','Increase employees salary:')
                set(Follower_title,'Text','3 Employees (each)')
                
            end

            if stage_counter < n_stages 
                
                if stage_counter == n_stages-2 && highest_power > 1
                    set(Total_high,'Text','360');
                    set(Total_mid,'Text','310');
                    set(Total_low,'Text','300');
                    set(Follower_low,'Text','50');
                    
                    power_level = 200;
                elseif stage_counter == n_stages-1 && highest_power ==3
                    
                    power_level = 300;
                    set(Follower_xlow,'Visible','On');
                    set(Leader_xhigh,'Visible','On');
                    set(Total_xlow,'Visible','On');
                    set(u4,'Visible','On');
                    
                    %%%%% NEW INTSTRUCTION ELEMET - game UI turned on in
                    %%%%% pre_r3_quiz_UI.m
                    stage_three_instructions_UI(GH,GW,GX,GY,HWXY,GBG,BBG,BH,BW,BXC,BXL,BXR,BY,Mgn,PW,...
                        cross_blUI, game_GUI)        
                    set(opxlow, 'Visible', 'On');
%                     set(game_GUI,'Visible','On');

                else
                    power_level = 100;
                end

                number_of_followers = n_final_followers;
                set_price_options(); 
            end

            if stage_counter == n_stages;

                % make sure the UI is reset for stage 1 once %
                % the participant is finished %%%%%%%%%%%%%%%%
                power_level = 300;
                set(Follower_xlow,'Visible','Off');
                set(Leader_xhigh,'Visible','Off');
                set(Total_xlow,'Visible','Off');
                set(u4,'Visible','Off');

%%%%%%%%%%%%% End of game - inform participant close and start %%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%% new game from user details UI !!%%%%%%%%%%%%%%%%

                close(game_GUI);
                
                End_game_message(GH,GW,GX,GY,HWXY,GBG,BBG,BH,BW,BXC,BXL,BXR,BY,Mgn,PW)
                      
                pause(0.2); 
                
                finalcross(cross_blUI,HWXY,GBG,BBG, Mgn,PW,BXC,BY,BW,BH)
                pause(1.0)
                close(cross_blUI);
                
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                %%%% Write all data to CSV and individual txt %%%%%%%%%%%%
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                
                all_repsonses = [all_repsonses; "";{"Total Leader Points"};{total_l_points};{"Leader Behaviours:"};behaviours_observed;{"Total Employee Points"};{total_f_points};{""}]; 
                participantData = cell2table(cellstr(all_repsonses));                %Convert to table
                uIDtext = sprintf('user%d',uID);
                participantData.Properties.VariableNames = {uIDtext};          %Change variable name to uid
                filename=sprintf('DG_User%d%s.txt',uID, studyfile);         %generate filename
                %dir=('C:\\');                                  %set directory 
                writetable(participantData,filename)           % output a file for the participant data to ensure a backup
                uID = uID + 1;                                 % update User ID for next participant
                studyTable{1,2} = num2cell(uID);               % update the User ID for number of users in the table

                %%% make tables same height for concatenation %%

                all_response_height = height(participantData);
                studyTable_height = height(studyTable);

                if studyTable_height > all_response_height
                    new_table_height = studyTable_height+1; 
                elseif studyTable_height <= all_response_height
                    new_table_height = all_response_height+1;
                end

                participantData(new_table_height, 1) = cell2table({'end'}); %%%%%% denote the end of data
                studyTable(new_table_height, 1) = cell2table({'end'}); %%%%%% denote the end of data

                studyTableout = [studyTable participantData];      % concatenate tables
                %delete studyfilecsv;
                %new_filename=sprintf('%s.new', studyfilecsv);
                my_directory = pwd;
                dgwd = fullfile( my_directory, studyfilecsv ); 
                writetable(studyTableout,dgwd)              % write to a csv file to store data
                
                %                   END OF THE GAME                       %
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                %                                                         %
                %     Close the game and restart the User details UI      %
                %                                                         %
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                
                %%%%%%%%%%%%%%%    open the debrief questions UI %%%%%%%%%%
                
                debrief_questions1(GH,GW,GX,GY,HWXY,GBG,BBG,BH,BW,BXC,BXL,BXR,BY,Mgn,PW,...
                    uID, studyTableout, n_stages,n_rounds, n_frequency, n_final_followers,studyfilecsv, studyfile)                       

                % clear the variables used to store responses %
                clear all_repsonses
                clear tentative_response
                clear response
                clear game_start_time
                stage_counter = stage_counter + 1;
            end

            if stage_counter <= n_stages
                % Increment Stage counter and send flag to response
                stage_counter = stage_counter +1;
                stage_start_time = datetime('now','Format','HH:mm:ss'); 
                sId = sprintf("Stage %d", stage_counter);
                all_repsonses = [all_repsonses; "";{"Total Leader Points"};{total_l_points};{"Total Employee Points"};{total_f_points};{""}; {sId}; {stage_start_time}];
                
                %ensure enable button is back on
                set(submit_btn, 'Enable', 'On')
                round_counter = 0;
            end

        end

        if stage_counter <= n_stages
            round_counter = round_counter +1; 
            round_start_time = datetime('now','Format','HH:mm:ss'); 
            rId = sprintf("Round %d", round_counter);
            all_repsonses = [all_repsonses; {rId}; {round_start_time}];
        end
    end
    
    %When the EOR button is clicked this is executed.
%     function EorButton(Eor_title, Eor_subtitle, ax, Vid_message)
%         if clicks == 0
%            set(Eor_title,'Text',Vid_message);
%            set(Eor_subtitle,'Visible','Off');
%            set(ax,'Position',[150, 1140, 600, 600]);
%            set(Eor_title,'Position',[50, 500, 850, 190]);
%            clicks = clicks +1;
%            disp(clicks)
% 
%         elseif clicks > 0
%            set(End_of_round_UI,'Visible','Off');
%            set(video_UI,'Visible','On');
%            set(videoControl_UI,'Visible','On');
%            disp(clicks)
%            disp("Test2")
%         end
%     end
    
% Video Start button executes this code
% function start_vid_btn_push(a, videoControl_UI)
% 
%     % Start the video, record start time and send code to serial port
%     a.playlist.play();
%     video_start_time = datetime('now','Format','HH:mm:ss'); 
% 
%     %WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS
%     %            Write to Serial port to confirm start                       
%     %WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS
%     senddata = 220;
%     writedata(senddata);
% 
% 
%     set(vid_start_btn,'Visible','Off');
%     pause(1);
%     vidMess = "Please watch the whole video, it lasts approximately 3 minutes";
%     vidMessLabel = uilabel(videoControl_UI,'Position',[300 60 700 24],'Text',vidMess,'FontSize',20,'Visible','On');
%     set(vidMessLabel,'Visible','Off');
%     pause(3);
% 
%     % ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
% 
%     %            ADD ANY WRITE TO SERIAL DURING VIDEO HERE
% 
%     % ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
% 
% 
%     set(vid_close_btn,'Visible','On');
% end

%     function vid_close_btn_push(video_UI, videoControl_UI)
%         
%         
%         %WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS
%         %            Write to Serial port to confirm start                       
%         %WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS
%         senddata = 222;
%         writedata(senddata);
%         
%         close(video_UI);
%         close(videoControl_UI);
%         post_video_quiz()
%     end    
%     
end


% function post_video_quiz()
% 
% % create the initial UI interface
% post_video_quiz_UI = uifigure('Position',[500 200 1000 500]);
% 
% titleLine1 = 'Thank you for watching the video';
% titleLine2 = 'Please click to indictate the  ';
% titleLine3 = 'behaviours you observed';
% 
% titleText = sprintf('%s\n%s\n%s',titleLine1,titleLine2,titleLine3);
% mainTitle = uilabel(post_video_quiz_UI,'Position',[100 350 800 100],'Text',titleText);
% set(mainTitle,'FontSize',20);
% set(mainTitle, 'HorizontalAlignment','Center');
% 
% behaviour1_cbx = uicheckbox(post_video_quiz_UI,'Visible','On','Position',[175 300 200 30],'Text','Drive','FontSize',14); 
% behaviour2_cbx = uicheckbox(post_video_quiz_UI,'Visible','On','Position',[175 250 200 30],'Text','Collaboration','FontSize',14);
% behaviour3_cbx = uicheckbox(post_video_quiz_UI,'Visible','On','Position',[175 200 200 30],'Text','Humanity','FontSize',14);
% behaviour4_cbx = uicheckbox(post_video_quiz_UI,'Visible','On','Position',[175 150 200 30],'Text','Humility','FontSize',14);
% behaviour5_cbx = uicheckbox(post_video_quiz_UI,'Visible','On','Position',[425 300 200 30],'Text','Integrity','FontSize',14);
% behaviour6_cbx = uicheckbox(post_video_quiz_UI,'Visible','On','Position',[425 250 200 30],'Text','Temperance','FontSize',14);
% behaviour7_cbx = uicheckbox(post_video_quiz_UI,'Visible','On','Position',[425 200 300 30],'Text','Justice','FontSize',14);
% behaviour8_cbx = uicheckbox(post_video_quiz_UI,'Visible','On','Position',[425 150 300 30],'Text','Accountability','FontSize',14);
% behaviour9_cbx = uicheckbox(post_video_quiz_UI,'Visible','On','Position',[675 300 300 30],'Text','Courage','FontSize',14);
% behaviour10_cbx = uicheckbox(post_video_quiz_UI,'Visible','On','Position',[675 250 300 30],'Text','Transcendence','FontSize',14);
% behaviour11_cbx = uicheckbox(post_video_quiz_UI,'Visible','On','Position',[675 200 300 30],'Text','Judgement','FontSize',14);
% 
% close_quizBtn = uibutton(post_video_quiz_UI,'push','Text','Continue Study','Position',[425, 60, 150, 50],'ButtonPushedFcn', @(close_quizBtn,event) close_quizBtnpush());

%     function close_quizBtnpush()
%         %%%%%%%%%%%%%  collate observed behaviours in output  %%%%%%%%%%%%
%         
%         behaviours_observed = [behaviours_observed; "Video Included"];
%         
%         if behaviour1_cbx.Value == 1 
%             behaviours_observed = [behaviours_observed; "Drive"];
%         end
%         if behaviour2_cbx.Value == 1 
%             behaviours_observed = [behaviours_observed; "Collaboration"];
%         end
%         if behaviour3_cbx.Value == 1 
%             behaviours_observed = [behaviours_observed; "Humanity"];
%         end
%         if behaviour4_cbx.Value == 1 
%             behaviours_observed = [behaviours_observed; "Humility"];
%         end
%         if behaviour5_cbx.Value == 1 
%             behaviours_observed = [behaviours_observed; "Integrity"];
%         end
%         if behaviour6_cbx.Value == 1 
%             behaviours_observed = [behaviours_observed; "Temperance"];
%         end    
%         if behaviour7_cbx.Value == 1 
%             behaviours_observed = [behaviours_observed; "Justice"];
%         end
%         if behaviour8_cbx.Value == 1 
%             behaviours_observed = [behaviours_observed; "Accountability"];
%         end
%         if behaviour9_cbx.Value == 1 
%             behaviours_observed = [behaviours_observed; "Courage"];
%         end
%         if behaviour10_cbx.Value == 1 
%             behaviours_observed = [behaviours_observed; "Transcendence"];
%         end 
%         if behaviour11_cbx.Value == 1 
%             behaviours_observed = [behaviours_observed; "Judgement"];
%         end 
%         close(post_video_quiz_UI)
%         stage_two_instructions_UI(cross_blUI, game_GUI, iG2pers_UI)
%     end
% end

function dpbcbk(source,eventdata)
    
    %callback function for the radio buttons
    
    switch get(eventdata.NewValue,'tag') 
        case '2'     
            question_result = 'P';
            choice = 'to Increase the salary of the employee';
            choice_select_text = sprintf(choice_text,choice);
            set(choice_label,'Text',choice_select_text);

            decision_time = datetime('now','Format','HH:mm:ss'); 
            ts=datevec(datenum(game_start_time));
            tn=datevec(datenum(decision_time));
            decision_game_time = etime(tn,ts);

            % update response file for tentative entry
            response_entry = {};
            response_entry = {sprintf('S%dR%dTA%s@%s',stage_counter,round_counter,question_result,decision_game_time)};
            tentative_response = [tentative_response; response_entry];
            all_repsonses = [all_repsonses; response_entry];
            
            
            %WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS
            %            Write to Serial port to confirm Choice                       
            %WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS
            senddata = 200;
            writedata(senddata);
            
        case '3'  
            question_result = 'D';
            choice = 'do nothing';
            choice_select_text = sprintf(choice_text,choice);
            set(choice_label,'Text',choice_select_text);

            decision_time = datetime('now','Format','HH:mm:ss'); 
            ts=datevec(datenum(game_start_time));
            tn=datevec(datenum(decision_time));
            decision_game_time = etime(tn,ts);

            % update response file for tentative entry
            response_entry = {};
            response_entry = {sprintf('S%dR%dTA%s@%s',stage_counter,round_counter,question_result,decision_game_time)};
            tentative_response = [tentative_response; response_entry];
            all_repsonses = [all_repsonses; response_entry];
            
            %WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS
            %            Write to Serial port to confirm Choice                       
            %WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS
            senddata = 202;
            writedata(senddata);
          
        case '4'  
            question_result = 'A';
            choice = 'to increase your salary';
            choice_select_text = sprintf(choice_text,choice);
            set(choice_label,'Text',choice_select_text); 

            decision_time = datetime('now','Format','HH:mm:ss'); 
            ts=datevec(datenum(game_start_time));
            tn=datevec(datenum(decision_time));
            decision_game_time = etime(tn,ts);

            % update response file for tentative entry
            response_entry = {};
            response_entry = {sprintf('S%dR%dTA%s@%s',stage_counter,round_counter,question_result,decision_game_time)};
            tentative_response = [tentative_response; response_entry];
            all_repsonses = [all_repsonses; response_entry];
            
            
            %WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS
            %            Write to Serial port to confirm Choice                       
            %WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS
            senddata  = 204;
            writedata(senddata);
       
        case '5'  
            question_result = 'V';
            choice = 'to increase your salary a lot';
            choice_select_text = sprintf(choice_text,choice);
            set(choice_label,'Text',choice_select_text); 

            decision_time = datetime('now','Format','HH:mm:ss'); 
            ts=datevec(datenum(game_start_time));
            tn=datevec(datenum(decision_time));
            decision_game_time = etime(tn,ts);

            % update response file for tentative entry
            response_entry = {};
            response_entry = {sprintf('S%dR%dTA%s@%s',stage_counter,round_counter,question_result,decision_game_time)};

            tentative_response = [tentative_response; response_entry];
            all_repsonses = [all_repsonses; response_entry];
            
            
            %WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS
            %            Write to Serial port to confirm Choice                       
            %WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS  WS
            senddata = 206;
            writedata(senddata);
          
        case '1' 
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            %%% CASE FOR DUMMY BUTTON, SHOULD NOT BE USED as this error is 
            %%% caught earlier %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    end
end 

function set_price_options()

     % set game power parameters
     game_power_text = sprintf('you have %d employees, please select a payment option',number_of_followers);             
     set(game_power_instruction,'Text',game_power_text);

     if power_level == 100  % power levels are arbitary 100=low, 200=medium 300=high (worked better than non-numeric
         Follow_high_val = 90;
         Follow_mid_val = 70;
         Follow_low_val = 10;
         Leader_high_val = 150;
         Leader_mid_val = 100;
         Leader_low_val = 90;
         Follow_xl_val = 10;
         Leader_xh_val = 250;

     elseif power_level == 200
         Follow_high_val = 90;
         Follow_mid_val = 70;
         Follow_low_val = 50;
         Leader_high_val = 150;
         Leader_mid_val = 100;
         Leader_low_val = 90; 
         Follow_xl_val = 10;
         Leader_xh_val = 250;
     else
         Follow_high_val = 90;
         Follow_mid_val = 70;
         Follow_low_val = 50;
         Follow_xl_val = 10;
         Leader_high_val = 150;
         Leader_mid_val = 100;
         Leader_low_val = 90; 
         Leader_xh_val = 250;
     end

 %set up the price values
 fh_text = sprintf('%d',Follow_high_val);
 fd_text = sprintf('%d',Follow_mid_val);
 fl_text = sprintf('%d',Follow_low_val);
 fxl_text = sprintf('%d',Follow_xl_val);
 lh_text = sprintf('%d',Leader_high_val);
 ld_text = sprintf('%d',Leader_mid_val);
 ll_text = sprintf('%d',Leader_low_val);
 lxh_text = sprintf('%d',Leader_xh_val);
 th_text = sprintf('%d',Follow_high_val*number_of_followers);
 td_text = sprintf('%d',Follow_mid_val*number_of_followers);
 tl_text = sprintf('%d',Follow_low_val*number_of_followers);
 txl_text = sprintf('%d',Follow_xl_val*number_of_followers);

end

function setheights(h1, h2, h3, h4)

    %Set hieghts to vary the position of the answers 
    
    newheight1 = h1;
    newheight2 = h2;
    newheight3 = h3;
    newheight4 = h4;
    
    set(ophigh,'Position',[50 newheight1+10 310 50]);
    set(opmid,'Position',[50 newheight2+10 310 50]);
    set(oplow,'Position',[50 newheight3+10 310 50]);
    set(opxlow,'Position',[50 newheight4+10 310 50]);

    set(u1,'Position',[rb_xval newheight1+20 40 30]);
    set(u2,'Position',[rb_xval newheight2+20 40 30]);
    set(u3,'Position',[rb_xval newheight3+20 40 30]);
    set(u4,'Position',[rb_xval newheight4+20 40 30]);

    set(Follower_high,'Position',[employee_x newheight1 80 60]);
    set(Follower_mid,'Position',[employee_x newheight2 80 60]);
    set(Follower_low,'Position',[employee_x newheight3 80 60]);
    set(Follower_xlow,'Position',[employee_x newheight4 80 60]);

    set(Leader_low,'Position',[leader_x newheight1 80 60]);
    set(Leader_mid,'Position',[leader_x newheight2 80 60]);
    set(Leader_high,'Position',[leader_x newheight3 80 60]);
    set(Leader_xhigh,'Position',[leader_x newheight4 80 60]);

    set(Total_high,'Position',[total_x newheight1 80 60]);
    set(Total_mid,'Position',[total_x newheight2 80 60]);
    set(Total_low,'Position',[total_x newheight3 80 60]);
    set(Total_xlow,'Position',[total_x newheight4 80 60]);
    
end
        
end