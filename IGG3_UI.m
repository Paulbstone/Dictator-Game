%%%%%%%%%%%%%%%%   Dictator game UI build %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                         Paul Stone                                     %%
%                     stone.123@wright.edu                               %%
%                   Wright State University                              %%
%                        October 2021                                    %%
%                                                                        %%
% This file launches the page containting the figure from the info       %%
% screen, specify to the Invictus version                                %%
%                                                                        %%
% launches from round 3 of the main game but does not link to other UI   %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function IGG3_UI(GH,GW,GX,GY,HWXY,GBG,BBG,BH,BW,BXC,BXL,BXR,BY,Mgn,PW)

% create the background figure for stage 1 persistant instructions
igg3_UI = uifigure('Position',HWXY,'Visible','On','Color', GBG);

%%%%%%%%%%%   Define all the text and labels for the instructions %%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pAGuide = "Your Role";
pAGuideLabel = uilabel(igg3_UI,'Position',[Mgn 500 PW 32],'Text',pAGuide,'FontSize',20,'FontWeight','bold','HorizontalAlignment','Center');

pATitle = "Your role was randomly determined. ";
pATitleLabel = uilabel(igg3_UI,'Position',[Mgn 450 360 32],'Text',pATitle,'FontSize',20);

pA1a = "Leader is the highest rank that exists. You will be a leader during the whole experiment.";
pA1aLabel = uilabel(igg3_UI,'Position',[Mgn 400 PW 25],'Text',pA1a,'FontSize',20);

pA2a = "You still have three employees and now have an extra salary option to select from.";
pA2aLabel = uilabel(igg3_UI,'Position',[Mgn 375 PW 25],'Text',pA2a,'FontSize',20);

pA2b = "As the leader, you can decide to change your salary and that of your employees but they do";
pA2bLabel = uilabel(igg3_UI,'Position',[Mgn 350 PW 25],'Text',pA2b,'FontSize',20); 

pA2b = "not see their wages during the experiment. They cannot know what decision the leader takes.";
pA2bLabel = uilabel(igg3_UI,'Position',[Mgn 325 PW 25],'Text',pA2b,'FontSize',20); 

pA3a = "Please remember that you can make money as you play and that the earnings will be";
pA3aLabel = uilabel(igg3_UI,'Position',[Mgn 250 PW 25],'Text',pA3a,'FontSize',20);
pA3b = "calculated in points. These points will then be converted into US Dollars at the end of";
pA3bLabel = uilabel(igg3_UI,'Position',[Mgn 225 PW 25],'Text',pA3b,'FontSize',20);
pA3c = "the game. The rate exchange in this game is: 100 Points = $1.00USD.";
pA3cLabel = uilabel(igg3_UI,'Position',[Mgn 200 PW 25],'Text',pA3c,'FontSize',20);

igg3_btn = uibutton(igg3_UI,'push','Text','Close Guide','Visible','On','Position',[BXC, BY, BW, BH],'FontSize',18,...
    'BackgroundColor',BBG,'ButtonPushedFcn', @(igg3_btn,event) igg3_btn_push());

    function igg3_btn_push()
        close(igg3_UI);         
    end 

end