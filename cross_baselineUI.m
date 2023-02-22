%%%%% Dictator game UI build %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                         Paul Stone                                     %%              
%                   Wright State University                              %%
%                        December 2020                                   %%  
%                                                                        %%
%%%%% This file launches the UI that collects baseline data %%%%%%%%%%%%%%%
%%%%%%  Data is then passed to the CTL Baseline UI    %%%%%%%%%%%%%%%%%%%%%


function cross_baselineUI()

% create the cross UI
    cross_baselineUI = uifigure('Position',[0 15 1960 1045],'Color','white');
    ax1 = uiaxes(cross_baselineUI,'Position',[800 400 400 400],'BackgroundColor','white');
    crossImage = imread('DGcross.png');
    image(crossImage,"Parent", ax1);
    ax1.Visible='off';
    cross_baselineUI.Visible = 'off';

end
