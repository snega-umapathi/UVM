module driver(input chi_output_signals);
endmodule
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

