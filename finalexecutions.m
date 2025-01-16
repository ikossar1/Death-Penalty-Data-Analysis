%% Preparing Table

executions = readtable("executions.csv", 'PreserveVariableNames', true); % Loading table into MatLab

% Renaming columns 

executions.Properties.VariableNames(1) = "Victims";
executions.Properties.VariableNames(2) = "Name";
executions.Properties.VariableNames(3) = "Age";
executions.Properties.VariableNames(4) = "Race";
executions.Properties.VariableNames(4) = "Gender";
executions.Properties.VariableNames(5) = "Race";
executions.Properties.VariableNames(6) = "VictimIdentity";
executions.Properties.VariableNames(7) = "State";
executions.Properties.VariableNames(8) = "Region";
executions.Properties.VariableNames(9) = "Method";
executions.Properties.VariableNames(10) = "Juvenile";
executions.Properties.VariableNames(11) = "Federal";
executions.Properties.VariableNames(12) = "Volunteer";
executions.Properties.VariableNames(13) = "ForeignNationality";
executions.Properties.VariableNames(14) = "County";
executions.Properties.VariableNames(15) = "StateAbbreviation";

%To do: 
% 
% 
% finalize final report with all charts and put final stats into final prez (and check over)  
% incorporate machine learning into slideshow 

%% Percentages Based on Identity Characteristics 

% Finding the occurence of White, Black, Native American, Latino, and Asian racial group in the table 

whiteoccurence = find(strcmp(executions.Race,'White')); % Finding every occurence
numberwhite = numel(whiteoccurence); % Totaling 

blackoccurence = find(strcmp(executions.Race,'Black')); % Finding every occurence 
numberblack = numel(blackoccurence); % Totaling

nativeoccurence = find(strcmp(executions.Race,'Native American')); % Finding every occurence
numbernative = numel(nativeoccurence); % Totaling

latinooccurence = find(strcmp(executions.Race,'Latino')); % Finding every occurence
numberlatino = numel(latinooccurence); % Totaling

asianoccurence = find(strcmp(executions.Race,'Asian')); % Finding every occurence
numberasian = numel(asianoccurence); % Totaling

% Making a bar graph with categories of each racial group quantified with
% number of occurences

x = [ "White" "Black" "Native American" "Latino" "Asian" ];
y = [ numberwhite numberblack numbernative numberlatino numberasian];

bar(x,y)
title('Number of Executions by Race')
xlabel('Race') 
ylabel('Number of Executions')

figure 

% Finding the occurence of Female and Male gender group in the table 

femaleoccurence = find(strcmp(executions.Gender,'f')); % Finding every occurence
numberfemale = numel(femaleoccurence); % Totaling 

maleoccurence = find(strcmp(executions.Gender,'m')); % Finding every occurence
numbermale = numel(maleoccurence); % Totaling 

% Making a bar graph with categories of each gender group quantified with
% number of occurences

f = [ "Female" "Male" ];
m = [ numberfemale numbermale];

bar(f,m)
title('Number of Executions by Gender')
xlabel('Gender') 
ylabel('Number of Executions')

figure

% Finding the occurence of each age (by 10 year categoreies) group in the table 

twentytothirty = find(executions.Age >= 20 & executions.Age < 30 );
numbertwentytothirty = numel(twentytothirty);

thirtytofourty = find(executions.Age >= 30 & executions.Age < 40 );
numberthirtytofourty = numel(thirtytofourty);

fourtytofifty = find(executions.Age >= 40 & executions.Age < 50 );
numberfourtytofifty = numel(fourtytofifty);

fiftytosixty = find(executions.Age >= 50 & executions.Age < 60 );
numberfiftytosixty = numel(fiftytosixty);

sixtytoseventy = find(executions.Age >= 60 & executions.Age < 70 );
numbersixtytoseventy = numel(sixtytoseventy);

seventytoeighty = find(executions.Age >= 70 & executions.Age < 80 );
numberseventytoeighty = numel(seventytoeighty);

eightytoninety = find(executions.Age >= 80 & executions.Age < 90 );
numbereightytoninety = numel(eightytoninety);

