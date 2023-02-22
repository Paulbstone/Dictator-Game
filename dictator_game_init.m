%%%%%%%%%%%%%%%%   Dictator game UI build %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                         Paul Stone                                     %%
%                     stone.123@wright.edu                               %%
%                   Wright State University                              %%
%                        October 2021                                    %%
%                                                                        %%
%    This file launches the initial UI and all game elements             %%
%                                                                        %%
% It links to the build_researcher_UI.m to input game parameters if 'new %%
% study' is the choice, or vid_select_UI if 'continue study' is selected %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%   LAUNCH THE GAME FROM HERE!   %%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%   The game will throw an ERROR if a new study is entered with a  %%%%%
%%%%%%%%%%   one letter name - brief this to research team    %%%%%%%%%%%%%

function dictator_game_init(GH,GW,GX,GY,HWXY,GBG,BBG,BH,BW,BXC,BXL,BXR,BY,Mgn,PW)



% create the initial UI interface
dGameInit_UI = uifigure('Position',HWXY,'Color',GBG);

% create the cross UI (moved off screen) for use later in the game
cross_blUI.Position =[2000 15 1960 1045];

% create UI text
titleLine1 = 'Create a new study';
titleLine2 = 'or';
titleLine3 = 'Continue an existing one';
titleText = sprintf('%s\n%s\n%s',titleLine1,titleLine2,titleLine3);
mainTitle = uilabel(dGameInit_UI,'Position',[Mgn 300 PW 150],'Text',titleText);
set(mainTitle,'FontSize',30);
set(mainTitle, 'HorizontalAlignment','Center');

%%%%%%%%%%%%%%%%    Build a button for continuing study    %%%%%%%%%%%%%%%%%
%%%%%%%%%%   This generates a new CSV and starts at ID1     %%%%%%%%%%%%%%%
continueStudyBtn = uibutton(dGameInit_UI,'push','Text','Continue Study','Position',[BXR, BY, BW, BH],'FontSize',18,...
    'BackgroundColor',BBG,'ButtonPushedFcn', @(continueStudyBtn,event) continueStudyBtn_push());

% continue study function button
    function continueStudyBtn_push()
        
         %disable continue buttons
        set(newStudyBtn, 'Enable', 'Off')
        set(continueStudyBtn, 'Enable', 'Off')

        %%%%%%%%%%%%% find file from existing, convert back to %%%%%%%%%%%%
        %%%%%%%%%%%%%  table and extract previous uID %%%%%%%%%%%%%%%%%%%%%
        try
            studyfilecsv = uigetfile('*.csv');
            [studypath, studyfile, studyext] = fileparts(studyfilecsv);
            studyTable = readtable(studyfilecsv);
            uIDstr = studyTable{1,2};
            uID = str2double(uIDstr);
            n_stagesstr = studyTable{3,2};
            n_stages = str2double(n_stagesstr);
            n_roundsstr = studyTable{4,2};
            n_rounds = str2double(n_roundsstr);       
            n_frequencystr = studyTable{5,2};
            n_frequency = str2double(n_frequencystr);
            n_final_followersstr = studyTable{6,2};
            n_final_followers = str2double(n_final_followersstr);               % extract the game settings from existing study csv file
            set(continueStudyBtn, 'Enable', 'On')
            close(dGameInit_UI);                                                %close the initialization and launch the researcher interface
            vid_select_UI(GH,GW,GX,GY,HWXY,GBG,BBG,BH,BW,BXC,BXL,BXR,BY,Mgn,PW,uID, studyTable, n_stages, n_rounds, n_frequency, n_final_followers,studyfilecsv, studyfile)
            %user_details_UI(uID, studyTable, n_stages, n_rounds, n_frequency, n_final_followers, studyfilecsv, studyfile)

        catch
            % write error message if the file is not a csv - this isn't
            % foolproof - an incorrect csv could be selected. this would
            % probably write but might have errors. 
            
            message = 'Chosen file is not a study file\nplease select another\nor start a new study';  % prompt if filename entered  is invlaid                 
            Alert(message,GBG, BBG)
            %reenable continue button
            set(continueStudyBtn, 'Enable', 'On')
            set(newStudyBtn, 'Enable', 'On')
            set(dGameInit_UI,'Visible','Off');
            pause(0.1)
            set(dGameInit_UI,'Visible','On');
        
        end
    end

