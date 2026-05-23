//this is the dut of the CHI protocol 

//drive the signals into the chi interface
//test intent: write + read with manager as request node, location as completer node
/*request will be driven, response should be sent:
RN-F will be the driver in that case? driver should be connected to the RNF basically
monitor is connected to the RXDAT channel of RN-F
TXREQ FLIT from driver
Receiver (HN or completer sends this?) sends a credit
FLITV is sent from driver to indicate that TXREQ flit is valid
CompBIDRESP? from HN's TXRSP channel
WRITE from TXDAT channel of RN + sending write req to completer
HN sends over TXDAT channel the WRITE DATA
compack is sent by hn to rn*/

module chi_top_wrapper(input chi_signals_i, output chi_signals_o);
endmodule

//RNF behaviour
module rnf(
  input clk,
  input endpoint_data,
  input endpoint_addr,//this should be driven by the uvm?
  output reg txreq,
  output reg txdatflit,
  input reg bidresp,
  output wire READREQ,
  output wire WRITEREQ);
  case(reqtype)
    writereq: begin
      assign WRITEREQ = 1;
      always@(posedge clk)begin
        //need to send a write transaction: so first need to send a TXREQ
        txreq = 1;
        #5
         if bidresp != x begin 
           txdatflit = {endpoint_addr,endpoint_data};
         end
      end 
    end //end of writereq
  readreq: begin
    assign READREQ = 1;
  end 
  endcase    
endmodule

//endpoint HNF