% Making a bar graph with categories of each age group quantified with
% number of occurences

a = [ "20-30" "30-40" "40-50" "50-60" "60-70" "70-80" "80-90" ];
b = [ numbertwentytothirty numberthirtytofourty numberfourtytofifty numberfiftytosixty numbersixtytoseventy numberseventytoeighty numbereightytoninety ];

bar(a,b)
title('Number of Executions by Age Range')
xlabel('Age Range') 
ylabel('Number of Executions')

%% Correlation between execution method and identity characteristics - error in white, latino, male, female, 70-80 pie chart 

% racial correlations

methodandrace = groupcounts(executions,["Method","Race"]); % Creating a table that displays number of racial groups in each execution method 

% Finding and making pie chart that displays likelihood of each execution
% method for black race (comment repeated for all race, gender, and age
% groups)

blackelectrocutiontotal = methodandrace.GroupCount(1); % Identifying where in table black racial group occurs for electrocution method
blackelectrocutionpercentage = blackelectrocutiontotal/numberblack; % Divinding black racial group occurence for electrocution by total black racial group occurences
blackgaschambertotal = methodandrace.GroupCount(6); % Identifying where in table black racial group occurs for gas chamber method
blackgaschamberpercentage = blackgaschambertotal/numberblack; % Divinding black racial group occurence for gas chamber by total black racial group occurences
blacklethalinjectiontotal = methodandrace.GroupCount(10); % Identifying where in table black racial group occurs for lethal injection method
blacklethalinjectionpercentage = blacklethalinjectiontotal/numberblack; % Divinding black racial group occurence for lethal injection by total black racial group occurences

% Preparing pie chart for Black racial group 

executionmethod = [ "electrocution" "gas chamber" "lethalinjection" ]; % Setting pie chart categories
numberblackexecutionsbytype = [ blackelectrocutionpercentage blackgaschamberpercentage blacklethalinjectionpercentage ]; % Assigning pie chart categories to percentages
blackexecutiontable = table(executionmethod, numberblackexecutionsbytype); % setting pie chart categories and percentages into a table to establish correlation
piechart(blackexecutiontable, "numberblackexecutionsbytype", "executionmethod") % pie chart function
title('Likelihood of Execution Method for Black Racial Group')

figure 

% Finding values to put into pie chart that displays likelihood of each execution
% method for white race

whiteelectrocutiontotal = methodandrace.GroupCount(4);
whiteelectrocutionpercentage = whiteelectrocutiontotal/numberwhite;
whitegaschambertotal = methodandrace.GroupCount(7);
whitegaschamberpercentage = whitegaschambertotal/numberwhite;
whitelethalinjectiontotal = methodandrace.GroupCount(14);
whitelethalinjectionpercentage = whitelethalinjectiontotal/numberwhite;
whitehangingtotal = methodandrace.GroupCount(8);
whitehangingpercentange = whitehangingtotal/numberwhite;
whitefiringsquadtotal = methodandrace.GroupCount(5);
whitefiringsquadpercentange = whitefiringsquadtotal/numberwhite;

% Preparing pie chart for white racial group 

executionmethodwhite = [ "electrocution" "gas chamber" "lethalinjection" "hanging" "firingsquad" ];
numberwhiteexecutionsbytype = [ whiteelectrocutionpercentage whitegaschamberpercentage whitelethalinjectionpercentage whitehangingpercentange whitefiringsquadpercentange ];
whiteexecutiontable = table(executionmethodwhite, numberwhiteexecutionsbytype);
piechart(whiteexecutiontable, "numberwhiteexecutionsbytype", "executionmethodwhite")
title('Likelihood of Execution Method for White Racial Group')

figure

% Finding values to put into pie chart that displays likelihood of each execution
% method for native american race

nativeelectrocutiontotal = methodandrace.GroupCount(3);
nativeelectrocutionpercentage = nativeelectrocutiontotal/numbernative;
nativelethalinjectiontotal = methodandrace.GroupCount(12);
nativelethalinjectionpercentage = nativelethalinjectiontotal/numbernative;

