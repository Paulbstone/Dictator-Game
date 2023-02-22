%%%%%%%%%%%%%%%%   Dictator game UI build %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                         Paul Stone                                     %%
%                     stone.123@wright.edu                               %%
%                   Wright State University                              %%
%                        October 2021                                    %%
%                                                                        %%
% This file launches the page that asks a  question to confirm that the  %%
% participant understands the instructions.                              %%
%                                                                        %%
% launches from after pregame_quizUI.m to the build_main_game_UI.m       %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function guide_UI(GH,GW,GX,GY,HWXY,GBG,BBG,BH,BW,BXC,BXL,BXR,BY,Mgn,PW,...
    cross_blUI,vidyes, device, n_stages, n_rounds,...
    n_frequency,game_start_time,n_final_followers, uID, user_age,...
    user_gender, date_str, slfshList, slfshScore, studyTable,studyfilecsv,...
    studyfile, bln_start_flag, bln_end_flag,cltblnstrt1, cltblnstrt2, cltblnstrt3, all_repsonses,behaviours_observed) 

% create the background figure for stage 1 persistant instructions
guide_UI = uifigure('Position',HWXY,'Visible','On','Color', GBG);

%%%%%%%%%%%   Define all the text and labels for the instructions %%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pAGuide = "Your Role";
pAGuideLabel = uilabel(guide_UI,'Position',[Mgn 500 PW 32],'Text',pAGuide,'FontSize',20,'FontWeight','bold','HorizontalAlignment','Center');

pATitle = "Your role was randomly determined. ";
pATitleLabel = uilabel(guide_UI,'Position',[Mgn 450 360 32],'Text',pATitle,'FontSize',20);

pA1a = "Leader is the highest rank that exists.";
pA1aLabel = uilabel(guide_UI,'Position',[Mgn 400 PW 25],'Text',pA1a,'FontSize',20);

pA2a = "You will be a leader during the whole experiment";
pA2aLabel = uilabel(guide_UI,'Position',[Mgn 350 PW 25],'Text',pA2a,'FontSize',20);

pA2a = "You have one employee under your command";
pA2aLabel = uilabel(guide_UI,'Position',[Mgn 300 PW 25],'Text',pA2a,'FontSize',20); 

pA3a = "Please remember that you can make money as you play and that the earnings will be";
pA3aLabel = uilabel(guide_UI,'Position',[Mgn 250 PW 25],'Text',pA3a,'FontSize',20);
pA3b = "calculated in points. These points will then be converted into US Dollars at the ";
pA3bLabel = uilabel(guide_UI,'Position',[Mgn 225 PW 25],'Text',pA3b,'FontSize',20);
pA3c = "end of the game. The rate exchange in this game is: 100 Points = $1.00USD.";
pA3cLabel = uilabel(guide_UI,'Position',[Mgn 200 PW 25],'Text',pA3c,'FontSize',20);



smg_btn = uibutton(guide_UI,'push','Text','Start Game','Visible','On','Position',[BXC, BY, BW, BH],'FontSize',18,...
    'BackgroundColor',BBG,'ButtonPushedFcn', @(smg_btn,event) smg_btn_push());

    function smg_btn_push()

        close(guide_UI);         
        callcross(cross_blUI,HWXY,GBG,BBG, Mgn,PW,BXC,BY,BW,BH)

        %Open the post video quiz to capture the user responses
        build_main_game_UI(GH,GW,GX,GY,HWXY,GBG,BBG,BH,BW,BXC,BXL,BXR,BY,Mgn,PW,...
            cross_blUI,vidyes, device, n_stages, n_rounds,...
            n_frequency,game_start_time,n_final_followers, uID, user_age,...
            user_gender, date_str, slfshList, slfshScore, studyTable,studyfilecsv,...
            studyfile, bln_start_flag, bln_end_flag,cltblnstrt1, cltblnstrt2, cltblnstrt3, all_repsonses,behaviours_observed) 
    end           
end







