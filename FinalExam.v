module FinalExam(clk,reset,segout,L1,L2,L3,B1,B2,B3,scanout,play,buzz,keyBuf);
input clk,reset,play;
output [7:0] segout;
output [2:0] scanout;
output buzz;
output [5:0] keyBuf;

output L1,L2,L3;
input B1,B2,B3;

wire [4:0] playIndex;
wire [14:0]tone;

wire check;
wire stop;
wire [4:0] level;
wire [3:0] sound;

game G(clk,reset,segout,scanout,L1,L2,L3,B1,B2,B3,play,check,stop,level,sound,keyBuf);//
autoPlay P (reset,clk,check,stop,level,sound,playIndex);
toneTable toneOut (playIndex,tone);
toneOut speeker(clk,check,stop,tone,buzz);

endmodule 