% Preparing pie chart for Native American racial group 

executionmethodnative = [ "electrocution" "lethalinjection" ];
numbernativeexecutionsbytype = [ nativeelectrocutionpercentage nativelethalinjectionpercentage ];
nativeexecutiontable = table(executionmethodnative, numbernativeexecutionsbytype);
piechart(nativeexecutiontable, "numbernativeexecutionsbytype", "executionmethodnative")
title('Likelihood of Execution Method for Native American Racial Group')

figure

% Finding values to put into pie chart that displays likelihood of each execution
% method for asian race

asianlethalinjectiontotal = methodandrace.GroupCount(9);
asianlethalinjectionpercentage = asianlethalinjectiontotal/numberasian;

% Preparing pie chart for Asian racial group 

asianexecutionmethod = "lethalinjection";
numberasianexecutionsbytype = asianlethalinjectionpercentage; 
asianexecutiontable = table(asianexecutionmethod, numberasianexecutionsbytype);
piechart(asianexecutiontable, "numberasianexecutionsbytype", "asianexecutionmethod")
title('Likelihood of Execution Method for Asian Racial Group')

figure

% Finding values to put into pie chart that displays likelihood of each execution
% method for latino race

latinoelectrocutiontotal = methodandrace.GroupCount(2);
latinoelectrocutionpercentage = latinoelectrocutiontotal/numberlatino;
latinolethalinjectiontotal = methodandrace.GroupCount(11);
latinolethalinjectionpercentage = latinolethalinjectiontotal/numberlatino;

% Preparing pie chart for Latino racial group 

latinoexecutionmethod = [ "electrocution" "lethalinjection" ];
numberlatinoexecutionsbytype = [ latinoelectrocutionpercentage latinolethalinjectionpercentage ];
latinoexecutiontable = table(latinoexecutionmethod, numberlatinoexecutionsbytype);
piechart(latinoexecutiontable, "numberlatinoexecutionsbytype", "latinoexecutionmethod")
title('Likelihood of Execution Method for Latino Racial Group')

figure

% Gender correlations 

methodandgender = groupcounts(executions,["Method","Gender"]); % Creating a table that displays number of male or females in each execution method 

% Finding values to put into pie chart that displays likelihood of each execution
% method for female gender

femaleelectrocutiontotal = methodandgender.GroupCount(1);
femaleelectrocutionpercentage = femaleelectrocutiontotal/numberfemale;
femalelethalinjectiontotal = methodandgender.GroupCount(6);
femalelethalinjectionpercentage = femalelethalinjectiontotal/numberfemale;

% Preparing pie chart for female gender group 

executionmethodfemale = [ "electrocution" "lethalinjection"];
numberfemaleexecutionsbytype = [ femaleelectrocutionpercentage femalelethalinjectionpercentage ];
femaleexecutiontable = table(executionmethodfemale, numberfemaleexecutionsbytype);
piechart(femaleexecutiontable, "numberfemaleexecutionsbytype", "executionmethodfemale")
title('Likelihood of Execution Method for female population')

figure

% Finding values to put into pie chart that displays likelihood of each execution
% method for male gender

maleelectrocutiontotal = methodandgender.GroupCount(2);
maleelectrocutionpercentage = maleelectrocutiontotal/numbermale;
malegaschambertotal = methodandgender.GroupCount(4);
malegaschamberpercentage = malegaschambertotal/numbermale;
malelethalinjectiontotal = methodandgender.GroupCount(7);
malelethalinjectionpercentage = malelethalinjectiontotal/numbermale;
malehangingtotal = methodandgender.GroupCount(5);
malehangingpercentange = malehangingtotal/numbermale;
malefiringsquadtotal = methodandgender.GroupCount(3);
malefiringsquadpercentange = malefiringsquadtotal/numbermale;

% Preparing pie chart for male gender group 

executionmethodmale = [ "electrocution" "gas chamber" "lethalinjection" "hanging" "firingsquad" ];
numbermaleexecutionsbytype = [ maleelectrocutionpercentage malegaschamberpercentage malelethalinjectionpercentage malehangingpercentange malefiringsquadpercentange ];
maleexecutiontable = table(executionmethodmale, numbermaleexecutionsbytype);
piechart(maleexecutiontable, "numbermaleexecutionsbytype", "executionmethodmale")
title('Likelihood of Execution Method for Male population')

