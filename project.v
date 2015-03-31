module project (GPIO_0,SW,CLOCK_50,LEDR,LEDG, PS2_DAT, PS2_CLK);
	output [25:0]GPIO_0;
	output [0:17]LEDR;
	output [0:6]LEDG;
   input	PS2_DAT;
   input	PS2_CLK;
	input[16:0] SW;
	input CLOCK_50;

	wire hertz_10;
	wire hertz_1;

	reg [0:7] LINE_1,LINE_2,LINE_3,LINE_4,LINE_5,LINE_6,LINE_7,LINE_0;
	wire reset = 1'b0;
	wire [7:0] scan_code;
	reg [7:0] pressed;
	wire read, scan_ready;
	
always @(posedge scan_ready)
begin
pressed <= scan_code;
end

 oneshot pulser(
   .pulse_out(read),
   .trigger_in(scan_ready),
   .clk(CLOCK_50)
);

keyboard kbd(
  .keyboard_clk(PS2_CLK),
  .keyboard_data(PS2_DAT),
  .clock50(CLOCK_50),
  .reset(reset),
  .read(read),
  .scan_ready(scan_ready),
  .scan_code(scan_code)
);

 assign LEDR[0:7] = LINE_0[0:7];
 reg [0:255]ROWDATA_1;
 reg [0:255]ROWDATA_2;
 reg [0:255]ROWDATA_3;
 reg [0:255]ROWDATA_4;
 reg [0:255]ROWDATA_5;
 reg [0:255]ROWDATA_6;
 reg [0:255]ROWDATA_7;
 reg [0:255]ROWDATA_8;
 integer  counter1;
 integer   counter2;
integer  counter3;
integer counter4;
integer  counter5;
 integer  counter6;
integer  counter7;
 integer counter8;
integer seconds;
integer  minutes;
integer  hours;
 reg isBirthday;
  wire [0:15]sROW1, sROW2, sROW3, sROW4, sROW5, sROW6, sROW7, sROW8;
   wire [0:15]mROW1, mROW2, mROW3, mROW4, mROW5, mROW6, mROW7, mROW8;
 wire [0:15]hROW1, hROW2, hROW3, hROW4, hROW5, hROW6, hROW7, hROW8;
 twoDigitNumberTo8BitDisplay hoursDisplay(hours,hROW1, hROW2, hROW3, hROW4, hROW5, hROW6, hROW7, hROW8);