%%%%%%%%%%%%%%%%%      Build a button for new study    %%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%   This generates a new CSV and starts at ID1     %%%%%%%%%%%%%%%
newStudyBtn = uibutton(dGameInit_UI,'push','Text','New Study','Position',[BXL, BY, BW, BH],'FontSize',18,...
    'BackgroundColor',BBG,'ButtonPushedFcn', @(newStudyBtn,event) newStudyBtn_push());

    function newStudyBtn_push() 
        
        %%%%%%%%%%%%%% Create User input form and check if result %%%%%%%%
        %%%%%%%%%%%%%% contains non compatible letters  %%%%%%%%%%%%%%%%%%
        % disable button to prevent accidental clicks
        set(newStudyBtn, 'Enable', 'Off')
        set(continueStudyBtn, 'Enable', 'Off')
        
        uID = 1;                                                           % new uID starting at 1
        getfilename();
    
        function getfilename()
            
            studyfile= "study1";
            getStudyName = uifigure('Position',[800 350 400 300], 'Color',GBG, 'CloseRequestFcn',@my_closereq);
            studyLabel = uilabel(getStudyName,'Position',[100 200 200 30],'Text',...
                'Enter Study Name:','FontSize',18,'HorizontalAlignment','Left'); 
            studyPanel = uieditfield(getStudyName,'text','Position',[100 150 200 30],...
                'ValueChangedFcn',@(age_panel,event) studyChanged()); 

            function studyChanged()
                studyfile = studyPanel.Value;  
            end
            
            closeNewStudyBtn = uibutton(getStudyName,'push','Text','Generate Study',...
                'Position',[125, 50, 150, 50],'BackgroundColor',BBG,'FontSize',18,...
                'ButtonPushedFcn', @(closeNewStudyBtn,event) closeNewStudy_push());
            
            % reenable new study button
            waitfor(getStudyName)

            
            function closeNewStudy_push()
                
                studyfile = studyPanel.Value;                                               % update studyfile variable from input box
                
                %%%%% Generate a study name with appropriate checks  %%%%%%
                if isempty(studyfile)
                    
                    %disable submit button
                    set(closeNewStudyBtn, 'Enable', 'Off')
                    message = 'Please enter a studyname';  % prompt if there is no filename entered                   
                    Alert(message,GBG, BBG)
                    %reenable submit button
                    set(closeNewStudyBtn, 'Enable', 'On')
                    
                    
                elseif isempty(regexp(studyfile,'[/\*$;@#~(){}:?"<>|]'))
                        
                    studyMatrix = {"number of participants:",uID;...
                        "Study name:", studyfile; "number of stages", 0;...
                        "number of rounds", 0; "frequency output", 0;...
                        "Maximum followers", 0;};                                           %generate the study detail
                    
                    my_directory = pwd;  
                    dgwd = [my_directory '.txt'];
                    
                    studyTable = cell2table(studyMatrix);                                   % convert to a table 
                    studyfilecsv = sprintf('%s.csv',studyfile);                             % generate a csv name for the file 
                    my_directory = pwd;  
                    dgwd = fullfile( my_directory, studyfilecsv ); 
                    
                    writetable(studyTable,dgwd);                                            % write to a csv file to store data
                    close(getStudyName)                                                     % close the input box
                    close(dGameInit_UI)                                                     % close the initiation UI
                    build_researcher_UI(GH,GW,GX,GY,HWXY,GBG,BBG,BH,BW,BXC,BXL,BXR,BY,Mgn,PW,uID, studyTable, studyfilecsv, studyfile )                                     % start the researcher UI for study details
                else
                    
                    %disable submit button
                    set(closeNewStudyBtn, 'Enable', 'Off')
                    message = 'please enter a valid filename';  % prompt if filename entered  is invlaid                 
                    Alert(message,GBG, BBG)
                    %reenable submit button
                    set(closeNewStudyBtn, 'Enable', 'On')

                
                end
            end
        end
    end

function my_closereq(getStudyName,event);
%     
     set(newStudyBtn, 'Enable', 'On')
     set(continueStudyBtn, 'Enable', 'On')
    
    delete(getStudyName)
    
end
end