figure 

% Age correlations (follows same commenting from gender and racial groups)


methodandage = groupcounts(executions,["Method","Age"]); % Creating a table that displays number ages and execution method 

% Correlations for 20-30 age group

tt_electrocutiontotal = sum(methodandage.GroupCount(1:6));
tt_electrocutionpercentage = tt_electrocutiontotal/numbertwentytothirty;
tt_gaschambertotal = sum(methodandage.GroupCount(37:38));
tt_gaschamberpercentage = tt_gaschambertotal/numbertwentytothirty;
tt_lethalinjectiontotal = sum(methodandage.GroupCount(49:56));
tt_lethalinjectionpercentage = tt_lethalinjectiontotal/numbertwentytothirty;

tt_executionmethod = [ "electrocution" "gas chamber" "lethalinjection" ];
tt_numberexecutionsbytype = [ tt_electrocutionpercentage tt_gaschamberpercentage tt_lethalinjectionpercentage ];
tt_executiontable = table(tt_executionmethod, tt_numberexecutionsbytype);
piechart(tt_executiontable, "tt_numberexecutionsbytype", "tt_executionmethod")
title('Likelihood of Execution Method for twenty to thirty population')

figure 

% Correlations for 30-40 age group

tf_electrocutiontotal = sum(methodandage.GroupCount(7:16));
tf_electrocutionpercentage = tf_electrocutiontotal/numberthirtytofourty;
tf_gaschambertotal = sum(methodandage.GroupCount(39:43));
tf_gaschamberpercentage = tf_gaschambertotal/numberthirtytofourty;
tf_hangingtotal = sum(methodandage.GroupCount(46:47));
tf_hangingpercentage = tf_hangingtotal/numberthirtytofourty;
tf_firingsquadtotal = sum(methodandage.GroupCount(35));
tf_firingsquadpercentage = tf_firingsquadtotal/numberthirtytofourty;
tf_lethalinjectiontotal = sum(methodandage.GroupCount(57:66));
tf_lethalinjectionpercentage = tf_lethalinjectiontotal/numberthirtytofourty;

tf_executionmethod = [ "electrocution" "gas chamber" "lethalinjection" "hanging" "firingsquad" ];
tf_numberexecutionsbytype = [ tf_electrocutionpercentage tf_gaschamberpercentage tf_lethalinjectionpercentage tf_hangingpercentage tf_firingsquadpercentage];
tf_executiontable = table(tf_executionmethod, tf_numberexecutionsbytype);
piechart(tf_executiontable, "tf_numberexecutionsbytype", "tf_executionmethod")
title('Likelihood of Execution Method for thirty to fourty population')

figure 

% Correlations for 40-50 age group

ff_electrocutiontotal = sum(methodandage.GroupCount(17:26));
ff_electrocutionpercentage = ff_electrocutiontotal/numberfourtytofifty;
ff_firingsquadtotal = methodandage.GroupCount(36);
ff_firingsquadpercentage = ff_firingsquadtotal/numberfourtytofifty;
ff_gaschambertotal = sum(methodandage.GroupCount(44:45));
ff_gaschamberpercentage = ff_gaschambertotal/numberfourtytofifty;
ff_hangingtotal = methodandage.GroupCount(48);
ff_hangingpercentage = ff_hangingtotal/numberfourtytofifty;
ff_lethalinjectiontotal = sum(methodandage.GroupCount(67:76));
ff_lethalinjectionpercentage = ff_lethalinjectiontotal/numberfourtytofifty;

ff_executionmethod = [ "electrocution" "gas chamber" "lethalinjection" "firingsquad" "hanging" ];
ff_numberexecutionsbytype = [ ff_electrocutionpercentage ff_gaschamberpercentage ff_lethalinjectionpercentage ff_firingsquadpercentage ff_hangingpercentage ];
ff_executiontable = table(ff_executionmethod, ff_numberexecutionsbytype);
piechart(ff_executiontable, "ff_numberexecutionsbytype", "ff_executionmethod")
title('Likelihood of Execution Method for fourty to fifty population')