twoDigitNumberTo8BitDisplay minutesDisplay(minutes,mROW1, mROW2, mROW3, mROW4, mROW5, mROW6, mROW7, mROW8);
twoDigitNumberTo8BitDisplay secondsDisplay(seconds,sROW1, sROW2, sROW3, sROW4, sROW5, sROW6, sROW7, sROW8);
 initial begin
	 isBirthday = 0;
	 counter1 = 0;
	 counter2 = 1;
	 counter3 = 2;
	 counter4 = 3;
	 counter5 = 4;
	 counter6 = 5;
	 counter7 = 6;
	 counter8 = 7;
	 seconds = 59;
	 minutes = 0;
	 hours = 0;
	 ROWDATA_1 [0:255]= 256'b1000100000000000000000000000000000000000111100000100000000000000010000001000000000001000000000000000000000000000111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011100000000000000000000000000000000000000000000;
	 ROWDATA_2 [0:255]= 256'b1000100000000000000000000000000000000000100010000000000000000000010000001000000000001000000000000000000000000000010000000000000000000000000000000000000011000000000000000000000011000000000000000000000000000000100010000000000000000000000000000000000000000000;
	 ROWDATA_3 [0:255]= 256'b1000100001110000100010001011000000000000100010001100000010110000111000001011000001101000011100001000100000000000010000000111000000000000000000000000000011000000000000000000000011000000000000000000000000000000100010001000100001110000100010000000000000000000;
	 ROWDATA_4 [0:255]= 256'b0101000010001000100010001100100000000000111100000100000011001000010000001100100010011000000010001000100000000000010000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100010001010100000001000100010000000000000000000;
	 ROWDATA_5 [0:255]= 256'b0010000010001000100010001000000000000000100010000100000010000000010000001000100010001000011110000111100000000000010000000111000000000000000000000000000011000000000000000000000011000000000000000000000000000000111110001010100001111000011110000000000000000000;
	 ROWDATA_6 [0:255]= 256'b0010000010001000100110001000000000000000100010000100000010000000010010001000100010001000100010000000100000000000010000000000100000000000000000000000000011000000000000000000000011000000000000000000000000000000100010001010100010001000000010000000000000000000;
	 ROWDATA_7 [0:255]= 256'b0010000001110000011010001000000000000000111100001110000010000000001100001000100001111000011110000111000000000000111000001111000000000000000000000000000000000000000000000000000000000000000000000000000000000000100010000101000001111000011100000000000000000000;
	 ROWDATA_8 [0:255]= 256'b0;
 end
 
 
 
 toLED tL1 (GPIO_0, SW,CLOCK_50, LEDG, LINE_0, LINE_1, LINE_2, LINE_3, LINE_4, LINE_5, LINE_6, LINE_7);
 clk_1_tenth_sec (CLOCK_50,hertz_10);
 clk_1_sec (CLOCK_50,hertz_1);
 
 reg [3:0]i;

 always @(posedge hertz_10) begin

    // Shift reader 8 bits to the right
	 counter1 = counter1 + 1;
	 counter2 = counter2 + 1;
	 counter3 = counter3 + 1;
	 counter4 = counter4 + 1;
	 counter5 = counter5 + 1;
	 counter6 = counter6 + 1;
	 counter7 = counter7 + 1;
	 counter8 = counter8 + 1;
	 
	 if (counter1 == 256) begin
		counter1 = 0;
	 end
	 if (counter2 == 256) begin
		counter2 = 0;
	 end
	 if (counter3 == 256) begin
		counter3 = 0;
	 end
	 if (counter4 == 256) begin
		counter4 = 0;
	 end
	 if (counter5 == 256) begin
		counter5 = 0;
	 end
	 if (counter6 == 256) begin
		counter6 = 0;
	 end
	 if (counter7 == 256) begin
		counter7 = 0;
	 end
	 if (counter8 == 256) begin
		counter8 = 0;
	 end
	 
	 // Assign the 8 bits to be displayed out of the 256 bit string
	 LINE_0 [0:7] = ({ROWDATA_1[counter1],ROWDATA_1[counter2],ROWDATA_1[counter3],ROWDATA_1[counter4],ROWDATA_1[counter5],ROWDATA_1[counter6],ROWDATA_1[counter7],ROWDATA_1[counter8]});
	 LINE_1 [0:7] = ({ROWDATA_2[counter1],ROWDATA_2[counter2],ROWDATA_2[counter3],ROWDATA_2[counter4],ROWDATA_2[counter5],ROWDATA_2[counter6],ROWDATA_2[counter7],ROWDATA_2[counter8]});
	 LINE_2 [0:7] = ({ROWDATA_3[counter1],ROWDATA_3[counter2],ROWDATA_3[counter3],ROWDATA_3[counter4],ROWDATA_3[counter5],ROWDATA_3[counter6],ROWDATA_3[counter7],ROWDATA_3[counter8]});
	 LINE_3 [0:7] = ({ROWDATA_4[counter1],ROWDATA_4[counter2],ROWDATA_4[counter3],ROWDATA_4[counter4],ROWDATA_4[counter5],ROWDATA_4[counter6],ROWDATA_4[counter7],ROWDATA_4[counter8]});
	 LINE_4 [0:7] = ({ROWDATA_5[counter1],ROWDATA_5[counter2],ROWDATA_5[counter3],ROWDATA_5[counter4],ROWDATA_5[counter5],ROWDATA_5[counter6],ROWDATA_5[counter7],ROWDATA_5[counter8]});
	 LINE_5 [0:7] = ({ROWDATA_6[counter1],ROWDATA_6[counter2],ROWDATA_6[counter3],ROWDATA_6[counter4],ROWDATA_6[counter5],ROWDATA_6[counter6],ROWDATA_6[counter7],ROWDATA_6[counter8]});
	 LINE_6 [0:7] = ({ROWDATA_7[counter1],ROWDATA_7[counter2],ROWDATA_7[counter3],ROWDATA_7[counter4],ROWDATA_7[counter5],ROWDATA_7[counter6],ROWDATA_7[counter7],ROWDATA_7[counter8]});
	 LINE_7 [0:7] = ({ROWDATA_8[counter1],ROWDATA_8[counter2],ROWDATA_8[counter3],ROWDATA_8[counter4],ROWDATA_8[counter5],ROWDATA_8[counter6],ROWDATA_8[counter7],ROWDATA_8[counter8]});
	 
	 // If it's not your birthday yet then output
	 // Your Birthday Is 00:00:00 Away
	 if (isBirthday == 0) 
	 begin
	 
	 // Set boiler plate bits 
	 ROWDATA_1 [0:255]= 256'b1000100000000000000000000000000000000000111100000100000000000000010000001000000000001000000000000000000000000000111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011100000000000000000000000000000000000000000000;
	 ROWDATA_2 [0:255]= 256'b1000100000000000000000000000000000000000100010000000000000000000010000001000000000001000000000000000000000000000010000000000000000000000000000000000000011000000000000000000000011000000000000000000000000000000100010000000000000000000000000000000000000000000;
	 ROWDATA_3 [0:255]= 256'b1000100001110000100010001011000000000000100010001100000010110000111000001011000001101000011100001000100000000000010000000111000000000000000000000000000011000000000000000000000011000000000000000000000000000000100010001000100001110000100010000000000000000000;
	 ROWDATA_4 [0:255]= 256'b0101000010001000100010001100100000000000111100000100000011001000010000001100100010011000000010001000100000000000010000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100010001010100000001000100010000000000000000000;
	 ROWDATA_5 [0:255]= 256'b0010000010001000100010001000000000000000100010000100000010000000010000001000100010001000011110000111100000000000010000000111000000000000000000000000000011000000000000000000000011000000000000000000000000000000111110001010100001111000011110000000000000000000;
	 ROWDATA_6 [0:255]= 256'b0010000010001000100110001000000000000000100010000100000010000000010010001000100010001000100010000000100000000000010000000000100000000000000000000000000011000000000000000000000011000000000000000000000000000000100010001010100010001000000010000000000000000000;
	 ROWDATA_7 [0:255]= 256'b0010000001110000011010001000000000000000111100001110000010000000001100001000100001111000011110000111000000000000111000001111000000000000000000000000000000000000000000000000000000000000000000000000000000000000100010000101000001111000011100000000000000000000;
	 ROWDATA_8 [0:255]= 256'b0; 
	 
	 // Hours
	 ROWDATA_1[136:151] = hROW1[0:15];
	 ROWDATA_2[136:151] = hROW2[0:15];
	 ROWDATA_3[136:151] = hROW3[0:15];
	 ROWDATA_4[136:151] = hROW4[0:15];
	 ROWDATA_5[136:151] = hROW5[0:15];
	 ROWDATA_6[136:151] = hROW6[0:15];
	 ROWDATA_7[136:151] = hROW7[0:15];
	 ROWDATA_8[136:151] = hROW8[0:15];
	 
	 // Minutes
	 ROWDATA_1[160:175] = mROW1[0:15];
	 ROWDATA_2[160:175] = mROW2[0:15];
	 ROWDATA_3[160:175] = mROW3[0:15];
	 ROWDATA_4[160:175] = mROW4[0:15];
	 ROWDATA_5[160:175] = mROW5[0:15];
	 ROWDATA_6[160:175] = mROW6[0:15];
	 ROWDATA_7[160:175] = mROW7[0:15];
	 ROWDATA_8[160:175] = mROW8[0:15];
	 
	 // Seconds
	 ROWDATA_1[184:199] = sROW1[0:15];
	 ROWDATA_2[184:199] = sROW2[0:15];
	 ROWDATA_3[184:199] = sROW3[0:15];
	 ROWDATA_4[184:199] = sROW4[0:15];
	 ROWDATA_5[184:199] = sROW5[0:15];
	 ROWDATA_6[184:199] = sROW6[0:15];
	 ROWDATA_7[184:199] = sROW7[0:15];
	 ROWDATA_8[184:199] = sROW8[0:15];
	 end
	 else 
	 begin
	  // Assign fixed text to lines
	  // HAPPY BIRTHDAY! 
	 ROWDATA_1 [0:255]= 256'b1000100000000000000000000000000000000000000000001111000001000000000000000100000010000000000010000000000000000000100000000000000000111100000000000011110000000000001111000000000000111100000000000011110000000000001111000000000000111100000000000011110000000000;
	 ROWDATA_2 [0:255]= 256'b1000100000000000000000000000000000000000000000001000100000000000000000000100000010000000000010000000000000000000100000000000000001000010000000000100001000000000010000100000000001000010000000000100001000000000010000100000000001000010000000000100001000000000;
	 ROWDATA_3 [0:255]= 256'b1000100001110000111100001111000010001000000000001000100011000000101100001110000010110000011010000111000010001000100000000000000010101001000000001010100100000000101010010000000010101001000000001010100100000000101010010000000010101001000000001010100100000000;
	 ROWDATA_4 [0:255]= 256'b1111100000001000100010001000100010001000000000001111000001000000110010000100000011001000100110000000100010001000100000000000000010101001000000001010100100000000101010010000000010101001000000001010100100000000101010010000000010101001000000001010100100000000;
	 ROWDATA_5 [0:255]= 256'b1000100001111000111100001111000001111000000000001000100001000000100000000100000010001000100010000111100001111000000000000000000010000101000000001000010100000000100001010000000010000101000000001000010100000000100001010000000010000101000000001000010100000000;
	 ROWDATA_6 [0:255]= 256'b1000100010001000100000001000000000001000000000001000100001000000100000000100100010001000100010001000100000001000000000000000000010111001000000001011100100000000101110010000000010111001000000001011100100000000101110010000000010111001000000001011100100000000;
	 ROWDATA_7 [0:255]= 256'b1000100001111000100000001000000001110000000000001111000011100000100000000011000010001000011110000111100001110000100000000000000001000010000000000100001000000000010000100000000001000010000000000100001000000000010000100000000001000010000000000100001000000000;
	 ROWDATA_8 [0:255]= 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000111100000000000011110000000000001111000000000000111100000000000011110000000000001111000000000000111100000000000011110000000000;
	 end
 end

 always @(posedge hertz_1) begin
	 if (seconds == 0) begin
		if (minutes == 0) begin
			if (hours == 0) begin
				isBirthday = 1;
			end
			else begin
				seconds = 59;
				minutes = 59;
		   	isBirthday = 0;
				hours = hours -1;
			end
		end
		else begin
		seconds = 59;
		isBirthday = 0;
		minutes = minutes - 1;
		end

	end
	else begin
	 isBirthday = 0;
	 seconds = seconds - 1;
	end
	if (pressed[7:0] == 8'h15)
		begin
		seconds = 0;
		if (hours <99)
		begin
		hours = hours + 1;
		end
		end
		if (pressed[7:0] == 8'h1C)
		begin
		seconds = 0;
		if (hours >0)
		begin
		hours = hours - 1;
		end
		end
		if (pressed[7:0] == 8'h1D)
		begin
		seconds = 0;
		if (minutes <59)
		begin
		seconds = 0;
		minutes = minutes + 1;
		end
		end
		if (pressed[7:0] == 8'h1B)
		begin
		seconds = 0;
		if (minutes > 0)
		begin
		minutes = minutes - 1;
		end
		end
 end

 endmodule



 module toLED (GPIO_0, SW,CLOCK_50, LEDG ,LINE_0 , LINE_1, LINE_2, LINE_3, LINE_4, LINE_5, LINE_6, LINE_7);
 output [25:0]GPIO_0;
 input CLOCK_50;
 //output [17:0]LEDR;
 output [6:0]LEDG;
 input[16:0] SW;
 input [0:7] LINE_1,LINE_2,LINE_3,LINE_4,LINE_5,LINE_6,LINE_7,LINE_0;
 reg data_in, load_in;
 reg [0:15]enterDigit0;
 reg [0:15]enterDigit1;
 reg [0:15]enterDigit2;
 reg [0:15]enterDigit3;
 reg [0:15]enterDigit4;
 reg [0:15]enterDigit5;
 reg [0:15]enterDigit6;
 reg [0:15]enterDigit7;
 reg [0:15]enterDigit8;
 reg [0:15]enterDigit9;
 reg [0:15]enterDigit10;
 reg [15:0]testLED;
 reg [6:0] testGLED;
 reg [0:7] start0,start1,start2,start3,start4,start5,start6,start7;
 reg [31:0]counterX;
 reg [31:0]counterY;
  wire clockToUse;
 CLOCKER clocker1(CLOCK_50,clockToUse);
 initial
 begin
 counterX = 0;
 counterY = 7;
 load_in = 0;
 testGLED = 7'b0;
 start0 [0:7]= 8'b11110001;
 start1[0:7] = 8'b11110010;
 start2[0:7] = 8'b11110011;
 start3[0:7] = 8'b11110100;
 start4[0:7] = 8'b11110101;
 start5[0:7] = 8'b11110110;
 start6[0:7] = 8'b11110111;
 start7[0:7] = 8'b11111000;

 // Number of bits : 4 (4)(8)
 // Format of bits : xxxx (0000) (00000000)
 // Description of bits : anything (address) (data)
 enterDigit0[0:15] = ({start0[0:7],LINE_0[0:7]});
 enterDigit1[0:15] = ({start1[0:7],LINE_1[0:7]});
 enterDigit2[0:15] = ({start2[0:7],LINE_2[0:7]});
 enterDigit3[0:15] = ({start3[0:7],LINE_3[0:7]});
 enterDigit4[0:15] = ({start4[0:7],LINE_4[0:7]});
 enterDigit5[0:15] = ({start5[0:7],LINE_5[0:7]});
 enterDigit6[0:15] = ({start6[0:7],LINE_6[0:7]});
 enterDigit7[0:15] = ({start7[0:7],LINE_7[0:7]});
 enterDigit8[0:15] = 16'b1111110011111111; //op current set to shutdown - NORMAL OPERATION
 enterDigit9[0:15] = 16'b1111101111111111; //scan limit set to 7
 enterDigit10[0:15]= 16'b1111101011111111; //Intensity set to max
 end
 assign GPIO_0[10] = data_in; //DIN
 assign GPIO_0[14] = clockToUse; //CLOCK
 assign LEDG = testGLED;

 assign GPIO_0 [12] = load_in;
 //assign LEDR[16] = load_in;
 always @ (negedge clockToUse) begin
	
	 // re update data
 enterDigit0[0:15] = ({start0[0:7],LINE_0[0:7]});
 enterDigit1[0:15] = ({start1[0:7],LINE_1[0:7]});
 enterDigit2[0:15] = ({start2[0:7],LINE_2[0:7]});
 enterDigit3[0:15] = ({start3[0:7],LINE_3[0:7]});
 enterDigit4[0:15] = ({start4[0:7],LINE_4[0:7]});
 enterDigit5[0:15] = ({start5[0:7],LINE_5[0:7]});
 enterDigit6[0:15] = ({start6[0:7],LINE_6[0:7]});
 enterDigit7[0:15] = ({start7[0:7],LINE_7[0:7]});
	
	 // Load data for row
	 case (counterY)
	 0 :
	 begin
	 data_in <= enterDigit0[counterX];
	 testLED[counterX] <= enterDigit0[counterX];
	 end
	 1 :
	 begin
	 data_in <= enterDigit1[counterX];
	 testLED[counterX] <= enterDigit1[counterX];
	 end
	 2 :
	 begin
	 data_in <= enterDigit2[counterX];
	 testLED[counterX] <= enterDigit2[counterX];
	 end
	 3 :
	 begin
	 data_in <= enterDigit3[counterX];
	 testLED[counterX] <= enterDigit3[counterX];
	 end
	 4 :
	 begin
	 data_in <= enterDigit4[counterX];
	 testLED[counterX] <= enterDigit4[counterX];
	
	 end
	 5 :
	 begin
	 data_in <= enterDigit5[counterX];
	 testLED[counterX] <= enterDigit5[counterX];
	
	 end
	 6 :
	 begin
	 data_in <= enterDigit6[counterX];
	 testLED[counterX] <= enterDigit6[counterX];
	
	 end
	 7 :
	 begin
	 data_in <= enterDigit7[counterX];
	 testLED[counterX] <= enterDigit7[counterX];
	 end
	 8 :
	 begin
	 data_in <= enterDigit8[counterX];
	 testLED[counterX] <= enterDigit8[counterX];
	 end
	 9 :
	 begin
	 data_in <= enterDigit9[counterX];
	 testLED[counterX] <= enterDigit9[counterX];
	 end
	 10 :
	 begin
	 data_in <= enterDigit10[counterX];
	 testLED[counterX] <= enterDigit10[counterX];
	 end
	 endcase
	
	
	 testGLED[6:0] = 7'b0;
	 testGLED[counterY] <= 1;
	
	 // If on the 1st clock edge set load in low
	 if (counterX == 0)
	 begin
	 load_in = 1;
	 end
	 else
	 begin
	 load_in = 0;
	 end
	
	 if (counterX == 15)
	 begin
	 // On the 16th clock edge set load in low
	
	 testLED[15:0] = 16'b0000000000000000;
	
	 // Reset column
	 counterX =0;
	
	 // Increment row
	 counterY = counterY + 1;
	
	 // Reset row
	 if (counterY == 11)
	 begin
	
	 counterY = 0;
	 end
	 end
	 else
	 begin
	 counterX = counterX + 1;
	 end

 end


 endmodule

 module clk_1_sec(
 input clk_50mhz,
 output reg clk_1hz
 );

 reg [31:0] count;

 always @(posedge clk_50mhz)
 begin
 count <= count + 1;
 if(count == 25000000) begin
 count <= 0;
 clk_1hz <= ~clk_1hz;
 end
 end

 endmodule

 module clk_1_tenth_sec(
 input clk_50mhz,
 output reg clk_1hz
 );

 reg [31:0] count;

 always @(posedge clk_50mhz)
 begin
 count <= count + 1;
 if(count == 2500000) begin
 count <= 0;
 clk_1hz <= ~clk_1hz;
 end
 end
 endmodule
 module CLOCKER(
 input clk_50mhz,
 output reg clk_1hz
 );

 reg [31:0] count;

 always @(posedge clk_50mhz)
 begin
 count <= count + 1;
 if(count == 500) begin
 count <= 0;
 clk_1hz <= ~clk_1hz;
 end
 end

 endmodule


 module twoDigitNumberTo8BitDisplay(NUMBER, ROW1, ROW2, ROW3, ROW4, ROW5, ROW6, ROW7, ROW8);

     output reg [0:15]ROW1, ROW2, ROW3, ROW4, ROW5, ROW6, ROW7, ROW8;
     input [31:0] NUMBER;

     reg [0:7]firstDigitRow1, firstDigitRow2, firstDigitRow3, firstDigitRow4, firstDigitRow5, firstDigitRow6, firstDigitRow7, firstDigitRow8;
     reg [0:7]secondDigitRow1, secondDigitRow2, secondDigitRow3, secondDigitRow4, secondDigitRow5, secondDigitRow6, secondDigitRow7, secondDigitRow8;

     integer firstDigit;


     integer secondDigit;
	  	  always 
	  begin
          firstDigit = (NUMBER/10);
     secondDigit = (NUMBER%10);

     case(firstDigit)
         0 :
             begin
             firstDigitRow1 [0:7]=8'b01110000;
             firstDigitRow2 [0:7]=8'b10001000;
             firstDigitRow3 [0:7]=8'b10011000;
             firstDigitRow4 [0:7]=8'b10101000;
             firstDigitRow5 [0:7]=8'b11001000;
             firstDigitRow6 [0:7]=8'b10001000;
             firstDigitRow7 [0:7]=8'b01110000;
             firstDigitRow8 [0:7]=8'b00000000;
             end
         1 :
             begin
             firstDigitRow1 [0:7]=8'b01000000;
             firstDigitRow2 [0:7]=8'b11000000;
             firstDigitRow3 [0:7]=8'b01000000;
             firstDigitRow4 [0:7]=8'b01000000;
             firstDigitRow5 [0:7]=8'b01000000;
             firstDigitRow6 [0:7]=8'b01000000;
             firstDigitRow7 [0:7]=8'b11100000;
             firstDigitRow8 [0:7]=8'b00000000;
             end
         2 :
             begin
             firstDigitRow1 [0:7]=8'b01110000;
             firstDigitRow2 [0:7]=8'b10001000;
             firstDigitRow3 [0:7]=8'b00001000;
             firstDigitRow4 [0:7]=8'b00010000;
             firstDigitRow5 [0:7]=8'b00100000;
             firstDigitRow6 [0:7]=8'b01000000;
             firstDigitRow7 [0:7]=8'b11111000;
             firstDigitRow8 [0:7]=8'b00000000;
             end
         3 :
             begin
             firstDigitRow1 [0:7]=8'b11111000;
             firstDigitRow2 [0:7]=8'b00010000;
             firstDigitRow3 [0:7]=8'b00100000;
             firstDigitRow4 [0:7]=8'b00010000;
             firstDigitRow5 [0:7]=8'b00001000;
             firstDigitRow6 [0:7]=8'b10001000;
             firstDigitRow7 [0:7]=8'b01110000;
             firstDigitRow8 [0:7]=8'b00000000;
             end
         4 :
             begin
             firstDigitRow1 [0:7]=8'b00010000;
             firstDigitRow2 [0:7]=8'b00110000;
             firstDigitRow3 [0:7]=8'b01010000;
             firstDigitRow4 [0:7]=8'b10010000;
             firstDigitRow5 [0:7]=8'b11111000;
             firstDigitRow6 [0:7]=8'b00010000;
             firstDigitRow7 [0:7]=8'b00010000;
             firstDigitRow8 [0:7]=8'b00000000;
             end
         5 :
             begin
             firstDigitRow1 [0:7]=8'b11111000;
             firstDigitRow2 [0:7]=8'b10000000;
             firstDigitRow3 [0:7]=8'b11110000;
             firstDigitRow4 [0:7]=8'b00001000;
             firstDigitRow5 [0:7]=8'b00001000;
             firstDigitRow6 [0:7]=8'b10001000;
             firstDigitRow7 [0:7]=8'b01110000;
             firstDigitRow8 [0:7]=8'b00000000;
             end
         6 :
             begin
             firstDigitRow1 [0:7]=8'b00110000;
             firstDigitRow2 [0:7]=8'b01000000;
             firstDigitRow3 [0:7]=8'b10000000;
             firstDigitRow4 [0:7]=8'b11110000;
             firstDigitRow5 [0:7]=8'b10001000;
             firstDigitRow6 [0:7]=8'b10001000;
             firstDigitRow7 [0:7]=8'b01110000;
             firstDigitRow8 [0:7]=8'b00000000;
             end
         7 :
             begin
             firstDigitRow1 [0:7]=8'b11111000;
             firstDigitRow2 [0:7]=8'b10001000;
             firstDigitRow3 [0:7]=8'b00001000;
             firstDigitRow4 [0:7]=8'b00010000;
             firstDigitRow5 [0:7]=8'b00100000;
             firstDigitRow6 [0:7]=8'b00100000;
             firstDigitRow7 [0:7]=8'b00100000;
             firstDigitRow8 [0:7]=8'b00000000;
             end
         8 :
             begin
             firstDigitRow1 [0:7]=8'b01110000;
             firstDigitRow2 [0:7]=8'b10001000;
             firstDigitRow3 [0:7]=8'b10001000;
             firstDigitRow4 [0:7]=8'b01110000;
             firstDigitRow5 [0:7]=8'b10001000;
             firstDigitRow6 [0:7]=8'b10001000;
             firstDigitRow7 [0:7]=8'b01110000;
             firstDigitRow8 [0:7]=8'b00000000;
             end
         9 :
             begin
             firstDigitRow1 [0:7]=8'b01110000;
             firstDigitRow2 [0:7]=8'b10001000;
             firstDigitRow3 [0:7]=8'b10001000;
             firstDigitRow4 [0:7]=8'b01111000;
             firstDigitRow5 [0:7]=8'b00001000;
             firstDigitRow6 [0:7]=8'b00010000;
             firstDigitRow7 [0:7]=8'b01100000;
             firstDigitRow8 [0:7]=8'b00000000;
             end
     endcase
	  
     case(secondDigit)
         0 :
             begin
             secondDigitRow1 [0:7]=8'b01110000;
             secondDigitRow2 [0:7]=8'b10001000;
             secondDigitRow3 [0:7]=8'b10011000;
             secondDigitRow4 [0:7]=8'b10101000;
             secondDigitRow5 [0:7]=8'b11001000;
             secondDigitRow6 [0:7]=8'b10001000;
             secondDigitRow7 [0:7]=8'b01110000;
             secondDigitRow8 [0:7]=8'b00000000;
             end
         1 :
             begin
             secondDigitRow1 [0:7]=8'b01000000;
             secondDigitRow2 [0:7]=8'b11000000;
             secondDigitRow3 [0:7]=8'b01000000;
             secondDigitRow4 [0:7]=8'b01000000;
             secondDigitRow5 [0:7]=8'b01000000;
             secondDigitRow6 [0:7]=8'b01000000;
             secondDigitRow7 [0:7]=8'b11100000;
             secondDigitRow8 [0:7]=8'b00000000;
             end
         2 :
             begin
             secondDigitRow1 [0:7]=8'b01110000;
             secondDigitRow2 [0:7]=8'b10001000;
             secondDigitRow3 [0:7]=8'b00001000;
             secondDigitRow4 [0:7]=8'b00010000;
             secondDigitRow5 [0:7]=8'b00100000;
             secondDigitRow6 [0:7]=8'b01000000;
             secondDigitRow7 [0:7]=8'b11111000;
             secondDigitRow8 [0:7]=8'b00000000;
             end
         3 :
             begin
             secondDigitRow1 [0:7]=8'b11111000;
             secondDigitRow2 [0:7]=8'b00010000;
             secondDigitRow3 [0:7]=8'b00100000;
             secondDigitRow4 [0:7]=8'b00010000;
             secondDigitRow5 [0:7]=8'b00001000;
             secondDigitRow6 [0:7]=8'b10001000;
             secondDigitRow7 [0:7]=8'b01110000;
             secondDigitRow8 [0:7]=8'b00000000;
             end
         4 :
             begin
             secondDigitRow1 [0:7]=8'b00010000;
             secondDigitRow2 [0:7]=8'b00110000;
             secondDigitRow3 [0:7]=8'b01010000;
             secondDigitRow4 [0:7]=8'b10010000;
             secondDigitRow5 [0:7]=8'b11111000;
             secondDigitRow6 [0:7]=8'b00010000;
             secondDigitRow7 [0:7]=8'b00010000;
             secondDigitRow8 [0:7]=8'b00000000;
             end
         5 :
             begin
             secondDigitRow1 [0:7]=8'b11111000;
             secondDigitRow2 [0:7]=8'b10000000;
             secondDigitRow3 [0:7]=8'b11110000;
             secondDigitRow4 [0:7]=8'b00001000;
             secondDigitRow5 [0:7]=8'b00001000;
             secondDigitRow6 [0:7]=8'b10001000;
             secondDigitRow7 [0:7]=8'b01110000;
             secondDigitRow8 [0:7]=8'b00000000;
             end
         6 :
             begin
             secondDigitRow1 [0:7]=8'b00110000;
             secondDigitRow2 [0:7]=8'b01000000;
             secondDigitRow3 [0:7]=8'b10000000;
             secondDigitRow4 [0:7]=8'b11110000;
             secondDigitRow5 [0:7]=8'b10001000;
             secondDigitRow6 [0:7]=8'b10001000;
             secondDigitRow7 [0:7]=8'b01110000;
             secondDigitRow8 [0:7]=8'b00000000;
             end
         7 :
             begin
             secondDigitRow1 [0:7]=8'b11111000;
             secondDigitRow2 [0:7]=8'b10001000;
             secondDigitRow3 [0:7]=8'b00001000;
             secondDigitRow4 [0:7]=8'b00010000;
             secondDigitRow5 [0:7]=8'b00100000;
             secondDigitRow6 [0:7]=8'b00100000;
             secondDigitRow7 [0:7]=8'b00100000;
             secondDigitRow8 [0:7]=8'b00000000;
             end
         8 :
             begin
             secondDigitRow1 [0:7]=8'b01110000;
             secondDigitRow2 [0:7]=8'b10001000;
             secondDigitRow3 [0:7]=8'b10001000;
             secondDigitRow4 [0:7]=8'b01110000;
             secondDigitRow5 [0:7]=8'b10001000;
             secondDigitRow6 [0:7]=8'b10001000;
             secondDigitRow7 [0:7]=8'b01110000;
             secondDigitRow8 [0:7]=8'b00000000;
             end
         9 :
             begin
             secondDigitRow1 [0:7]=8'b01110000;
             secondDigitRow2 [0:7]=8'b10001000;
             secondDigitRow3 [0:7]=8'b10001000;
             secondDigitRow4 [0:7]=8'b01111000;
             secondDigitRow5 [0:7]=8'b00001000;
             secondDigitRow6 [0:7]=8'b00010000;
             secondDigitRow7 [0:7]=8'b01100000;
             secondDigitRow8 [0:7]=8'b00000000;
             end
     endcase

      ROW1[0:15] = ({firstDigitRow1[0:7] , secondDigitRow1[0:7]});
      ROW2[0:15]= ({firstDigitRow2[0:7] , secondDigitRow2[0:7]});
      ROW3[0:15] = ({firstDigitRow3[0:7] , secondDigitRow3[0:7]});
      ROW4[0:15] = ({firstDigitRow4 [0:7], secondDigitRow4[0:7]});
      ROW5[0:15] = ({firstDigitRow5 [0:7], secondDigitRow5[0:7]});
      ROW6[0:15] = ({firstDigitRow6 [0:7], secondDigitRow6[0:7]});
      ROW7[0:15] = ({firstDigitRow7[0:7] , secondDigitRow7[0:7]});
      ROW8[0:15] = ({firstDigitRow8[0:7], secondDigitRow8[0:7]}); 
		
		end
		endmodule