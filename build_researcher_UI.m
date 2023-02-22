%%%%%%%%%%%%%%%%   Dictator game UI build %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                         Paul Stone                                     %%
%                     stone.123@wright.edu                               %%
%                   Wright State University                              %%
%                        October 2021                                    %%
%                                                                        %%
%    This UI allows options on rouns and stages to be specified          %%
%                                                                        %%
% It links from the dictator_game_init.m and to Vid_Select_UI.m          %%
%                                                                        %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function build_researcher_UI(GH,GW,GX,GY,HWXY,GBG,BBG,BH,BW,BXC,BXL,BXR,BY,Mgn,PW,uID,studyTable, studyfilecsv, studyfile)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function displays a UI to gather the research details for the game%
% This is only run once for the study - after that, the researcher should %
% choose the 'continue option. This file passes data to User_details_UI.m %

% create the initial UI interface
researcher_UI = uifigure('Position',HWXY,'Color',GBG);
% create the title
rui_title_text = 'Researcher Game Selections';
rui_title = uilabel(researcher_UI,'Position',[Mgn 500 PW 50],'Text',rui_title_text,'HorizontalAlignment','Center');
rui_title.FontSize = 24;

% create the Paricipant coutner
rui_participant_count = sprintf('Participant:           %d',uID);
rui_participant = uilabel(researcher_UI,'Position',[Mgn+25 430 PW 50],'Text',rui_participant_count,'HorizontalAlignment','Center');
rui_participant.FontSize = 20;

% create drop down boxes
num_stages = uidropdown(researcher_UI,'Value',3,'Items',{'1','2','3'},'ItemsData',{1,2,3},'Position',[700 370 50 30],'FontSize',16);
num_rounds = uidropdown(researcher_UI,'Value',10,'Items',{'1','2','3','4','5','6','7','8','9','10'},'ItemsData',{1,2,3,4,5,6,7,8,9,10},'Position',[700 320 50 30],'FontSize',16);
final_followers = uidropdown(researcher_UI,'Value',3,'Items',{'1','2','3'},'ItemsData',{1,2,3},'Position',[700 270 50 30],'FontSize',16);

% dummy value of frequency after removing the dropdown
frequency = 64;

% create dd box labels
rui_stages_label_text = 'Input number of stages:  ';
rui_stages_label = uilabel(researcher_UI,'Position',[150 370 500 50],'FontSize',20,...
    'Text',rui_stages_label_text,'HorizontalAlignment','Right','VerticalAlignment','Bottom');

rui_stages_label_text = 'Input number of rounds:  ';
rui_rounds_label = uilabel(researcher_UI,'Position',[150 320 500 50],'FontSize',20,...
    'Text',rui_stages_label_text,'HorizontalAlignment','Right','VerticalAlignment','Bottom');


rui_final_followers_label_text = 'Number of followers for final round:  ';
rui_final_followers_label = uilabel(researcher_UI,'Position',[150 270 500 50],'FontSize',20,...
    'Text',rui_final_followers_label_text,'HorizontalAlignment','Right','VerticalAlignment','Bottom');


%create the initialize button

n_stages = (num_stages.Value);
n_rounds = (num_rounds.Value);
n_frequency = 64; %(frequency.Value);
n_final_followers = (final_followers.Value);
init_btn = uibutton(researcher_UI,'push','Text','Initialize Game','Position',[BXC, BY, BW, BH],'FontSize',18,...
    'BackgroundColor',BBG,'ButtonPushedFcn', @(init_btn,event) init_btn_push());

summary_text = 'The game will last %d Stages, each with %d rounds.\nThe data will be collected at %d Hz';
sum_text_vals = sprintf(summary_text,n_stages,n_rounds,n_frequency);
selcheck = uilabel(researcher_UI,'Position',[Mgn 125 PW 60],'Text',sum_text_vals,'HorizontalAlignment','Center');
selcheck.FontSize =22;

 % set the dd actions
 set(num_stages,'ValueChangedFcn',@ruicbk); 
 set(num_rounds,'ValueChangedFcn',@ruicbk); 
%  set(frequency,'ValueChangedFcn',@ruicbk); 
 set(final_followers,'ValueChangedFcn',@ruicbk); 
     
    function ruicbk(source,eventdata)
        n_stages = (num_stages.Value);
        n_rounds = (num_rounds.Value);
        n_frequency = 64; %(frequency.Value);
        n_final_followers = (final_followers.Value);
        summary_text = 'The game will last %d Stages, each with %d rounds.';
        sum_text_vals = sprintf(summary_text,n_stages,n_rounds);
        set(selcheck,'Text',sum_text_vals);  
    end  

    function init_btn_push()
        % update the study
        studyTable{3,2} = num2cell(n_stages);
        studyTable{4,2} = num2cell(n_rounds); 
        studyTable{5,2} = num2cell(n_frequency); 
        studyTable{6,2} = num2cell(n_final_followers);
        writetable(studyTable,studyfilecsv)
        vid_select_UI(GH,GW,GX,GY,HWXY,GBG,BBG,BH,BW,BXC,BXL,BXR,BY,Mgn,PW,uID, studyTable, n_stages, n_rounds, n_frequency, n_final_followers, studyfilecsv, studyfile);
        close(researcher_UI);
    end
end