figure 

% Correlations for 50-60 age group

fs_electrocutiontotal = sum(methodandage.GroupCount(27:30));
fs_electrocutionpercentage = fs_electrocutiontotal/numberfiftytosixty;
fs_lethalinjectiontotal = sum(methodandage.GroupCount(77:86));
fs_lethalinjectionpercentage = fs_lethalinjectiontotal/numberfiftytosixty;

fs_executionmethod = [ "electrocution" "lethalinjection" ];
fs_numberexecutionsbytype = [ fs_electrocutionpercentage fs_lethalinjectionpercentage ];
fs_executiontable = table(fs_executionmethod, fs_numberexecutionsbytype);
piechart(fs_executiontable, "fs_numberexecutionsbytype", "fs_executionmethod")
title('Likelihood of Execution Method for fifty to sixty population')

figure 

% Correlations for 60-70 age group

ss_electrocutiontotal = sum(methodandage.GroupCount(31:34));
ss_electrocutionpercentage = ss_electrocutiontotal/numbersixtytoseventy;
ss_lethalinjectiontotal = sum(methodandage.GroupCount(87:94));
ss_lethalinjectionpercentage = ss_lethalinjectiontotal/numbersixtytoseventy;

ss_executionmethod = [ "electrocution" "lethalinjection" ];
ss_numberexecutionsbytype = [ ss_electrocutionpercentage ss_lethalinjectionpercentage ];
ss_executiontable = table(ss_executionmethod, ss_numberexecutionsbytype);
piechart(ss_executiontable, "ss_numberexecutionsbytype", "ss_executionmethod")
title('Likelihood of Execution Method for sixty to seventy population')

figure 

% Correlations for 70-80 age group

se_lethalinjectiontotal = sum(methodandage.GroupCount(95:100));
se_lethalinjectionpercentage = se_lethalinjectiontotal/numberseventytoeighty;

se_executionmethod = "lethalinjection";
se_numberexecutionsbytype = se_lethalinjectionpercentage;
se_executiontable = table(se_executionmethod, se_numberexecutionsbytype);
piechart(se_executiontable, "se_numberexecutionsbytype", "se_executionmethod")
title('Likelihood of Execution Method for seventy to eighty population')

figure 

% Correlations for 80-90 age group

en_lethalinjectiontotal = methodandage.GroupCount(101);
en_lethalinjectionpercentage = en_lethalinjectiontotal/numbereightytoninety;

en_executionmethod = "lethalinjection";
en_numberexecutionsbytype = en_lethalinjectionpercentage;
en_executiontable = table(en_executionmethod, en_numberexecutionsbytype);
piechart(en_executiontable, "en_numberexecutionsbytype", "en_executionmethod")
title('Likelihood of Execution Method for eighty to ninety population')

%% Geo Map Illustrating Where Execution is Most Prevalent: try doing actual code for all states some have shortcuts 

% Making table with state longitude and latitudes (commenting repeated for
% all states)

alabama = find(strcmp(executions.State,'Alabama')); % Finding occurence of executions in the state of Alabama
alabamaquantity = numel(alabama); % Totaling Alabama occurences

alaska = find(strcmp(executions.State,'Alaska'));
alaskaquantity = numel(alaska);

arizona = find(strcmp(executions.State,'Arizona'));
AZquantity = numel(arizona);

arkansas = find(strcmp(executions.State,'Arkansas'));
ALquantity = numel(arkansas);

CA = find(strcmp(executions.State,'California'));
CAquantity = numel(CA);

CO = find(strcmp(executions.State,'Colorado'));
COquantity = numel(CO);

CT = find(strcmp(executions.State,'Connecticut'));
CTquantity = numel(CT);

Delaware = find(strcmp(executions.State,'Delaware'));
Delawarequantity = numel(Delaware);

DCquantity = 0;

Florida = find(strcmp(executions.State,'Florida'));
FAquantity = numel(Florida);

