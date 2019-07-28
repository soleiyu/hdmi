module colorbarFHD (
	input wire [10:0] x,
	input wire [10:0] y,

	output wire [7:0] r,
	output wire [7:0] g,
	output wire [7:0] b
);

wire [31:0] vramp;

always_comb begin
	vramp = framp(x);
	
	if (y < 11'd630) begin
		//40% W
		if(x < 11'd240) begin
			assign r = 8'd102;
			assign g = 8'd102;
			assign b = 8'd102;
		end
		//75% W
		else if (x < 11'd445) begin
			assign r = 8'd192;
			assign g = 8'd192;
			assign b = 8'd192;
		end
		//75% Y
		else if (x < 11'd650) begin
			assign r = 8'd192;
			assign g = 8'd192;
			assign b = 8'd0;
		end
		//75% Cy
		else if (x < 11'd855) begin
			assign r = 8'd0;
			assign g = 8'd192;
			assign b = 8'd192;
		end
		//75% G
		else if (x < 11'd1060) begin
			assign r = 8'd0;
			assign g = 8'd192;
			assign b = 8'd0;
		end
		//75% Mg
		else if (x < 11'd1265) begin
			assign r = 8'd192;
			assign g = 8'd0;
			assign b = 8'd192;
		end
		//75% R
		else if (x < 11'd1470) begin
			assign r = 8'd192;
			assign g = 8'd0;
			assign b = 8'd0;
		end
		//75% B
		else if (x <11'd1675) begin
			assign r = 8'd0;
			assign g = 8'd0;
			assign b = 8'd192;
		end
		//40% W
		else begin
			assign r = 8'd102;
			assign g = 8'd102;
			assign b = 8'd102;
		end
	end 

	else if (y < 11'd720) begin
		//100% Cy
		if (x < 11'd240) begin
			assign r = 8'd0;
			assign g = 8'd255;
			assign b = 8'd255;
		end 
		//100% W
		else if (x < 11'd445) begin
			assign r = 8'd255;
			assign g = 8'd255;
			assign b = 8'd255;
		end
		//75% W
		else if (x < 11'd1675) begin
			assign r = 8'd192;
			assign g = 8'd192;
			assign b = 8'd192;
		end
		//100% B
		else begin
			assign r = 8'd0;
			assign g = 8'd0;
			assign b = 8'd255;
		end			
	end
	
	else if (y < 11'd810) begin
		//100% Y
		if (x < 11'd240) begin
			assign r = 8'd255;
			assign g = 8'd255;
			assign b = 8'd0;
		end
		//0-100% Ramp
		else if (x < 11'd1675) begin
			assign r = vramp[7:0];
			assign g = vramp[7:0];
			assign b = vramp[7:0];
		end
		//100% R
		else begin
			assign r = 8'd255;
			assign g = 8'd0;
			assign b = 8'd0;
		end
	end
	
	else begin
		//15% W
		if (x < 11'd240) begin
			assign r = 8'd38;
			assign g = 8'd38;
			assign b = 8'd38;
		end
		//Bk
		else if (x < 11'd548) begin
			assign r = 8'd0;
			assign g = 8'd0;
			assign b = 8'd0;
		end
		//100% W
		else if (x < 11'd958) begin
			assign r = 8'd255;
			assign g = 8'd255;
			assign b = 8'd255;
		end
		//Bk
		else if (x < 11'd1130) begin
			assign r = 8'd0;
			assign g = 8'd0;
			assign b = 8'd0;
		end
		//2% W
		else if (x < 11'd1198) begin
			assign r = 8'd5;
			assign g = 8'd5;
			assign b = 8'd5;
		end
		//Bk
		else if (x < 11'd1226) begin
			assign r = 8'd0;
			assign g = 8'd0;
			assign b = 8'd0;
		end
		//4% W
		else if (x < 11'd1334) begin
			assign r = 8'd10;
			assign g = 8'd10;
			assign b = 8'd10;
		end
		//Bk
		else if (x < 11'd1402) begin
			assign r = 8'd0;
			assign g = 8'd0;
			assign b = 8'd0;
		end
		//8% W
		else if (x < 11'd1470) begin
			assign r = 8'd20;
			assign g = 8'd20;
			assign b = 8'd20;
		end
		//Bk
		else if (x < 11'd1675) begin
			assign r = 8'd0;
			assign g = 8'd0;
			assign b = 8'd0;
		end
		//15% W
		else begin
			assign r = 8'd38;
			assign g = 8'd38;
			assign b = 8'd38;
		end
	end
end

function [31:0] framp (input [10:0] xin); begin
	framp = 32'd255 * {21'd0, xin - 11'd240} / 32'd1435;
end
endfunction

endmodule
