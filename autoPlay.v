module autoPlay(reset,clk,check,stop,level,sound,autoPlayIndex); //
input reset, clk;
output reg [4:0] autoPlayIndex;
input check;
input [4:0]level;
input [3:0] sound; //
output reg [0:0] stop = 0;

reg jiepai, clk1;
reg [4:0] j = 0;
reg [16:0] clkCount = 0;
reg [7:0] count;

always@(posedge clk)
begin
	if(clkCount == 48828)
	begin
		clkCount = 0;
		clk1 = !clk1;
	end
	else
		clkCount = clkCount + 1;
end

always@(posedge clk1)
begin
	if(j == 15)
	begin
		j <= 0;
		jiepai <= !jiepai;
	end
	else
		j <= j+1;
end

always@(posedge jiepai, negedge reset)
begin
	if(!reset)
	begin
		count <= 0;
		stop = 0;
	end
	else
	begin
		if(jiepai == 1 && check == 1 && sound == 0)
		begin
			if(count == 31)
				begin
					count <= 0;
					stop = 1;
				end
				else if(count < 31)
					count <= count + 1;
		end
		else if(jiepai == 1 && check == 1 && sound == 10)
		begin
			if(count == 15)
				begin
					count <= 0;
					stop = 1;
				end
				else if(count < 15)
					count <= count + 1;
		end
		else if(jiepai == 1 && check == 1 && sound == 11)
		begin
			if(count == 155)
				begin
					count <= 0;
					stop = 1;
				end
				else if(count < 155)
					count <= count + 1;
		end
		else if(jiepai == 1 && check == 1 && sound == 12)
		begin
			if(count == 43)
				begin
					count <= 0;
					stop = 1;
				end
				else if(count < 43)
					count <= count + 1;
		end
		else if(jiepai == 1 && check == 1 && sound > 0 && sound < 10)
		begin
			if(count == 7)
				begin
					count <= 0;
					stop = 1;
				end
				else if(count < 7)
					count <= count + 1;
		end
		
		if(check == 0)
		begin
			count <= 0;
			stop = 0;
		end
	end
end