GA = find(strcmp(executions.State,'Georgia'));
GAquantity = numel(GA);

hawaiiquantity = 0;

Idaho = find(strcmp(executions.State,'Idaho'));
Idahoquantity = numel(Idaho);

Illinois = find(strcmp(executions.State,'Illinois'));
Illinoisquantity = numel(Illinois);

Indiana = find(strcmp(executions.State,'Indiana'));
INquantity = numel(Indiana);

Iowa = find(strcmp(executions.State,'Iowa'));
Iowaquantity = numel(Iowa);

Kansas = find(strcmp(executions.State,'Kansas'));
kansasquantity = numel(Kansas);

kentucky = find(strcmp(executions.State,'Kentucky'));
kentuckyquantity = numel(kentucky);

louisiana = find(strcmp(executions.State,'Louisiana'));
LAquantity = numel(louisiana);

ME = find(strcmp(executions.State,'Maine'));
MEquantity = numel(ME);

maryland = find(strcmp(executions.State,'Maryland'));
marlyandquantity = numel(maryland);

MA = find(strcmp(executions.State,'Massachusets'));
MAquantity = numel(MA);

Michigan = find(strcmp(executions.State,'Michigan'));
michiganquantity = numel(Michigan);

Minnesota = find(strcmp(executions.State,'Minnesota'));
minnesotaquantity = numel(Minnesota);

mississippi = find(strcmp(executions.State,'Mississippi'));
mississippiquantity = numel(mississippi);

missouri = find(strcmp(executions.State,'missouri'));
missouriquantity = numel(missouri);

montana = find(strcmp(executions.State,'Montana'));
montanaquantity = numel(montana);

nebraska = find(strcmp(executions.State,'Nebraska'));
nebraskaquantity = numel(nebraska);

nevada = find(strcmp(executions.State,'Nevada'));
nevadaquantity = numel(nevada);

NH = find(strcmp(executions.State,'NewHampshire'));
NHquantity = numel(NH);

NJ = find(strcmp(executions.State,'NewJersey'));
NJquantity = numel(NJ);

newmexico = find(strcmp(executions.State,'NewMexico'));
NMquantity = numel(newmexico);

NY = find(strcmp(executions.State,'NewYork'));
NYquantity = numel(NY);

NC = find(strcmp(executions.State,'NorthCarolina'));
NCquantity = numel(NC);

ND = find(strcmp(executions.State,'NorthDakota'));
NDquantity = numel(ND);

ohio = find(strcmp(executions.State,'Ohio'));
ohioquantity = numel(ohio);

OK = find(strcmp(executions.State,'Oklahoma'));
OKquantity = numel(OK);

oregon = find(strcmp(executions.State,'Oregon'));
oregonquantity = numel(oregon);

pennsylvania = find(strcmp(executions.State,'Pennsylvania'));
pennsylvaniaquantity = numel(pennsylvania);

RD = find(strcmp(executions.State,'RhodeIsland'));
RDquantity = numel(RD);

SC = find(strcmp(executions.State,'SouthCarolina'));
SCquantity = numel(SC);

SD = find(strcmp(executions.State,'SouthDakota'));
SDquantity = numel(SD);

TN = find(strcmp(executions.State,'Tennessee'));
TNquantity = numel(TN);

TX = find(strcmp(executions.State,'Texas'));
TXquantity = numel(TX);

UT = find(strcmp(executions.State,'Utah'));
UTquantity = numel(UT);

vermont = find(strcmp(executions.State,'Vermont')); 
vermontquantity = numel(vermont);

VA = find(strcmp(executions.State,'Virginia'));
VAquantity = numel(VA);

WA = find(strcmp(executions.State,'Washington'));
WAquantity = numel(WA);

WV = find(strcmp(executions.State,'WestVirginia'));
WVquantity = numel(WV);


WI = find(strcmp(executions.State,'Wisconsin'));
WIquantity = numel(WI);

WY = find(strcmp(executions.State,'Wyoming'));
WYquantity = numel(WY);

% Making a table with states, longitudes, and latitudes

