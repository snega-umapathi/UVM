//this is the dut of the CHI protocol 


module chi_top_wrapper(input chi_signals_i, output chi_signals_o);
endmodule

//RNF behaviour
module rnf
  input endpoint_addr; //this should be driven by the uvm?
  output reg txreq;
  input reg txrsp;
  output wire READREQ;
  output wire WRITEREQ;
  case(reqtype)
    writereq: begin
      assign WRITEREQ = 1;
      //need to send a write transaction: so first need to send a TXREQ
      txreq = 1;
      #5 if 
      end
  readreq: begin
    assign READREQ = 1;
  end 
  endcase
    
endmodule

//endpoint HNF