always@(count)
begin
	if(sound == 1)
	begin
		case(count)
			0   : autoPlayIndex <= 5'b01001;  //1
			1   : autoPlayIndex <= 5'b01001;  //1
			2   : autoPlayIndex <= 5'b01001;  //1
			3   : autoPlayIndex <= 5'b01001;  //1
			4   : autoPlayIndex <= 5'b01001;  //1
			5   : autoPlayIndex <= 5'b01001;  //1
			6   : autoPlayIndex <= 5'b01001;  //1
			7   : autoPlayIndex <= 5'b00000;  //0
			default:autoPlayIndex <= 0;
		endcase
	end
	else if(sound == 2)
	begin
		case(count)
			0   : autoPlayIndex <= 5'b01010;  //2
			1   : autoPlayIndex <= 5'b01010;  //2
			2   : autoPlayIndex <= 5'b01010;  //2
			3   : autoPlayIndex <= 5'b01010;  //2
			4   : autoPlayIndex <= 5'b01010;  //2
			5   : autoPlayIndex <= 5'b01010;  //2
			6   : autoPlayIndex <= 5'b01010;  //2
			7   : autoPlayIndex <= 5'b00000;  //0
			default:autoPlayIndex <= 0;
		endcase
	end
	else if(sound == 3)
	begin
		case(count)
			0   : autoPlayIndex <= 5'b01011;  //3
			1   : autoPlayIndex <= 5'b01011;  //3
			2   : autoPlayIndex <= 5'b01011;  //3
			3   : autoPlayIndex <= 5'b01011;  //3
			4   : autoPlayIndex <= 5'b01011;  //3
			5   : autoPlayIndex <= 5'b01011;  //3
			6   : autoPlayIndex <= 5'b01011;  //3
			7   : autoPlayIndex <= 5'b00000;  //0
			default:autoPlayIndex <= 0;
		endcase
	end
	else if(sound == 4)
	begin
		case(count)
			0   : autoPlayIndex <= 5'b01100;  //4
			1   : autoPlayIndex <= 5'b01100;  //4
			2   : autoPlayIndex <= 5'b01100;  //4
			3   : autoPlayIndex <= 5'b01100;  //4
			4   : autoPlayIndex <= 5'b01100;  //4
			5   : autoPlayIndex <= 5'b01100;  //4
			6   : autoPlayIndex <= 5'b01100;  //4
			7   : autoPlayIndex <= 5'b00000;  //0
			default:autoPlayIndex <= 0;
		endcase
	end
	else if(sound == 5)
	begin
		case(count)
			0   : autoPlayIndex <= 5'b01101;  //5
			1   : autoPlayIndex <= 5'b01101;  //5
			2   : autoPlayIndex <= 5'b01101;  //5
			3   : autoPlayIndex <= 5'b01101;  //5
			4   : autoPlayIndex <= 5'b01101;  //5
			5   : autoPlayIndex <= 5'b01101;  //5
			6   : autoPlayIndex <= 5'b01101;  //5
			7   : autoPlayIndex <= 5'b00000;  //0
			default:autoPlayIndex <= 0;
		endcase
	end
	else if(sound == 6)
	begin
		case(count)
			0   : autoPlayIndex <= 5'b01110;  //6
			1   : autoPlayIndex <= 5'b01110;  //6
			2   : autoPlayIndex <= 5'b01110;  //6
			3   : autoPlayIndex <= 5'b01110;  //6
			4   : autoPlayIndex <= 5'b01110;  //6
			5   : autoPlayIndex <= 5'b01110;  //6
			6   : autoPlayIndex <= 5'b01110;  //6
			7   : autoPlayIndex <= 5'b00000;  //0
			default:autoPlayIndex <= 0;
		endcase
	end
	else if(sound == 7)
	begin
		case(count)
			0   : autoPlayIndex <= 5'b01111;  //7
			1   : autoPlayIndex <= 5'b01111;  //7
			2   : autoPlayIndex <= 5'b01111;  //7
			3   : autoPlayIndex <= 5'b01111;  //7
			4   : autoPlayIndex <= 5'b01111;  //7
			5   : autoPlayIndex <= 5'b01111;  //7
			6   : autoPlayIndex <= 5'b01111;  //7
			7   : autoPlayIndex <= 5'b00000;  //0
			default:autoPlayIndex <= 0;
		endcase
	end
	else if(sound == 8)
	begin
		case(count)
			0   : autoPlayIndex <= 5'b11001;  //1.
			1   : autoPlayIndex <= 5'b11001;  //1.
			2   : autoPlayIndex <= 5'b11001;  //1.
			3   : autoPlayIndex <= 5'b11001;  //1.
			4   : autoPlayIndex <= 5'b11001;  //1.
			5   : autoPlayIndex <= 5'b11001;  //1.
			6   : autoPlayIndex <= 5'b11001;  //1.
			7   : autoPlayIndex <= 5'b00000;  //0
			default:autoPlayIndex <= 0;
		endcase
	end
	else if(sound == 9)
	begin
		case(count)
			0   : autoPlayIndex <= 5'b01001;  //1
			1   : autoPlayIndex <= 5'b01001;  //1
			2   : autoPlayIndex <= 5'b01001;  //1
			3   : autoPlayIndex <= 5'b00000;  //0
			4   : autoPlayIndex <= 5'b01001;  //1
			5   : autoPlayIndex <= 5'b01001;  //1
			6   : autoPlayIndex <= 5'b01001;  //1
			7   : autoPlayIndex <= 5'b00000;  //0
			default : autoPlayIndex <= 0;
		endcase
	end
	else if(sound == 10)
	begin
		case(count)
			0   : autoPlayIndex <= 5'b01001;  //1
			1   : autoPlayIndex <= 5'b01001;  //1
			2   : autoPlayIndex <= 5'b01001;  //1
			3   : autoPlayIndex <= 5'b00000;  //0
			4   : autoPlayIndex <= 5'b01011;  //3
			5   : autoPlayIndex <= 5'b01011;  //3
			6   : autoPlayIndex <= 5'b01011;  //3
			7   : autoPlayIndex <= 5'b00000;  //0
			8   : autoPlayIndex <= 5'b01101;  //5
			9   : autoPlayIndex <= 5'b01101;  //5
			10  : autoPlayIndex <= 5'b01101;  //5
			11  : autoPlayIndex <= 5'b00000;  //0
			12  : autoPlayIndex <= 5'b11001;  //1.
			13  : autoPlayIndex <= 5'b11001;  //1.
			14  : autoPlayIndex <= 5'b11001;  //1.
			15  : autoPlayIndex <= 5'b00000;  //0
			default:autoPlayIndex <= 0;
		endcase
	end
	else if(sound == 11)
	begin
		case(count)
			0   : autoPlayIndex <= 5'b01101;  //5
			1   : autoPlayIndex <= 5'b01101;  //5
			2   : autoPlayIndex <= 5'b01101;  //5
			3   : autoPlayIndex <= 5'b00000;  //0
			4   : autoPlayIndex <= 5'b01001;  //1
			5   : autoPlayIndex <= 5'b01001;  //1
			6   : autoPlayIndex <= 5'b01001;  //1
			7   : autoPlayIndex <= 5'b00000;  //0
			8   : autoPlayIndex <= 5'b01011;  //3
			9   : autoPlayIndex <= 5'b01011;  //3
			10  : autoPlayIndex <= 5'b01011;  //3
			11  : autoPlayIndex <= 5'b00000;  //0
			12  : autoPlayIndex <= 5'b01101;  //5
			13  : autoPlayIndex <= 5'b01101;  //5
			14  : autoPlayIndex <= 5'b01101;  //5
			15  : autoPlayIndex <= 5'b01110;  //0
			16  : autoPlayIndex <= 5'b01001;  //1
			17  : autoPlayIndex <= 5'b01001;  //1
			18  : autoPlayIndex <= 5'b01001;  //1
			19  : autoPlayIndex <= 5'b00000;  //0
			20  : autoPlayIndex <= 5'b01011;  //3
			21  : autoPlayIndex <= 5'b01011;  //3
			22  : autoPlayIndex <= 5'b01011;  //3
			23  : autoPlayIndex <= 5'b00000;  //0
			24  : autoPlayIndex <= 5'b01101;  //5
			25  : autoPlayIndex <= 5'b01101;  //5
			26  : autoPlayIndex <= 5'b01101;  //5
			27  : autoPlayIndex <= 5'b01101;  //5
			28  : autoPlayIndex <= 5'b01101;  //5
			29  : autoPlayIndex <= 5'b01101;  //5
			30  : autoPlayIndex <= 5'b01101;  //5
			31  : autoPlayIndex <= 5'b01101;  //5
			32  : autoPlayIndex <= 5'b01101;  //5
			33  : autoPlayIndex <= 5'b01101;  //5
			34  : autoPlayIndex <= 5'b01101;  //5
			35  : autoPlayIndex <= 5'b00000;  //0
			36  : autoPlayIndex <= 5'b01011;  //3
			37  : autoPlayIndex <= 5'b01011;  //3
			38  : autoPlayIndex <= 5'b01011;  //3
			39  : autoPlayIndex <= 5'b01011;  //3
			40  : autoPlayIndex <= 5'b01011;  //3
			41  : autoPlayIndex <= 5'b01011;  //3
			42  : autoPlayIndex <= 5'b01011;  //3
			43  : autoPlayIndex <= 5'b01011;  //3
			44  : autoPlayIndex <= 5'b01011;  //3
			45  : autoPlayIndex <= 5'b01011;  //3
			46  : autoPlayIndex <= 5'b01011;  //3
			47  : autoPlayIndex <= 5'b00000;  //0
			48  : autoPlayIndex <= 5'b00010;  //6b
			49  : autoPlayIndex <= 5'b00010;  //6b
			50  : autoPlayIndex <= 5'b00010;  //6b
			51  : autoPlayIndex <= 5'b00000;  //0
			52  : autoPlayIndex <= 5'b01001;  //1
			53  : autoPlayIndex <= 5'b01001;  //1
			54  : autoPlayIndex <= 5'b01001;  //1
			55  : autoPlayIndex <= 5'b00000;  //0
			56  : autoPlayIndex <= 5'b00001;  //3b
			57  : autoPlayIndex <= 5'b00001;  //3b
			58  : autoPlayIndex <= 5'b00001;  //3b
			59  : autoPlayIndex <= 5'b00000;  //0
			60  : autoPlayIndex <= 5'b00010;  //6b
			61  : autoPlayIndex <= 5'b00010;  //6b
			62  : autoPlayIndex <= 5'b00010;  //6b
			63  : autoPlayIndex <= 5'b00000;  //0
			64  : autoPlayIndex <= 5'b11001;  //1
			65  : autoPlayIndex <= 5'b01001;  //1
			66  : autoPlayIndex <= 5'b01001;  //1
			67  : autoPlayIndex <= 5'b00000;  //0
			68  : autoPlayIndex <= 5'b00001;  //3b
			69  : autoPlayIndex <= 5'b00001;  //3b
			70  : autoPlayIndex <= 5'b00001;  //3b
			71  : autoPlayIndex <= 5'b00000;  //0
			72  : autoPlayIndex <= 5'b00010;  //6b
			73  : autoPlayIndex <= 5'b00010;  //6b
			74  : autoPlayIndex <= 5'b00010;  //6b
			75  : autoPlayIndex <= 5'b00010;  //6b
			76  : autoPlayIndex <= 5'b00010;  //6b
			77  : autoPlayIndex <= 5'b00010;  //6b
			78  : autoPlayIndex <= 5'b00010;  //6b
			79  : autoPlayIndex <= 5'b00010;  //6b
			80  : autoPlayIndex <= 5'b00010;  //6b
			81  : autoPlayIndex <= 5'b00010;  //6b
			82  : autoPlayIndex <= 5'b00010;  //6b
			83  : autoPlayIndex <= 5'b00000;  //0
			84  : autoPlayIndex <= 5'b00001;  //3b
			85  : autoPlayIndex <= 5'b00001;  //3b
			86  : autoPlayIndex <= 5'b00001;  //3b
			87  : autoPlayIndex <= 5'b00001;  //3b
			88  : autoPlayIndex <= 5'b00001;  //3b
			89  : autoPlayIndex <= 5'b00001;  //3b
			90  : autoPlayIndex <= 5'b00001;  //3b
			91  : autoPlayIndex <= 5'b00001;  //3b
			92  : autoPlayIndex <= 5'b00001;  //3b
			93  : autoPlayIndex <= 5'b00001;  //3b
			94  : autoPlayIndex <= 5'b00001;  //3b
			95  : autoPlayIndex <= 5'b00000;  //0
			96  : autoPlayIndex <= 5'b00011;  //b7
			97  : autoPlayIndex <= 5'b00011;  //b7
			98  : autoPlayIndex <= 5'b00011;  //b7
			99  : autoPlayIndex <= 5'b00000;  //0
			100 : autoPlayIndex <= 5'b01010;  //2
			101 : autoPlayIndex <= 5'b01010;  //2
			102 : autoPlayIndex <= 5'b01010;  //2
			103 : autoPlayIndex <= 5'b00000;  //0
			104 : autoPlayIndex <= 5'b01100;  //4
			105 : autoPlayIndex <= 5'b01100;  //4
			106 : autoPlayIndex <= 5'b01100;  //4
			107 : autoPlayIndex <= 5'b00000;  //0
			108 : autoPlayIndex <= 5'b00011;  //b7
			109 : autoPlayIndex <= 5'b00011;  //b7
			110 : autoPlayIndex <= 5'b00011;  //b7
			111 : autoPlayIndex <= 5'b00000;  //0
			112 : autoPlayIndex <= 5'b01010;  //2
			113 : autoPlayIndex <= 5'b01010;  //2
			114 : autoPlayIndex <= 5'b01010;  //2
			115 : autoPlayIndex <= 5'b00000;  //0
			116 : autoPlayIndex <= 5'b01100;  //4
			117 : autoPlayIndex <= 5'b01100;  //4
			118 : autoPlayIndex <= 5'b01100;  //4
			119 : autoPlayIndex <= 5'b00000;  //0
			120 : autoPlayIndex <= 5'b00011;  //b7
			121 : autoPlayIndex <= 5'b00011;  //b7
			122 : autoPlayIndex <= 5'b00011;  //b7
			123 : autoPlayIndex <= 5'b00011;  //b7
			124 : autoPlayIndex <= 5'b00011;  //b7
			125 : autoPlayIndex <= 5'b00011;  //b7
			126 : autoPlayIndex <= 5'b00011;  //b7
			127 : autoPlayIndex <= 5'b00011;  //b7
			128 : autoPlayIndex <= 5'b00011;  //b7
			129 : autoPlayIndex <= 5'b00011;  //b7
			130 : autoPlayIndex <= 5'b00011;  //b7
			131 : autoPlayIndex <= 5'b00000;  //0
			132 : autoPlayIndex <= 5'b00011;  //b7
			133 : autoPlayIndex <= 5'b00011;  //b7
			134 : autoPlayIndex <= 5'b00011;  //b7
			135 : autoPlayIndex <= 5'b00000;  //0
			136 : autoPlayIndex <= 5'b00011;  //b7
			137 : autoPlayIndex <= 5'b00011;  //b7
			138 : autoPlayIndex <= 5'b00011;  //b7
			139 : autoPlayIndex <= 5'b00000;  //0
			140 : autoPlayIndex <= 5'b00011;  //b7
			141 : autoPlayIndex <= 5'b00011;  //b7
			142 : autoPlayIndex <= 5'b00011;  //b7
			143 : autoPlayIndex <= 5'b00000;  //0
			144 : autoPlayIndex <= 5'b11001;  //1.
			145 : autoPlayIndex <= 5'b11001;  //1.
			146 : autoPlayIndex <= 5'b11001;  //1.
			147 : autoPlayIndex <= 5'b11001;  //1.
			148 : autoPlayIndex <= 5'b11001;  //1.
			149 : autoPlayIndex <= 5'b11001;  //1.
			150 : autoPlayIndex <= 5'b11001;  //1.
			151 : autoPlayIndex <= 5'b11001;  //1.
			152 : autoPlayIndex <= 5'b11001;  //1.
			153 : autoPlayIndex <= 5'b11001;  //1.
			154 : autoPlayIndex <= 5'b11001;  //1.
			155 : autoPlayIndex <= 5'b00000;  //0
			default:autoPlayIndex <= 0;
		endcase
	end
	else if(sound == 12)
	begin
		case(count)
			0   : autoPlayIndex <= 5'b01011;  //3
			1   : autoPlayIndex <= 5'b01011;  //3
			2   : autoPlayIndex <= 5'b01011;  //3
			3   : autoPlayIndex <= 5'b00000;  //0
			4   : autoPlayIndex <= 5'b00011;  //6.5 b7
			5   : autoPlayIndex <= 5'b00011;  //6.5 b7
			6   : autoPlayIndex <= 5'b00011;  //6.5 b7
			7   : autoPlayIndex <= 5'b00011;  //6.5 b7
			8   : autoPlayIndex <= 5'b00011;  //6.5 b7
			9   : autoPlayIndex <= 5'b00011;  //6.5 b7
			10  : autoPlayIndex <= 5'b00011;  //6.5 b7
			11  : autoPlayIndex <= 5'b00011;  //6.5 b7
			12  : autoPlayIndex <= 5'b00011;  //6.5 b7
			13  : autoPlayIndex <= 5'b00011;  //6.5 b7
			14  : autoPlayIndex <= 5'b00011;  //6.5 b7
			15  : autoPlayIndex <= 5'b01110;  //0
			16  : autoPlayIndex <= 5'b00011;  //6.5 b7
			17  : autoPlayIndex <= 5'b00011;  //6.5 b7
			18  : autoPlayIndex <= 5'b00011;  //6.5 b7
			19  : autoPlayIndex <= 5'b00000;  //0
			20  : autoPlayIndex <= 5'b00011;  //6.5 b7
			21  : autoPlayIndex <= 5'b00011;  //6.5 b7
			22  : autoPlayIndex <= 5'b00011;  //6.5 b7
			23  : autoPlayIndex <= 5'b00000;  //0
			24  : autoPlayIndex <= 5'b01110;  //6
			25  : autoPlayIndex <= 5'b01110;  //6
			26  : autoPlayIndex <= 5'b01110;  //6
			27  : autoPlayIndex <= 5'b00000;  //0
			28  : autoPlayIndex <= 5'b01101;  //5
			29  : autoPlayIndex <= 5'b01101;  //5
			30  : autoPlayIndex <= 5'b01101;  //5
			31  : autoPlayIndex <= 5'b00000;  //0
			32  : autoPlayIndex <= 5'b01100;  //4
			33  : autoPlayIndex <= 5'b01100;  //4
			34  : autoPlayIndex <= 5'b01100;  //4
			35  : autoPlayIndex <= 5'b01100;  //4
			36  : autoPlayIndex <= 5'b01100;  //4
			37  : autoPlayIndex <= 5'b01100;  //4
			38  : autoPlayIndex <= 5'b01100;  //4
			39  : autoPlayIndex <= 5'b01100;  //4
			40  : autoPlayIndex <= 5'b01100;  //4
			41  : autoPlayIndex <= 5'b01100;  //4
			42  : autoPlayIndex <= 5'b01100;  //4
			43  : autoPlayIndex <= 5'b01100;  //4
		endcase
	end
	else if(sound == 0)
	begin
		if(level == 1)
		begin
			case(count)
				0   : autoPlayIndex <= 5'b01001;  //1
				1   : autoPlayIndex <= 5'b01001;  //1
				2   : autoPlayIndex <= 5'b01001;  //1
				3   : autoPlayIndex <= 5'b01001;  //1
				4   : autoPlayIndex <= 5'b01001;  //1
				5   : autoPlayIndex <= 5'b01001;  //1
				6   : autoPlayIndex <= 5'b01001;  //1
				7   : autoPlayIndex <= 5'b00000;  //0
				8   : autoPlayIndex <= 5'b01001;  //1
				9   : autoPlayIndex <= 5'b01001;  //1
				10  : autoPlayIndex <= 5'b01001;  //1
				11  : autoPlayIndex <= 5'b01001;  //1
				12  : autoPlayIndex <= 5'b01001;  //1
				13  : autoPlayIndex <= 5'b01001;  //1
				14  : autoPlayIndex <= 5'b01001;  //1
				15  : autoPlayIndex <= 5'b00000;  //0
				16  : autoPlayIndex <= 5'b01101;  //5
				17  : autoPlayIndex <= 5'b01101;  //5
				18  : autoPlayIndex <= 5'b01101;  //5
				19  : autoPlayIndex <= 5'b01101;  //5
				20  : autoPlayIndex <= 5'b01101;  //5
				21  : autoPlayIndex <= 5'b01101;  //5
				22  : autoPlayIndex <= 5'b01101;  //5
				23  : autoPlayIndex <= 5'b00000;  //0
				24  : autoPlayIndex <= 5'b01101;  //5
				25  : autoPlayIndex <= 5'b01101;  //5
				26  : autoPlayIndex <= 5'b01101;  //5
				27  : autoPlayIndex <= 5'b01101;  //5
				28  : autoPlayIndex <= 5'b01101;  //5
				29  : autoPlayIndex <= 5'b01101;  //5
				30  : autoPlayIndex <= 5'b01101;  //5
				31  : autoPlayIndex <= 5'b00000;  //0
				default : autoPlayIndex <= 0;
			endcase
		end
		else if(level == 2)
		begin
			case(count)
				0   : autoPlayIndex <= 5'b01011;  //3
				1   : autoPlayIndex <= 5'b01011;  //3
				2   : autoPlayIndex <= 5'b01011;  //3
				3   : autoPlayIndex <= 5'b01011;  //3
				4   : autoPlayIndex <= 5'b01011;  //3
				5   : autoPlayIndex <= 5'b01011;  //3
				6   : autoPlayIndex <= 5'b01011;  //3
				7   : autoPlayIndex <= 5'b00000;  //0
				8   : autoPlayIndex <= 5'b01010;  //2
				9   : autoPlayIndex <= 5'b01010;  //2
				10  : autoPlayIndex <= 5'b01010;  //2
				11  : autoPlayIndex <= 5'b01010;  //2
				12  : autoPlayIndex <= 5'b01010;  //2
				13  : autoPlayIndex <= 5'b01010;  //2
				14  : autoPlayIndex <= 5'b01010;  //2
				15  : autoPlayIndex <= 5'b00000;  //0
				16  : autoPlayIndex <= 5'b01011;  //3
				17  : autoPlayIndex <= 5'b01011;  //3
				18  : autoPlayIndex <= 5'b01011;  //3
				19  : autoPlayIndex <= 5'b01011;  //3
				20  : autoPlayIndex <= 5'b01011;  //3
				21  : autoPlayIndex <= 5'b01011;  //3
				22  : autoPlayIndex <= 5'b01011;  //3
				23  : autoPlayIndex <= 5'b00000;  //0
				24  : autoPlayIndex <= 5'b01010;  //2
				25  : autoPlayIndex <= 5'b01010;  //2
				26  : autoPlayIndex <= 5'b01010;  //2
				27  : autoPlayIndex <= 5'b01010;  //2
				28  : autoPlayIndex <= 5'b01010;  //2
				29  : autoPlayIndex <= 5'b01010;  //2
				30  : autoPlayIndex <= 5'b01010;  //2
				31  : autoPlayIndex <= 5'b00000;  //0
				default : autoPlayIndex <= 0;
			endcase
		end
		else if(level == 3)
		begin
			case(count)
				0   : autoPlayIndex <= 5'b01011;  //3
				1   : autoPlayIndex <= 5'b01011;  //3
				2   : autoPlayIndex <= 5'b01011;  //3
				3   : autoPlayIndex <= 5'b01011;  //3
				4   : autoPlayIndex <= 5'b01011;  //3
				5   : autoPlayIndex <= 5'b01011;  //3
				6   : autoPlayIndex <= 5'b01011;  //3
				7   : autoPlayIndex <= 5'b00000;  //0
				8   : autoPlayIndex <= 5'b01101;  //5
				9   : autoPlayIndex <= 5'b01101;  //5
				10  : autoPlayIndex <= 5'b01101;  //5
				11  : autoPlayIndex <= 5'b01101;  //5
				12  : autoPlayIndex <= 5'b01101;  //5
				13  : autoPlayIndex <= 5'b01101;  //5
				14  : autoPlayIndex <= 5'b01101;  //5
				15  : autoPlayIndex <= 5'b00000;  //0
				16  : autoPlayIndex <= 5'b01110;  //6
				17  : autoPlayIndex <= 5'b01110;  //6
				18  : autoPlayIndex <= 5'b01110;  //6
				19  : autoPlayIndex <= 5'b01110;  //6
				20  : autoPlayIndex <= 5'b01110;  //6
				21  : autoPlayIndex <= 5'b01110;  //6
				22  : autoPlayIndex <= 5'b01110;  //6
				23  : autoPlayIndex <= 5'b00000;  //0
				24  : autoPlayIndex <= 5'b01101;  //5
				25  : autoPlayIndex <= 5'b01101;  //5
				26  : autoPlayIndex <= 5'b01101;  //5
				27  : autoPlayIndex <= 5'b01101;  //5
				28  : autoPlayIndex <= 5'b01101;  //5
				29  : autoPlayIndex <= 5'b01101;  //5
				30  : autoPlayIndex <= 5'b01101;  //5
				31  : autoPlayIndex <= 5'b00000;  //0
				default : autoPlayIndex <= 0;
			endcase
		end
		else if(level == 4)
		begin
			case(count)
				0   : autoPlayIndex <= 5'b11001;  //1.
				1   : autoPlayIndex <= 5'b11001;  //1.
				2   : autoPlayIndex <= 5'b11001;  //1.
				3   : autoPlayIndex <= 5'b11001;  //1.
				4   : autoPlayIndex <= 5'b11001;  //1.
				5   : autoPlayIndex <= 5'b11001;  //1.
				6   : autoPlayIndex <= 5'b11001;  //1.
				7   : autoPlayIndex <= 5'b00000;  //0
				8   : autoPlayIndex <= 5'b01100;  //4
				9   : autoPlayIndex <= 5'b01100;  //4
				10  : autoPlayIndex <= 5'b01100;  //4
				11  : autoPlayIndex <= 5'b01100;  //4
				12  : autoPlayIndex <= 5'b01100;  //4
				13  : autoPlayIndex <= 5'b01100;  //4
				14  : autoPlayIndex <= 5'b01100;  //4
				15  : autoPlayIndex <= 5'b00000;  //0
				16  : autoPlayIndex <= 5'b01111;  //7
				17  : autoPlayIndex <= 5'b01111;  //7
				18  : autoPlayIndex <= 5'b01111;  //7
				19  : autoPlayIndex <= 5'b01111;  //7
				20  : autoPlayIndex <= 5'b01111;  //7
				21  : autoPlayIndex <= 5'b01111;  //7
				22  : autoPlayIndex <= 5'b01111;  //7
				23  : autoPlayIndex <= 5'b00000;  //0
				24  : autoPlayIndex <= 5'b01011;  //3
				25  : autoPlayIndex <= 5'b01011;  //3
				26  : autoPlayIndex <= 5'b01011;  //3
				27  : autoPlayIndex <= 5'b01011;  //3
				28  : autoPlayIndex <= 5'b01011;  //3
				29  : autoPlayIndex <= 5'b01011;  //3
				30  : autoPlayIndex <= 5'b01011;  //3
				31  : autoPlayIndex <= 5'b00000;  //0
				default : autoPlayIndex <= 0;
			endcase
		end
		else if(level == 5)
		begin
			case(count)
				0   : autoPlayIndex <= 5'b01010;  //2
				1   : autoPlayIndex <= 5'b01010;  //2
				2   : autoPlayIndex <= 5'b01010;  //2
				3   : autoPlayIndex <= 5'b01010;  //2
				4   : autoPlayIndex <= 5'b01010;  //2
				5   : autoPlayIndex <= 5'b01010;  //2
				6   : autoPlayIndex <= 5'b01010;  //2
				7   : autoPlayIndex <= 5'b00000;  //0
				8   : autoPlayIndex <= 5'b01101;  //5
				9   : autoPlayIndex <= 5'b01101;  //5
				10  : autoPlayIndex <= 5'b01101;  //5
				11  : autoPlayIndex <= 5'b01101;  //5
				12  : autoPlayIndex <= 5'b01101;  //5
				13  : autoPlayIndex <= 5'b01101;  //5
				14  : autoPlayIndex <= 5'b01101;  //5
				15  : autoPlayIndex <= 5'b01110;  //0
				16  : autoPlayIndex <= 5'b01011;  //3
				17  : autoPlayIndex <= 5'b01011;  //3
				18  : autoPlayIndex <= 5'b01011;  //3
				19  : autoPlayIndex <= 5'b01011;  //3
				20  : autoPlayIndex <= 5'b01011;  //3
				21  : autoPlayIndex <= 5'b01011;  //3
				22  : autoPlayIndex <= 5'b01011;  //3
				23  : autoPlayIndex <= 5'b00000;  //0
				24  : autoPlayIndex <= 5'b01001;  //1
				25  : autoPlayIndex <= 5'b01001;  //1
				26  : autoPlayIndex <= 5'b01001;  //1
				27  : autoPlayIndex <= 5'b01001;  //1
				28  : autoPlayIndex <= 5'b01001;  //1
				29  : autoPlayIndex <= 5'b01001;  //1
				30  : autoPlayIndex <= 5'b01001;  //1
				31  : autoPlayIndex <= 5'b00000;  //0
				default : autoPlayIndex <= 0;
			endcase
		end
	end	
end

endmodule
		