sizedata = [ alabamaquantity;alaskaquantity;AZquantity;ALquantity;CAquantity;COquantity;CTquantity;Delawarequantity;DCquantity;FAquantity;GAquantity;hawaiiquantity;Idahoquantity;Illinoisquantity;INquantity;Iowaquantity;kansasquantity;kentuckyquantity;LAquantity;MEquantity;marlyandquantity;MAquantity;michiganquantity;minnesotaquantity;mississippiquantity;missouriquantity;montanaquantity;nebraskaquantity;nevadaquantity;NHquantity;NJquantity;NMquantity;NYquantity;NCquantity;NDquantity;ohioquantity;OKquantity;oregonquantity;pennsylvaniaquantity;RDquantity;SCquantity;SDquantity;TNquantity;TXquantity;UTquantity;vermontquantity;VAquantity;WAquantity;WVquantity;WIquantity;WYquantity]; % column with number of executions from each state
state = [ "Alabama";"Alaska";"Arizona";"Arkansas";"California";"Colorado";"Connecticut";"delaware";"DC";"Florida";"Georgia";"Hawaii";"Idaho";"Illinois";"Indiana";"Iowa";"Kansas";"Kentucky";"Louisiana";"Maine";"Maryland";"Massachusets";"Michigan";"Minnesota";"Mississippi";"Missouri";"Montana";"Nebraska";"Nevada";"New Hampshire";"New Jersey";"New Mexico";"New York";"North Carolina";"North Dakota"; "Ohio"; "Oklahoma"; "oregon"; "Pennsylvania"; "Rhode Island"; "South Carolina"; "South Dakota"; "Tennessee"; "Texas"; "Utah"; "Vermont"; "Virginia"; "Wasington";"West Virginia";"Wisconsin";"Wyoming"]; 
lat = [ 32.8, 61.4, 33.7, 35, 36.1, 39.1, 41.2, 39.3, 38.9, 27.8, 33, 21.1, 44.2, 40.3, 39.8, 42, 38.5, 37.7, 31.2, 44.7, 39, 42.2, 43.4, 45.7, 32.7, 38.5, 46.9, 41.1, 38.3, 43.5, 40.3, 34.8, 42.1, 35.6, 47.5, 40.3, 35.6, 44.6, 40.6, 41.7, 33.9, 44.3, 35.7, 31, 40.2, 44, 37.8, 47.4, 38.5, 44.3, 42.8]; % Latitude of each state
lat = lat';
long = [ -86.8, -152.4, -111.4, -92.4, -120, -105.3, -72.8, -75.5, -77, -81.7, -83.6, -157.5, -114.5, -89, -86, -93, -96.7, -84.7, -91.9, -69.4, -76.8, -71.5, -84.5, -93.9, -89.7, -92.3, -110.5, -98.3, -117.1, -71.6, -74.5, -106.2, -74.9, -79.8, -99.8, -82.8, -96.9, -112.1, -77.2, -71.5, -80.9, -99.4, -86.7, -97.6, -111.9, -72.7, -78.2, -121.5, -81, -89.6, -107.3]; % Longitude of each state
long = long';

statelonglat = table(state, long, lat, sizedata); % Putting columns (variables) into table

geobubble(statelonglat.lat, statelonglat.long, statelonglat.sizedata) % Making map with bubbles of each state sized by occurence of execution in each state
title("Prevalence of Execution by State in the United States")

%% Calculating likelihood of execution based on race, gender, and age data differently - in report include states
 
ageinput = input('What is the defendants age range given a) 20-30 b) 30-40 c) 40-50 d) 50-60 e)60-70 f) 70-80 g)80-90?', 's'); % Asking user for age of defendant
raceinput = input('What is the defendants race given Black, White, Native American, Asian, or Latino?', 's'); % Asking user for race of defendant
genderinput = input('What is the defendants gender (male or female)?', 's'); % Asking user for gender of defendant

strgenderinput = string(genderinput); % Setting gender input into a string

