-- have fun erik! 😎
return(function(e,n,o,l,a,K,c)local E=e.byte;local I=unpack or table.unpack;local t=tonumber;local A=setmetatable;local N=select;local D=e.char;local Z=table.getn or function(e)return#e end;local f=e.sub;local L=l;local i=pairs;local h=table.concat;local R=getfenv or function()return _ENV end;local H={}for e=c,255 do H[e]=D(e)end;local function s(d)local l,n,o="","",{}local a=256;local e=1;local function c()local l=t(f(d,e,e),36)e=e+1;local n=t(f(d,e,e+l-1),36)e=e+l;return n end;l=D(c())o[1]=l;while e<#d do local e=c()if H[e]then n=H[e]else n=l..f(l,1,1)end;H[a]=l..f(n,1,1)o[#o+1],l,a=n,n,a+1 end;return h(o)end;local r=s('24Z23T24Y27624X27627921E26H26Q27827927624827D27F24Y21E26W27I27J23Y27N27F24M27Q27621E26Q26Q24Z25A27921F21A1W26625H26426X27227324824023V27E27924226227T27K25S28H21E26X28H24Y27328N25W28H24226028N28M28D27U25V28N26S28N23V28N24427X2532792171W21225J25S28X24Y23626C28N26828N23Z28N28U29E26Q26928H23629N27J25U25T28N29H29E1I25X28H26Q26L28N26P2A226D28H1I28J29E24Y29Q29E23625Y28N26G2A925U28K2A629Z29W29E21E25Z28K26E28N24E28K26B28H25U26128S26328N27M2AC26O29R26F2A228R2AC27028K2B929E2422A12AQ2AP27J1I28Z2AQ26728S2AB27J26Q26A2A229Y2BL2B32AQ26T26Q24I24Y21H21K21E22Q21L21G21C21C21E22T21I22T21F21D21C22Q25827F24Z24Y24Z29727629929B29D27J24Y21U23X27F25527924G2502762CM24W2CU24Y22J24Y2542D02D32D52CM2CU2AC2792D52D525224Y2DK27F2512CN24Y24224T2D32DP2D52502DA24Y2DV2DU2DL2CK2792D22DE26T2DT2D52792632CL2792CM2572CN2CP24Y2CR29C2AC26Z2A229W24Z2DO27621O21021N25I25I25J2692AC23T2AZ2AH29E25U2AS2AF26I29R29J24Z2C22EQ2ES26125O25K26R26W26N24C24023L24M25124I25A2F22AL24Z2DM24Y1L1W1Y2CT27F21E26V28K26R28K2AJ2CO2981Y21A26125R2AF26K2AZ28J2DE2CN2EE2D32FT21K21521A25J2AC25E28N24228N24Y2A22AE2CU2CW2AQ26N28N25627X2D624Y24027F24J2762D82DX24Y24G2D32ED2D62E828E2D32782CM2CM2HD2762DK2EG2HN24Y2972EP2HC2E324Y2D22HO2792DK25B2DP24Y25V27625624Y28X2I524Y2EE2HU24Y24C2I62DY2IH2GU2762D52DO2I725223S2HZ2I72HM25N2HZ2HY27626Z2762EG27624G2IT2HX2J32HO2652HZ2422I323Y2IG2762DO24G25F2762EE2I72762FA2D92DL2IB27J2DA2I72HB2762CZ2GG2J827627Z2DA2IV2JW2JL27Z2JK2I22782EE2K32JM2I227F2I22I72I22JV24Y2I22I22HH2K027Z2K927927Z2D527Z2EB2CZ27Z2IO2HZ2H82E52E727F2EA2EC2EC24827F2GI2HA2DB2I32GG2HN24Z2CM2JR2L02GG2H42DJ27J2452DP24224L2EF2JM2KN26A2762JZ27623N2JC24Y2KP2HV2IG2592L62JN2H82J02792DA2E22LX24Y2CZ2HU2HR27Z2JI2M72KG2M02CK28D2HR2LZ2HQ2792C22HR2HR2H82GI2M72HD2CZ2M327624H2J427J2DO2MX2792IF2J32DI2HX24A2IY24Y24O2DP2D22522M62N92DP2ND27F2LI2HM23P2LM2JK24G2NL24Z2NC27F2IA2DO2FT24Y26N2N82DO2D225025H2N82NJ2I02NE2O424Y26R2LU27J2IA2I72JZ2N32DO2N525825R2IK24Y2442DP2NU2NE2OM2CM2NH2792O72E62JM2HH2DW27F2E42IH2OS2LQ2I32KZ2DT2EB2EO2792ER2ET2EV2692G62CQ29A29C27F2LZ2792662H92JL2MV2LA2II2LX24Z2DD2D62DG2772I327J2KI27J2GG2782NV2LV2NB2N72HS2M82PX2P22Q82OR2NE27Z2KW2OW2E32DX2CM2IR2P12NE2QK24Y2P52PX2OR2I827J23626M29I28N2CW2LE2AC2GS2GP2GT27X2GK2GM25J27F2H62792M22L52PO2QR2CU2PZ2JV24Z2HK24Y2I72HR2DK2HH2HR2972L82HW28D2FT2I12I32OC2QS2792IA2IC27F2N32I72N52IJ2IH2IM2DL2IP2JM2QK2J12HZ28X2IX2Q727F2SD2J32RT2J62JM2J82DE2JA2RK2792JD2JF2JN2HU2JK2DA2DO2MR2762JP2PN2792JT2HI2K02DA29E2JX2Q42K72972K62792I22DO2KL2762KB2KF2DQ2TF2TL2LR27Z2KK27J2KN2Q42KQ2Q42KT2JM2KV2762OV2D42KY2EB2HE2MR2AC2QY27F2R02R42792GL2GN2DG28N2GQ2AC2912AC24Q28K2H02R82H72PM2HB2L92U22RF27J2RH2RJ2DK2RM24Y2MA2792TD2M02P02HZ2HZ2I22DE2RX2I92JG2V02S22IG2S526Q2OK2S82TX2DK2SC2J22DK2LE2SG2IZ2HC2J22V52DL2SM2DK2SO2762SQ2MD2ST2VC2MD2SX2Q72T02JL2JQ27J2T52762KE2TA2LE2Q42DA2K22TN2K524Y2TC2TL2KA2SR2KD2TN2I22TP2Q42TI2Q42KO2Q02Q82KS2SA2DK2TZ24Y2U12PQ2QO2U42CN24Z2U62CU2UH2CU2R12GX23X2AQ2GD2UI2H32EC2R52UE2CU27S2UF2UO2RA2UQ2L62PP2LR2OK27F2UW2ON2M72HP2M02972FT2HR2D22RT2I02TL2V92IG2VB2SV2VE2SR2VG2VI2SR2VK2SR2IS2SE27F2VQ27J2SJ2Y82I02VW2TM2SP2JB2VD2JE2W32MM2M42JN2W72T22LC2WB2TM2T72RY2KM2K12WL2TN2D52TE2TJ2JN2WV2TK2WQ2ZI2V82TS2WU2ZP2WX2TV2X02KU2I32X52KI2QP2GG2LA2XB27F23627C2XK2UA2FS2UC2R62R22U723X2QZ2XP2R32XS2762RB2T32US2VD2UU2XZ2HJ2NG2Y22PQ2RP2PX2Y72MY2RU2YB2762VA2NS2VC2ID2S32IH2E82VH2S72YK2X12YM2VS2IU2YP2N82SI2VT310W2YV2VY24Y2W02SS2HC2SU2JH2Z22T12Z42JO2SR2Z72PX2WD2JL2WT2WH2ZE2ZI2WK2K72EE2ZK2WP2Z92TL2I22VR2TQ2WN2ZC2ZS2L02KR2S92ZV2QF2UT2762ZZ2EC2XA2792UF31082762UD2GO2XE2QX2XH2CU2UL2AF2H0310E27J2XD27J291310H24Y310J2UR2HE310M2PY2UV310P2U22UZ2MR310T2IV310V310X2V72RW2YD31112YF2N22VF2II31172IL31192IQ2DP2SJ2DK2NV2YQ311G2P32RU311J2J92YY2W22JN2EG2W52HF27F2Z62WA311X2ZC2DA2Q32TA2WI31232JN2K72CM31272KC31292MF2MD2KJ312E2K0312G2DT312I2YL2X32ZX2U32L02DT2DK2AQ26J2R331342XZ2UB312U310A2XC290312Y3139313B2XV2CM2DG2RG313H2Q72UZ2V12N82RR2P32MD310X2ZO2I4313R2RZ31122YG2S4313W2YJ2IN311A2VM314027931452D0311H316031492YX2SR2LU2Z02JN2HH2W52ZG311U2W92CY314K2ZA314Y2WG2TB2TN2DK2ZH2TL2D5314U2TL2KE2MF2WT2TR27F2TT2LW31532TW311A31562KX2E92X82QR315F2762362BU29O2H0310C312S2XN312W2UV2UG31172762R9310I2XU2RD2PX27F315S2CN2RJ2D22UZ2RO2V22ZB313N2YA313P2YC2SR2YE2S1313U2YH31693118316B31402YN2JM3144311F316H31472YU2J7314A316M2YZ311P2SH31222JL2V3314H311V314J2JU314L2JM317C2ZD2K72SZ3195312B31502TL314V3178319L2ZP317B312F2TU312H317G312K2U0317J312N317L312Q2PW27J2GY27J21E317S2CU24I2GR2R3310B2BS315D2LE312T24Y312V315N31832PR2QJ2HG313G31882DP2EE315V2Y4310S2HW2GG3161313Q318J313S318L27631142YI318P312J2SB31412VN3185316G2J0311H31AV316K2VZ314B311O2VC28D2W531972Z3316U2T4316W316Z2WF314O319I2JM3173319J31762ZM312A2MY314Z2WV317D2WY3154317H2ZW319X2X731592X9310227F24U31A92AC29J2UF29O2GD317N2762QY317V2R231AI2D7310K313D2XX2X62Z92RI2DP2RL2YA2MI318D2ML2P32HU31AW318I2I7318K313E2IE313V3116316A31B52VL31B72HZ2ID31BA311C2J331D531BE311L31BG316O2EE2GG2W53172316T2T32JS31BP2TA2ID316Z314P3174314R3171319K2ZL314W2TL2W7312D31C22IH317E2DP31C5319V2X431C8312O2HE2M22LM2FB21N25U25C2PE2EH2PG2FY28E2EN2EG21R21021925C25G27Y2P92ES25Y25O25J26C26H26I24F23V24631ET21B1W21926125I29Z2A124Z2HB21E21E1Z25Y25R25I26C26G26X2442NQ27A21B21O25S25T2652BG31FO2FT21B21K21R31EW2761I28U31AF21H21021J25D2BG31GH2N127K21E1G25I26225J26U26L26W24424G23N24M25324K25522A22621T29Z2F12BL28Z2LE315B312X317T31A431A62CU2XL31A127F2GQ31AF312V2F5317Z2H52UP31CR313C2X93194318631AN31CX2CM2JD2YA2MD310T31D12P32HH31D6310Z316431IA313T31B131DC276313X2VD318Q31B6318S2RN311E31HX31DL2D231I831DO311M316N31932FT31DU2JN319831BN31DY319B2ZA2PZ31BS314S31E52ZI2RV2WO319M2WR31C02Q4319Q3151319S317F2ZU2TY31C72E0317K31CA24Z23Z27R2H427F2RC31AK31852LD2IH2L92S527J2PV3115318T27J23V31412NP2TH313S2QN2762432VC2MR2QA2NP2HC2NP27Z2MU31IC2I231KL31DB2WW31152LP319K24Y23O2762CK31I42792LZ31I62ZE2LW2MP31CS2M331EN2HR2MX2M62HR24M31952HR24N313E2HR24K31DX2792CK31LI318M2KH2IH2502Q627Z24S2DP2I22QA31LT2QC27F31KH2NO2CN2MC313S31KN2YG2TT2DV2O22Q431KH2HO2NE31M031KJ24Y2PJ31KM2Q8318M31M72HX2712K031KH31LY27931ME31M2312E24G2NJ31LV2T624Z2MF2VR2CK31KO2ZF24Y2CK2Q323R2NB26W2JJ24Y31N82CM2NC2NE31ND31KI2CN2H82IV2LK31NJ313A31IY2IA2HR316524Y2MX31KO26J31822MX31NE2DX27Z2IF2U22QA31O22HX2DX2DO2QE2QL319E31NZ2OK2QK2DJ2QM31JL2XY319Y31CA2H42LE31EL2761J2DH31KS2D624V31AJ2502732DT2HL2I325G2H431OV2OK2PT2DE31P031OK26F2PW314Y2IA31IM2IK31KS29728X2692P32KL2HR2DO31L12I724Q2M02EE313M2Z331OT2MV2Q831L127Z24E2M02I223U2MG24Y24U2M02LZ31Q42J02K92C231KY318231L12HD2462M02MX23L2D62D231GP31KP2972S52N331IM2E82IA31QN31OQ318X27931PH2VD31LA2792I731KD31PU2EE31N831PU2DA2MO31BO2LL31PU27Z24P31PZ24Y31LC31PU2CK31K631PU2LZ23Q2M02C231RD31BB31822Q62HC2K92HD2NA31PU2MX2Y627931LC2DS31PU31LF31LM2MZ24Y31LF318M31IQ2II2N331QT31QR31I731QU2VD2IZ31QX2I7313K2792EE31LT31R624Y2L231PU2CZ31QF31RB31S731RE27531RH24Y24B31Q531LD2Z2315Y31NO31342I731EN31KP2OG31SB31SF31SE2VD2HH24W31KS2OD27F31KV2JN31QB2JL31SU2M72CZ2412M02TT31PU2I22NN31LK24Y2SA2M72LZ31TL2M72C22LI31PU2H831MH2L331NO318M31682E82OF31K33163318N31PD316627931TL2T231SS2MS2ZC31SL2ZI31RJ2M72CK31RG31U124Y24931RN2OL2M02H831UT31R831T92Z331NR2N32EE31QO31IF31UH31VA31SG31UN2WC31DY31PR314Z31TV31942HR2CK2NL31RK24Y31VP31U4312931L431VS316V31T92N32DA31VB316P2II2IA31W031SG2CZ2T031QX27Z31UR31E431SZ31Q731UX31QI31PU2C231WG2M72H82KE31R831R52M72MX31PJ31S031VU27931LF31VW27E27Z31S831IE2Q831W131W531TE2CZ31TG31KS2TA2T62WS31Q224731T223K31V031HV31NO24D2M02HD24R31QG24Y31XE2CU2I231QL2N331ML31KP31X531W331JG31UJ2TL31KO31QX2CK31WB2LZ31812HR2C231L32XT2LT31PU2HD2N331WP24Y23M2M031LC31Y827631LF31QZ27631LI31KL2HR2LL24F2U931KW24Y31RA31X031LO2E826O2K02TI27231HL2LQ31OW2LN2DP31P531YT31592Y52D62RQ31JY2D331QK2D62DO2VR31SF2IN27J2182I331R22CZ31YP31MF2ID2IA2I22HB31TH31YU2TI2CX2Q42CK31X4319S2OY2J32162E02QA32082DE31ON24Y');local h=(bit or bit32)and(bit or bit32).bxor or function(e,l)local n,o=1,c while e>c and l>c do local f,d=e%2,l%2 if f~=d then o=o+n end e,l,n=(e-f)/2,(l-d)/2,n*2 end if e<l then e=l end while e>c do local l=e%2 if l>c then o=o+n end e,n=(e-l)/2,n*2 end return o end local function d(n,e,l)if l then local e=(n/2^(e-1))%2^((l-1)-(e-1)+1);return e-e%1;else local e=2^(e-1);return(n%(e+e)>=e)and 1 or c;end;end;local e=1;local C=c;local function n()local o,d,n,l=E(r,e,e+a);o=h(o,178)d=h(d,178)n=h(n,178)l=h(l,178)e=e+4;return(l*16777216)+(n*K)+(d*256)+o;end;local function T(...)return{...},N('#',...)end local function s()local l=h(E(r,e,e),178);e=e+1;return l;end;local function t()local n,l=E(r,e,e+2);n=h(n,178)l=h(l,178)e=e+2;return(l*256)+n;end;local function Y()local J={};local l={};local I={};local D={[4]=J,[9]=I,[6]=nil,[7]=l,[2]=nil,[o]={},};local i={}for t=1,s()==c and t()*2 or n()do local l=s();while 1 do if(l==a)then local n,e=n(),n();local d,o,e,n=1,(d(e,1,20)*(2^32))+n,d(e,21,31),((-1)^d(e,32));if e==c then if o==c then l=n*c break;else e=1;d=c;end;elseif(e==2047)then l=(n*((o==c and 1 or c)/c))break;end;l=(n*(2^(e-1023)))*(d+(o/(2^52)));break;end if(l==2)then l=(s()~=c);break;end if(l==c)then local n=n();l=f(r,e,e+n-1);e=e+n;break;end if(l==1)then local o,d,n='',n();if(d==c)then l=o;break;end;n=f(r,e,e+d-1);n={E(n,1,#n)}e=e+d;for e=1,Z(n)do o=o..H[h(n[e],178)]end l=o break;end l=nil break;end i[t]=l;end;if C<1 then C=1 local l=t()D[8]=f(r,e,e+l-1)e=e+l end for e=1,n()do I[e-1]=Y();end;for r=1,n()do local e=s();if(d(e,1,1)==c)then local h=d(e,4,6);local I,s,H,f=t(),s()==1,t(),{};local l=d(e,2,a);local e={[7]=H,[9]=I,[6]=nil,[o]=s,};if(l==c)then e[o],e[6]=t(),t()end if(l==1)then e[o]=n()end if(l==2)then e[o]=n()-K end if(l==a)then e[o],e[6]=n()-K,t()end if(d(h,1,1)==1)then f[7]=7 e[7]=i[e[7]]end if(d(h,a,a)==1)then f[6]=6 e[6]=i[e[6]]end if(d(h,2,2)==1)then f[o]=o e[o]=i[e[o]]end if s then L(D[o],e)e[a]=f end J[r]=e;end end;D[2]=s();return D;end;local function J(e,C,r,l)local d=e[4];local L=c;local l=e[2];local s=e[o];local t=e[9];local n={}local e=e[6];return function(...)local K=N('#',...)-1;local n={};local N={};local M={};local f=l;local Z=t;local H={...};local l=1;local t=-1;local E=T local d=d;for e=c,K do if(e>=f)then N[e-f]=H[e+1];else n[e]=H[e+1];end;end;local e;local f=K-f+1 local f;while true do e=d[l];f=e[9];if L>c then n[e[7]]=e[o];end if f<=63 then if f<=31 then if f<=15 then if f<=7 then if f<=a then if f<=1 then if f>c then local a;local i;local f;n[e[7]]=n[e[o]];l=l+1;e=d[l];f=e[7]n[f]=n[f]()l=l+1;e=d[l];n[e[7]]=r[e[o]];l=l+1;e=d[l];n[e[7]]=n[e[o]];l=l+1;e=d[l];f=e[7]i={n[f](n[f+1])};a=c;for e=f,e[6]do a=a+1;n[e]=i[a];end l=l+1;e=d[l];l=e[o];else n[e[7]]=n[e[o]]%e[6];end;elseif f==2 then n[e[7]]={};l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];else local l=e[7];local d=n[l];local f=50*e[6];for e=l+1,e[o]do d[f+e-l]=n[e]end;end;elseif f<=o then if f>4 then n[e[7]]=e[o];else local d=e[7]local o={n[d](I(n,d+1,e[o]))};local l=c;for e=d,e[6]do l=l+1;n[e]=o[l];end end;elseif f>6 then l=n[e[7]]==n[e[6]]and e[o]or l+1;else local H;local K;local I;local E,t,f,C;n[e[7]]=e[o];l=l+1;e=d[l];for n,l in i(s)do for d,n in i(l[a])do E,t,f,C={l[n]:byte(1,#l[n])},'',e[7],e[o]for e=1,#E do t,f=t..D(h(E[e],f)),(f+C)%256 end l[n],l[a]=t,{};end end;l=l+1;e=d[l];n[e[7]]=r[e[o]];l=l+1;e=d[l];n[e[7]]=n[e[o]];l=l+1;e=d[l];I=e[7]K={n[I](n[I+1])};H=c;for e=I,e[6]do H=H+1;n[e]=K[H];end l=l+1;e=d[l];l=e[o];end;elseif f<=11 then if f<=9 then if f==8 then local e=e[7]n[e]=n[e]()else local f;local f;local K,Z;local H;local N,C,J,L;for n,l in i(s)do for d,n in i(l[a])do N,C,J,L={l[n]:byte(1,#l[n])},'',e[7],e[o]for e=1,#N do C,J=C..D(h(N[e],J)),(J+L)%256 end l[n],l[a]=C,{};end end;l=l+1;e=d[l];n[e[7]]=r[e[o]];l=l+1;e=d[l];n[e[7]]=r[e[o]];l=l+1;e=d[l];H=e[7]K,Z=E(n[H]())t=Z+H-1 f=c;for e=H,t do f=f+1;n[e]=K[f];end;l=l+1;e=d[l];H=e[7]K={n[H](I(n,H+1,t))};f=c;for e=H,e[6]do f=f+1;n[e]=K[f];end l=l+1;e=d[l];l=e[o];end;elseif f>10 then n[e[7]]=n[e[o]]*n[e[6]];else local d=e[7];local a=e[6];local f=d+2 local d={n[d](n[d+1],n[f])};for e=1,a do n[f+e]=d[e];end;local d=d[1]if d then n[f]=d l=e[o];else l=l+1;end;end;elseif f<=13 then if f==12 then local f;local a;n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o]^n[e[6]];l=l+1;e=d[l];n[e[7]]=n[e[o]]/n[e[6]];l=l+1;e=d[l];n[e[7]]=n[e[o]];l=l+1;e=d[l];n[e[7]]=n[e[o]]%e[6];l=l+1;e=d[l];n[e[7]]=n[e[o]]-n[e[6]];l=l+1;e=d[l];n[e[7]]=e[o]-n[e[6]];l=l+1;e=d[l];n[e[7]]=e[o]^n[e[6]];l=l+1;e=d[l];n[e[7]]=n[e[o]]*n[e[6]];l=l+1;e=d[l];n[e[7]]=n[e[o]]%e[6];l=l+1;e=d[l];n[e[7]]=n[e[o]]+n[e[6]];l=l+1;e=d[l];n[e[7]]=n[e[o]][n[e[6]]];l=l+1;e=d[l];a=e[o];f=n[a]for e=a+1,e[6]do f=f..n[e];end;n[e[7]]=f;else local c;local a;local f;n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];f=e[7];a=n[f];c=50*e[6];for e=f+1,e[o]do a[c+e-f]=n[e]end;end;elseif f==14 then l=e[o];else local E;local t;local f;local H,I,r,K;for n,l in i(s)do for d,n in i(l[a])do H,I,r,K={l[n]:byte(1,#l[n])},'',e[7],e[o]for e=1,#H do I,r=I..D(h(H[e],r)),(r+K)%256 end l[n],l[a]=I,{};end end;l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]={};l=l+1;e=d[l];n[e[7]]=n[e[o]][e[6]];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];f=e[7];t=n[f]E=n[f+2];if(E>c)then if(t>n[f+1])then l=e[o];else n[f+a]=t;end elseif(t<n[f+1])then l=e[o];else n[f+a]=t;end end;elseif f<=23 then if f<=19 then if f<=17 then if f==16 then local f;local a;n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o]^n[e[6]];l=l+1;e=d[l];n[e[7]]=n[e[o]]/n[e[6]];l=l+1;e=d[l];n[e[7]]=n[e[o]];l=l+1;e=d[l];n[e[7]]=n[e[o]]%e[6];l=l+1;e=d[l];n[e[7]]=n[e[o]]-n[e[6]];l=l+1;e=d[l];n[e[7]]=e[o]-n[e[6]];l=l+1;e=d[l];n[e[7]]=e[o]^n[e[6]];l=l+1;e=d[l];n[e[7]]=n[e[o]]*n[e[6]];l=l+1;e=d[l];n[e[7]]=n[e[o]]%e[6];l=l+1;e=d[l];n[e[7]]=n[e[o]]+n[e[6]];l=l+1;e=d[l];n[e[7]]=n[e[o]][n[e[6]]];l=l+1;e=d[l];a=e[o];f=n[a]for e=a+1,e[6]do f=f..n[e];end;n[e[7]]=f;else local K;local t;local f;local H,I,r,E;for n,l in i(s)do for d,n in i(l[a])do H,I,r,E={l[n]:byte(1,#l[n])},'',e[7],e[o]for e=1,#H do I,r=I..D(h(H[e],r)),(r+E)%256 end l[n],l[a]=I,{};end end;l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]={};l=l+1;e=d[l];n[e[7]]=n[e[o]][e[6]];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];f=e[7];t=n[f]K=n[f+2];if(K>c)then if(t>n[f+1])then l=e[o];else n[f+a]=t;end elseif(t<n[f+1])then l=e[o];else n[f+a]=t;end end;elseif f==18 then local K;local t;local f;local H,I,r,E;for n,l in i(s)do for d,n in i(l[a])do H,I,r,E={l[n]:byte(1,#l[n])},'',e[7],e[o]for e=1,#H do I,r=I..D(h(H[e],r)),(r+E)%256 end l[n],l[a]=I,{};end end;l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]={};l=l+1;e=d[l];n[e[7]]=n[e[o]][e[6]];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];f=e[7];t=n[f]K=n[f+2];if(K>c)then if(t>n[f+1])then l=e[o];else n[f+a]=t;end elseif(t<n[f+1])then l=e[o];else n[f+a]=t;end else n[e[7]]=n[e[o]]+n[e[6]];end;elseif f<=21 then if f>20 then l=n[e[7]]and e[o]or l+1;else local t;local K;local f;local E,H,I,J;n[e[7]]={};l=l+1;e=d[l];for n,l in i(s)do for d,n in i(l[a])do E,H,I,J={l[n]:byte(1,#l[n])},'',e[7],e[o]for e=1,#E do H,I=H..D(h(E[e],I)),(I+J)%256 end l[n],l[a]=H,{};end end;l=l+1;e=d[l];n[e[7]]=r[e[o]];l=l+1;e=d[l];f=e[7]n[f]=n[f]()l=l+1;e=d[l];n[e[7]]=r[e[o]];l=l+1;e=d[l];n[e[7]]=C[e[o]];l=l+1;e=d[l];f=e[7]K={n[f](n[f+1])};t=c;for e=f,e[6]do t=t+1;n[e]=K[t];end l=l+1;e=d[l];l=e[o];end;elseif f==22 then do return end;else n[e[7]]=n[e[o]][e[6]];end;elseif f<=27 then if f<=25 then if f>24 then for e=e[7],e[o]do n[e]=nil;end;else local l=e[7];local o=n[l];local d=50*e[6]for e=l+1,t do o[d+e-l]=n[e]end;end;elseif f==26 then n[e[7]]={};l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];else n[e[7]]=n[e[o]]*n[e[6]];end;elseif f<=29 then if f>28 then for n,l in i(s)do for d,n in i(l[a])do local d,e,o,f={l[n]:byte(1,#l[n])},'',e[7],e[o]for n=1,#d do e,o=e..D(h(d[n],o)),(o+f)%256 end l[n],l[a]=e,{};end end;else local e=e[7]local o,l=E(n[e](I(n,e+1,t)))t=l+e-1 local l=c;for e=e,t do l=l+1;n[e]=o[l];end;end;elseif f==30 then local f;local a;n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o]^n[e[6]];l=l+1;e=d[l];n[e[7]]=n[e[o]]/n[e[6]];l=l+1;e=d[l];n[e[7]]=n[e[o]];l=l+1;e=d[l];n[e[7]]=n[e[o]]%e[6];l=l+1;e=d[l];n[e[7]]=n[e[o]]-n[e[6]];l=l+1;e=d[l];n[e[7]]=e[o]-n[e[6]];l=l+1;e=d[l];n[e[7]]=e[o]^n[e[6]];l=l+1;e=d[l];n[e[7]]=n[e[o]]*n[e[6]];l=l+1;e=d[l];n[e[7]]=n[e[o]]%e[6];l=l+1;e=d[l];n[e[7]]=n[e[o]]+n[e[6]];l=l+1;e=d[l];n[e[7]]=n[e[o]][n[e[6]]];l=l+1;e=d[l];a=e[o];f=n[a]for e=a+1,e[6]do f=f..n[e];end;n[e[7]]=f;else n[e[7]]=n[e[o]]+e[6];end;elseif f<=47 then if f<=39 then if f<=35 then if f<=33 then if f==32 then local c;local a;local f;n[e[7]]={};l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];f=e[7];a=n[f];c=50*e[6];for e=f+1,e[o]do a[c+e-f]=n[e]end;else for e=e[7],e[o]do n[e]=nil;end;end;elseif f>34 then n[e[7]]=n[e[o]]%e[6];else local l=e[7];local d=n[l];local f=50*e[6];for e=l+1,e[o]do d[f+e-l]=n[e]end;end;elseif f<=37 then if f==36 then local E;local t;local f;local H,I,r,K;for n,l in i(s)do for d,n in i(l[a])do H,I,r,K={l[n]:byte(1,#l[n])},'',e[7],e[o]for e=1,#H do I,r=I..D(h(H[e],r)),(r+K)%256 end l[n],l[a]=I,{};end end;l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]={};l=l+1;e=d[l];n[e[7]]=n[e[o]][e[6]];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];f=e[7];t=n[f]E=n[f+2];if(E>c)then if(t>n[f+1])then l=e[o];else n[f+a]=t;end elseif(t<n[f+1])then l=e[o];else n[f+a]=t;end else n[e[7]]=n[e[o]]/n[e[6]];end;elseif f>38 then local f;local i;local a;n[e[7]]=r[e[o]];l=l+1;e=d[l];n[e[7]]=n[e[o]][e[6]];l=l+1;e=d[l];n[e[7]]=n[e[o]];l=l+1;e=d[l];a=e[7]i={n[a](n[a+1])};f=c;for e=a,e[6]do f=f+1;n[e]=i[f];end l=l+1;e=d[l];l=e[o];else n[e[7]]=n[e[o]][n[e[6]]];end;elseif f<=43 then if f<=41 then if f==40 then l=n[e[7]]==n[e[6]]and e[o]or l+1;else n[e[7]][n[e[o]]]=n[e[6]];end;elseif f==42 then local l=e[7]n[l](I(n,l+1,e[o]))else local f;local a;n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o]^n[e[6]];l=l+1;e=d[l];n[e[7]]=n[e[o]]/n[e[6]];l=l+1;e=d[l];n[e[7]]=n[e[o]];l=l+1;e=d[l];n[e[7]]=n[e[o]]%e[6];l=l+1;e=d[l];n[e[7]]=n[e[o]]-n[e[6]];l=l+1;e=d[l];n[e[7]]=e[o]-n[e[6]];l=l+1;e=d[l];n[e[7]]=e[o]^n[e[6]];l=l+1;e=d[l];n[e[7]]=n[e[o]]*n[e[6]];l=l+1;e=d[l];n[e[7]]=n[e[o]]%e[6];l=l+1;e=d[l];n[e[7]]=n[e[o]]+n[e[6]];l=l+1;e=d[l];n[e[7]]=n[e[o]][n[e[6]]];l=l+1;e=d[l];a=e[o];f=n[a]for e=a+1,e[6]do f=f..n[e];end;n[e[7]]=f;end;elseif f<=45 then if f>44 then n[e[7]]={};l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];else n[e[7]]=#n[e[o]];end;elseif f>46 then local f;local a;n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o]^n[e[6]];l=l+1;e=d[l];n[e[7]]=n[e[o]]/n[e[6]];l=l+1;e=d[l];n[e[7]]=n[e[o]];l=l+1;e=d[l];n[e[7]]=n[e[o]]%e[6];l=l+1;e=d[l];n[e[7]]=n[e[o]]-n[e[6]];l=l+1;e=d[l];n[e[7]]=e[o]-n[e[6]];l=l+1;e=d[l];n[e[7]]=e[o]^n[e[6]];l=l+1;e=d[l];n[e[7]]=n[e[o]]*n[e[6]];l=l+1;e=d[l];n[e[7]]=n[e[o]]%e[6];l=l+1;e=d[l];n[e[7]]=n[e[o]]+n[e[6]];l=l+1;e=d[l];n[e[7]]=n[e[o]][n[e[6]]];l=l+1;e=d[l];a=e[o];f=n[a]for e=a+1,e[6]do f=f..n[e];end;n[e[7]]=f;else local e=e[7]n[e]=n[e](n[e+1])end;elseif f<=55 then if f<=51 then if f<=49 then if f==48 then n[e[7]]=n[e[o]]+n[e[6]];else local a;local c;local f;n[e[7]]={};l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];f=e[7];c=n[f];a=50*e[6];for e=f+1,e[o]do c[a+e-f]=n[e]end;end;elseif f>50 then local K;local t;local f;local H,r,I,E;for n,l in i(s)do for d,n in i(l[a])do H,r,I,E={l[n]:byte(1,#l[n])},'',e[7],e[o]for e=1,#H do r,I=r..D(h(H[e],I)),(I+E)%256 end l[n],l[a]=r,{};end end;l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]={};l=l+1;e=d[l];n[e[7]]=n[e[o]][e[6]];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];f=e[7];t=n[f]K=n[f+2];if(K>c)then if(t>n[f+1])then l=e[o];else n[f+a]=t;end elseif(t<n[f+1])then l=e[o];else n[f+a]=t;end else local f;local a;n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o]^n[e[6]];l=l+1;e=d[l];n[e[7]]=n[e[o]]/n[e[6]];l=l+1;e=d[l];n[e[7]]=n[e[o]];l=l+1;e=d[l];n[e[7]]=n[e[o]]%e[6];l=l+1;e=d[l];n[e[7]]=n[e[o]]-n[e[6]];l=l+1;e=d[l];n[e[7]]=e[o]-n[e[6]];l=l+1;e=d[l];n[e[7]]=e[o]^n[e[6]];l=l+1;e=d[l];n[e[7]]=n[e[o]]*n[e[6]];l=l+1;e=d[l];n[e[7]]=n[e[o]]%e[6];l=l+1;e=d[l];n[e[7]]=n[e[o]]+n[e[6]];l=l+1;e=d[l];n[e[7]]=n[e[o]][n[e[6]]];l=l+1;e=d[l];a=e[o];f=n[a]for e=a+1,e[6]do f=f..n[e];end;n[e[7]]=f;end;elseif f<=53 then if f>52 then if(e[7]<n[e[6]])then l=e[o];else l=l+1;end;else local d=e[7];local a=e[6];local f=d+2 local d={n[d](n[d+1],n[f])};for e=1,a do n[f+e]=d[e];end;local d=d[1]if d then n[f]=d l=e[o];else l=l+1;end;end;elseif f>54 then n[e[7]]=r[e[o]];else local c;local a;local f;n[e[7]]={};l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];f=e[7];a=n[f];c=50*e[6];for e=f+1,e[o]do a[c+e-f]=n[e]end;end;elseif f<=59 then if f<=57 then if f==56 then local f;local a;n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o]^n[e[6]];l=l+1;e=d[l];n[e[7]]=n[e[o]]/n[e[6]];l=l+1;e=d[l];n[e[7]]=n[e[o]];l=l+1;e=d[l];n[e[7]]=n[e[o]]%e[6];l=l+1;e=d[l];n[e[7]]=n[e[o]]-n[e[6]];l=l+1;e=d[l];n[e[7]]=e[o]-n[e[6]];l=l+1;e=d[l];n[e[7]]=e[o]^n[e[6]];l=l+1;e=d[l];n[e[7]]=n[e[o]]*n[e[6]];l=l+1;e=d[l];n[e[7]]=n[e[o]]%e[6];l=l+1;e=d[l];n[e[7]]=n[e[o]]+n[e[6]];l=l+1;e=d[l];n[e[7]]=n[e[o]][n[e[6]]];l=l+1;e=d[l];a=e[o];f=n[a]for e=a+1,e[6]do f=f..n[e];end;n[e[7]]=f;else local d=e[7];local i=n[d+2];local f=n[d]+i;n[d]=f;if(i>c)then if(f<=n[d+1])then l=e[o];n[d+a]=f;end elseif(f>=n[d+1])then l=e[o];n[d+a]=f;end end;elseif f>58 then local o=e[7]local d={n[o](I(n,o+1,t))};local l=c;for e=o,e[6]do l=l+1;n[e]=d[l];end else local d=e[7];local i=n[d+2];local f=n[d]+i;n[d]=f;if(i>c)then if(f<=n[d+1])then l=e[o];n[d+a]=f;end elseif(f>=n[d+1])then l=e[o];n[d+a]=f;end end;elseif f<=61 then if f>60 then local E;local t;local f;local H,I,r,K;for n,l in i(s)do for d,n in i(l[a])do H,I,r,K={l[n]:byte(1,#l[n])},'',e[7],e[o]for e=1,#H do I,r=I..D(h(H[e],r)),(r+K)%256 end l[n],l[a]=I,{};end end;l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]={};l=l+1;e=d[l];n[e[7]]=n[e[o]][e[6]];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];f=e[7];t=n[f]E=n[f+2];if(E>c)then if(t>n[f+1])then l=e[o];else n[f+a]=t;end elseif(t<n[f+1])then l=e[o];else n[f+a]=t;end else n[e[7]]=n[e[o]][n[e[6]]];end;elseif f==62 then local K;local t;local f;local H,I,r,E;for n,l in i(s)do for d,n in i(l[a])do H,I,r,E={l[n]:byte(1,#l[n])},'',e[7],e[o]for e=1,#H do I,r=I..D(h(H[e],r)),(r+E)%256 end l[n],l[a]=I,{};end end;l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]={};l=l+1;e=d[l];n[e[7]]=n[e[o]][e[6]];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];f=e[7];t=n[f]K=n[f+2];if(K>c)then if(t>n[f+1])then l=e[o];else n[f+a]=t;end elseif(t<n[f+1])then l=e[o];else n[f+a]=t;end else local l=e[7]n[l]=n[l](I(n,l+1,e[o]))end;elseif f<=95 then if f<=79 then if f<=71 then if f<=67 then if f<=65 then if f==64 then n[e[7]][n[e[o]]]=n[e[6]];else n[e[7]]=C[e[o]];end;elseif f==66 then local e=e[7]local o,l=E(n[e](n[e+1]))t=l+e-1 local l=c;for e=e,t do l=l+1;n[e]=o[l];end;else n[e[7]]=e[o]^n[e[6]];end;elseif f<=69 then if f==68 then n[e[7]]=J(Z[e[o]],nil,r);else n[e[7]]={};end;elseif f==70 then local o=e[o];local l=n[o]for e=o+1,e[6]do l=l..n[e];end;n[e[7]]=l;else do return n[e[7]]end end;elseif f<=75 then if f<=73 then if f>72 then n[e[7]]=#n[e[o]];else n[e[7]]={};l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];end;elseif f==74 then l=n[e[7]]==n[e[6]]and l+1 or e[o];else local o=e[o];local l=n[o]for e=o+1,e[6]do l=l..n[e];end;n[e[7]]=l;end;elseif f<=77 then if f>76 then local c=Z[e[o]];local a;local f={};a=A({},{__index=function(l,e)local e=f[e];return e[1][e[2]];end,__newindex=function(n,e,l)local e=f[e]e[1][e[2]]=l;end;});for a=1,e[6]do l=l+1;local e=d[l];if e[9]==118 then f[a-1]={n,e[o]};else f[a-1]={C,e[o]};end;M[#M+1]=f;end;n[e[7]]=J(c,a,r);else local l=e[7];local d=n[l];local o=50*e[6]for e=l+1,t do d[o+e-l]=n[e]end;end;elseif f==78 then local f;local a;n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o]^n[e[6]];l=l+1;e=d[l];n[e[7]]=n[e[o]]/n[e[6]];l=l+1;e=d[l];n[e[7]]=n[e[o]];l=l+1;e=d[l];n[e[7]]=n[e[o]]%e[6];l=l+1;e=d[l];n[e[7]]=n[e[o]]-n[e[6]];l=l+1;e=d[l];n[e[7]]=e[o]-n[e[6]];l=l+1;e=d[l];n[e[7]]=e[o]^n[e[6]];l=l+1;e=d[l];n[e[7]]=n[e[o]]*n[e[6]];l=l+1;e=d[l];n[e[7]]=n[e[o]]%e[6];l=l+1;e=d[l];n[e[7]]=n[e[o]]+n[e[6]];l=l+1;e=d[l];n[e[7]]=n[e[o]][n[e[6]]];l=l+1;e=d[l];a=e[o];f=n[a]for e=a+1,e[6]do f=f..n[e];end;n[e[7]]=f;else l=n[e[7]]and e[o]or l+1;end;elseif f<=87 then if f<=83 then if f<=81 then if f>80 then local f;local a;n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o]^n[e[6]];l=l+1;e=d[l];n[e[7]]=n[e[o]]/n[e[6]];l=l+1;e=d[l];n[e[7]]=n[e[o]];l=l+1;e=d[l];n[e[7]]=n[e[o]]%e[6];l=l+1;e=d[l];n[e[7]]=n[e[o]]-n[e[6]];l=l+1;e=d[l];n[e[7]]=e[o]-n[e[6]];l=l+1;e=d[l];n[e[7]]=e[o]^n[e[6]];l=l+1;e=d[l];n[e[7]]=n[e[o]]*n[e[6]];l=l+1;e=d[l];n[e[7]]=n[e[o]]%e[6];l=l+1;e=d[l];n[e[7]]=n[e[o]]+n[e[6]];l=l+1;e=d[l];n[e[7]]=n[e[o]][n[e[6]]];l=l+1;e=d[l];a=e[o];f=n[a]for e=a+1,e[6]do f=f..n[e];end;n[e[7]]=f;else n[e[7]]=J(Z[e[o]],nil,r);end;elseif f==82 then local c;local a;local f;n[e[7]]={};l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];f=e[7];a=n[f];c=50*e[6];for e=f+1,e[o]do a[c+e-f]=n[e]end;else n[e[7]]={};l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];end;elseif f<=85 then if f>84 then n[e[7]]={};else local e=e[7]n[e]=n[e](n[e+1])end;elseif f>86 then local f;local a;n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o]^n[e[6]];l=l+1;e=d[l];n[e[7]]=n[e[o]]/n[e[6]];l=l+1;e=d[l];n[e[7]]=n[e[o]];l=l+1;e=d[l];n[e[7]]=n[e[o]]%e[6];l=l+1;e=d[l];n[e[7]]=n[e[o]]-n[e[6]];l=l+1;e=d[l];n[e[7]]=e[o]-n[e[6]];l=l+1;e=d[l];n[e[7]]=e[o]^n[e[6]];l=l+1;e=d[l];n[e[7]]=n[e[o]]*n[e[6]];l=l+1;e=d[l];n[e[7]]=n[e[o]]%e[6];l=l+1;e=d[l];n[e[7]]=n[e[o]]+n[e[6]];l=l+1;e=d[l];n[e[7]]=n[e[o]][n[e[6]]];l=l+1;e=d[l];a=e[o];f=n[a]for e=a+1,e[6]do f=f..n[e];end;n[e[7]]=f;else n[e[7]]=e[o]^n[e[6]];end;elseif f<=91 then if f<=89 then if f==88 then local K;local t;local f;local H,I,r,E;for n,l in i(s)do for d,n in i(l[a])do H,I,r,E={l[n]:byte(1,#l[n])},'',e[7],e[o]for e=1,#H do I,r=I..D(h(H[e],r)),(r+E)%256 end l[n],l[a]=I,{};end end;l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]={};l=l+1;e=d[l];n[e[7]]=n[e[o]][e[6]];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];f=e[7];t=n[f]K=n[f+2];if(K>c)then if(t>n[f+1])then l=e[o];else n[f+a]=t;end elseif(t<n[f+1])then l=e[o];else n[f+a]=t;end else local l=e[7]n[l](I(n,l+1,e[o]))end;elseif f>90 then n[e[7]]=n[e[o]]-n[e[6]];else local l=e[7]n[l]=n[l](I(n,l+1,e[o]))end;elseif f<=93 then if f>92 then local l=e[7]local d={n[l](I(n,l+1,e[o]))};local o=c;for e=l,e[6]do o=o+1;n[e]=d[o];end else n[e[7]]=C[e[o]];end;elseif f==94 then local E;local t;local f;local H,r,I,K;for n,l in i(s)do for d,n in i(l[a])do H,r,I,K={l[n]:byte(1,#l[n])},'',e[7],e[o]for e=1,#H do r,I=r..D(h(H[e],I)),(I+K)%256 end l[n],l[a]=r,{};end end;l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]={};l=l+1;e=d[l];n[e[7]]=n[e[o]][e[6]];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];f=e[7];t=n[f]E=n[f+2];if(E>c)then if(t>n[f+1])then l=e[o];else n[f+a]=t;end elseif(t<n[f+1])then l=e[o];else n[f+a]=t;end else local E;local t;local f;local H,I,r,K;for n,l in i(s)do for d,n in i(l[a])do H,I,r,K={l[n]:byte(1,#l[n])},'',e[7],e[o]for e=1,#H do I,r=I..D(h(H[e],r)),(r+K)%256 end l[n],l[a]=I,{};end end;l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]={};l=l+1;e=d[l];n[e[7]]=n[e[o]][e[6]];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];f=e[7];t=n[f]E=n[f+2];if(E>c)then if(t>n[f+1])then l=e[o];else n[f+a]=t;end elseif(t<n[f+1])then l=e[o];else n[f+a]=t;end end;elseif f<=111 then if f<=103 then if f<=99 then if f<=97 then if f==96 then n[e[7]]=n[e[o]][e[6]];else n[e[7]]=n[e[o]];end;elseif f>98 then n[e[7]]=n[e[o]]/n[e[6]];else local e=e[7]n[e]=n[e]()end;elseif f<=101 then if f>100 then n[e[7]]=r[e[o]];else local l=e[7]local d={n[l](n[l+1])};local o=c;for e=l,e[6]do o=o+1;n[e]=d[o];end end;elseif f==102 then local e=e[7]local o,l=E(n[e]())t=l+e-1 local l=c;for e=e,t do l=l+1;n[e]=o[l];end;else l=n[e[7]]==n[e[6]]and l+1 or e[o];end;elseif f<=107 then if f<=105 then if f>104 then do return end;else local e=e[7]local o,l=E(n[e](I(n,e+1,t)))t=l+e-1 local l=c;for e=e,t do l=l+1;n[e]=o[l];end;end;elseif f==106 then n[e[7]]=e[o]-n[e[6]];else n[e[7]]=n[e[o]]-n[e[6]];end;elseif f<=109 then if f==108 then local f;local H;local K,J;local f;local Z,L,N,M;for n,l in i(s)do for d,n in i(l[a])do Z,L,N,M={l[n]:byte(1,#l[n])},'',e[7],e[o]for e=1,#Z do L,N=L..D(h(Z[e],N)),(N+M)%256 end l[n],l[a]=L,{};end end;l=l+1;e=d[l];n[e[7]]=r[e[o]];l=l+1;e=d[l];n[e[7]]=r[e[o]];l=l+1;e=d[l];n[e[7]]=C[e[o]];l=l+1;e=d[l];f=e[7]K,J=E(n[f]())t=J+f-1 H=c;for e=f,t do H=H+1;n[e]=K[H];end;l=l+1;e=d[l];f=e[7]K,J=E(n[f](I(n,f+1,t)))t=J+f-1 H=c;for e=f,t do H=H+1;n[e]=K[H];end;l=l+1;e=d[l];f=e[7]K={n[f](I(n,f+1,t))};H=c;for e=f,e[6]do H=H+1;n[e]=K[H];end l=l+1;e=d[l];l=e[o];else local o=e[7]local d={n[o](n[o+1])};local l=c;for e=o,e[6]do l=l+1;n[e]=d[l];end end;elseif f>110 then local d=e[7];local f=n[d]local i=n[d+2];if(i>c)then if(f>n[d+1])then l=e[o];else n[d+a]=f;end elseif(f<n[d+1])then l=e[o];else n[d+a]=f;end else local l=e[7]local d={n[l](I(n,l+1,t))};local o=c;for e=l,e[6]do o=o+1;n[e]=d[o];end end;elseif f<=119 then if f<=115 then if f<=113 then if f==112 then local E;local t;local f;local H,I,r,K;for n,l in i(s)do for d,n in i(l[a])do H,I,r,K={l[n]:byte(1,#l[n])},'',e[7],e[o]for e=1,#H do I,r=I..D(h(H[e],r)),(r+K)%256 end l[n],l[a]=I,{};end end;l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]={};l=l+1;e=d[l];n[e[7]]=n[e[o]][e[6]];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o];l=l+1;e=d[l];f=e[7];t=n[f]E=n[f+2];if(E>c)then if(t>n[f+1])then l=e[o];else n[f+a]=t;end elseif(t<n[f+1])then l=e[o];else n[f+a]=t;end else local f;local a;n[e[7]]=e[o];l=l+1;e=d[l];n[e[7]]=e[o]^n[e[6]];l=l+1;e=d[l];n[e[7]]=n[e[o]]/n[e[6]];l=l+1;e=d[l];n[e[7]]=n[e[o]];l=l+1;e=d[l];n[e[7]]=n[e[o]]%e[6];l=l+1;e=d[l];n[e[7]]=n[e[o]]-n[e[6]];l=l+1;e=d[l];n[e[7]]=e[o]-n[e[6]];l=l+1;e=d[l];n[e[7]]=e[o]^n[e[6]];l=l+1;e=d[l];n[e[7]]=n[e[o]]*n[e[6]];l=l+1;e=d[l];n[e[7]]=n[e[o]]%e[6];l=l+1;e=d[l];n[e[7]]=n[e[o]]+n[e[6]];l=l+1;e=d[l];n[e[7]]=n[e[o]][n[e[6]]];l=l+1;e=d[l];a=e[o];f=n[a]for e=a+1,e[6]do f=f..n[e];end;n[e[7]]=f;end;elseif f>114 then n[e[7]]=n[e[o]]+e[6];else l=e[o];end;elseif f<=117 then if f>116 then do return n[e[7]]end else local i=Z[e[o]];local c;local f={};c=A({},{__index=function(l,e)local e=f[e];return e[1][e[2]];end,__newindex=function(n,e,l)local e=f[e]e[1][e[2]]=l;end;});for a=1,e[6]do l=l+1;local e=d[l];if e[9]==118 then f[a-1]={n,e[o]};else f[a-1]={C,e[o]};end;M[#M+1]=f;end;n[e[7]]=J(i,c,r);end;elseif f==118 then n[e[7]]=n[e[o]];else l=n[e[7]]and l+1 or e[o];end;elseif f<=123 then if f<=121 then if f>120 then n[e[7]]=e[o];else local d=e[7];local f=n[d]local i=n[d+2];if(i>c)then if(f>n[d+1])then l=e[o];else n[d+a]=f;end elseif(f<n[d+1])then l=e[o];else n[d+a]=f;end end;elseif f>122 then local e=e[7]local o,l=E(n[e](n[e+1]))t=l+e-1 local l=c;for e=e,t do l=l+1;n[e]=o[l];end;else for n,l in i(s)do for n,d in i(l[a])do local o,n,e,f={l[d]:byte(1,#l[d])},'',e[7],e[o]for d=1,#o do n,e=n..D(h(o[d],e)),(e+f)%256 end l[d],l[a]=n,{};end end;end;elseif f<=125 then if f>124 then if(e[7]<n[e[6]])then l=e[o];else l=l+1;end;else local e=e[7]local o,l=E(n[e]())t=l+e-1 local l=c;for e=e,t do l=l+1;n[e]=o[l];end;end;elseif f==126 then l=n[e[7]]and l+1 or e[o];else n[e[7]]=e[o]-n[e[6]];end;l=l+1;end;end;end;return I({J(Y(),{},R())()})or nil;end)(string,"#",5,table.insert,3,65536,0)