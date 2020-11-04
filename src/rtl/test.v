module test
# (
    parameter CNT_WIDTH = 16
  )
(/*AUTOARG*/
   // Outputs
   led_o,
   // Inputs
   clk_i, arstn_i
   );

  input   wire  clk_i;
  input   wire  arstn_i;
  output  reg   led_o;

  reg [CNT_WIDTH-1:0] counter;

  always @ (posedge clk_i, negedge arstn_i) begin
    if(~arstn_i)
      counter <= 0;
    else
      counter <= counter + 1;
  end

  always @ (posedge clk_i, negedge arstn_i) begin
    if(~arstn_i)
      led_o <= 0;
    else if(&counter)
      led_o <= ~led_o;
  end

endmodule