if strgenderinput == "female" % if conditionals to assign likelyhood of each executions method based on gender characteristics of defendant (repeated for all conditionals)

    genderlectrocution = .104; % Likelihood of electrocution for gender input 
    gendergaschamber = 0; % Likelihood of gas chamber for gender input 
    genderlethalinjection = .879; % Likelihood of lethal injection for gender input 
    genderhung = 0; % Likelihood of hanging for gender input 
    genderfiresquad = 0; % Likelihood of fire squad for gender input 

elseif strgenderinput == "male"

    genderlectrocution = .0012;
    gendergaschamber = .1044;
    genderlethalinjection = .0097;
    genderhung = .0036;
    genderfiresquad = .0012;

end 

strraceinput = string(raceinput);

if strraceinput == "Black" % if conditionals to assign likelyhood of each executions method based on racial characteristics of defendant

    racelectrocution = .138;
    racegaschamber = .00591;
    racelethalinjection = .856;
    racehung = 0;
    racefiresquad = 0; 

elseif strraceinput == "White" % why does it output hi world for white 

    racelectrocution = .104;
    racegaschamber = 0;
    racelethalinjection = .856;
    racehung = 0;
    racefiresquad = 0; 

elseif strraceinput == "Latino"

    racelectrocution = .138;
    racegaschamber = .00364;
    racelethalinjection = .879;
    racehung = .0036;
    racefiresquad = .0036; 

elseif strraceinput == "Native American"

    racelectrocution = .0625;
    racegaschamber = 0;
    racelethalinjection = .938;
    racehung = 0;
    racefiresquad = 0; 
    
elseif strraceinput == "Asian"

    racelectrocution = 0;
    racegaschamber = 0;
    racelethalinjection = 1.00;
    racehung = 0;
    racefiresquad = 0; 

end

strageinput = string(ageinput);

if strageinput == "a" % if conditionals to assign likelyhood of each executions method based on age characteristics of defendant

    ageelectrocution = .13;
    agegaschamber = .0163;
    agelethalinjection = .854;
    agehung = 0;
    agefiresquad = 0;

elseif strageinput == "b"

    ageelectrocution = .138;
    agegaschamber = .0123;
    agelethalinjection = .843;
    agehung = .0035;
    agefiresquad = .0035;
    disp('Hi world')

elseif strageinput == "c"

    ageelectrocution = .103;
    agegaschamber = .00404;
    agelethalinjection = .889;
    agehung = .002;
    agefiresquad = .002;

elseif strageinput == "d"

    ageelectrocution = .0317;
    agegaschamber = 0;
    agelethalinjection = .968;
    agehung = 0;
    agefiresquad = 0;

elseif strageinput == "e"

    ageelectrocution = .0923;
    agegaschamber = 0;
    agelethalinjection = .908;
    agehung = 0;
    agefiresquad = 0;

elseif strageinput == "f"

    ageelectrocution = 0;
    agegaschamber = 0;
    agelethalinjection = 1.00;
    agehung = 0;
    agefiresquad = 0;

elseif strageinput == "g"

    ageelectrocution = 0;
    agegaschamber = 0;
    agelethalinjection = 1.00;
    agehung = 0;
    agefiresquad = 0;

end

% Finding probability of each execution method based on likelihood of
% execution method based on race, gender, and age

probabilityeletrocuted = ageelectrocution * racelectrocution *  genderlectrocution;
probabilitygaschamber = agegaschamber * racegaschamber * gendergaschamber;
probabilitylethalinjection = agelethalinjection * racelethalinjection * genderlethalinjection;
probabilityhung = agehung * racehung * genderhung;
probabilityfiresquad = agefiresquad * racefiresquad * genderfiresquad;

% Displaying probability of each execution method based

displayvariable = ['The probability the defendant gets electrocuted is ', num2str(probabilityeletrocuted), '. The probability the defendant is executed through the gas chamber method is ', num2str(probabilitygaschamber), '. The probability that the defendant gets executed through the lethal injection method is ', num2str(probabilitylethalinjection), '. The probability that the defendant gets executed through the hanging method is ', num2str(probabilityhung), '. And the probability that the defendant gets executed through the fire squad method is ', num2str(probabilityfiresquad), '.'];
disp(displayvariable)













