function build_vid_question_UI(device, n_stages, n_rounds, n_frequency, game_start_time, n_final_followers, uID, user_age, user_gender, date_str, slfshList, slfshScore, studyTable, studyfilecsv, studyfile, bln_start_flag, bln_end_flag,cltblnstrt1, cltblnstrt2, cltblnstrt3)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function displays a UI to gather the research details for the game%
% This is only run once for the study - after that, the researcher should %
% choose the 'continue option. This file passes data to User_details_UI.m %


% create the initial UI interface
vid_question_UI = uifigure('Position',[500 200 1000 500]);
% create the title
vid_question_text = 'Please confirm the output files are exported and updated';
rui_title = uilabel(vid_question_UI,'Position',[275 425 550 50],'Text',vid_question_text);
rui_title.FontSize = 24;

Showvid_yn = uidropdown(user_detail_UI,'Value','Select','Items',{'Select','Male','Female','prefer not to say'},'ItemsData',{'Select','Male','Female','prefer not to say'},'Position',[510 240 200 30],'FontSize',16);

user_gender=gender_panel.Value;

% create drop down boxes
num_stages = uidropdown(researcher_UI,'Value',3,'Items',{'1','2','3'},'ItemsData',{1,2,3},'Position',[600 370 50 30],'FontSize',16);
num_rounds = uidropdown(researcher_UI,'Value',10,'Items',{'1','2','3','4','5','6','7','8','9','10'},'ItemsData',{1,2,3,4,5,6,7,8,9,10},'Position',[600 320 50 30],'FontSize',16);
frequency = uidropdown(researcher_UI,'Items',{'64','128','256','512','1024'},'ItemsData',{64,128,256,512,1024},'Position',[600 270 50 30],'FontSize',16);
final_followers = uidropdown(researcher_UI,'Value',3,'Items',{'1','2','3'},'ItemsData',{1,2,3},'Position',[600 220 50 30],'FontSize',16);

% create dd box labels
rui_stages_label_text = 'Input number of stages:  ';
rui_stages_label = uilabel(researcher_UI,'Position',[150 370 450 50],'Text',rui_stages_label_text,'HorizontalAlignment','Right','VerticalAlignment','Bottom');
rui_stages_label.FontSize = 20;