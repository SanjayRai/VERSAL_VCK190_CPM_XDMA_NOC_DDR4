`ifndef NOC_MC_DDR4_V1_0_TXNQ
`define NOC_MC_DDR4_V1_0_TXNQ

class noc_mc_ddr4_v1_0_txnq ;

`define TXNQ_ARB_FSM_WIDTH 		5
`define TXNQ_ARB_FSM_RD_PRIORITY     5'b00_001
`define TXNQ_ARB_FSM_RD_STARVED      5'b00_010
`define TXNQ_ARB_FSM_WR_RD_PRIORITY  5'b00_100
`define TXNQ_ARB_FSM_WR_TOP          5'b01_000
`define TXNQ_ARB_FSM_WR_PRIORITY     5'b10_000
`define TXNQ_ARB_FSM_RD_PRIORITY_BIT     1
`define TXNQ_ARB_FSM_RD_STARVED_BIT      2
`define TXNQ_ARB_FSM_WR_RD_PRIORITY_BIT  3
`define TXNQ_ARB_FSM_WR_TOP_BIT          4
`define TXNQ_ARB_FSM_WR_PRIORITY_BIT     5
`define TXNQ_ARB_TIMER_WIDTH  		16
//SKIP-FSM details
`define TXNQ_SKIP_FSM_WIDTH  3
`define TXNQ_SKIP_FSM_IDLE   3'b001
`define TXNQ_SKIP_FSM_READ   3'b010
`define TXNQ_SKIP_FSM_WRITE  3'b100

bit rst;
logic  [`TXNQ_ARB_FSM_WIDTH-1:0]       txnq_arb_fsm_nxt;
logic  [`TXNQ_ARB_FSM_WIDTH-1:0]       txnq_arb_fsm_ff;

//SKIP-FSM details
logic  [`TXNQ_SKIP_FSM_WIDTH-1:0]      txnq_skip_fsm_ff;
logic  [`TXNQ_SKIP_FSM_WIDTH-1:0]      txnq_skip_fsm_nxt;
logic                                  txnq_skip_fsm_read_only_nxt,txnq_skip_fsm_read_only_ff;
logic                                  txnq_skip_fsm_write_only_nxt,txnq_skip_fsm_write_only_ff;
logic                                  txnq_skip_arb_mode_nxt,txnq_skip_arb_mode_ff;
logic                                  txnq_rd_priority_skip_count_en,txnq_wr_priority_skip_count_en;
logic                                  txnq_normal_arb_mode;
logic    wr_pend_count_nz ;
logic    wr_pend_count_z  ;
logic    rd_pend_count_nz ;
logic    rd_pend_count_z  ;
logic         wr_seq_cas_count_over_thresh;
logic         rd_seq_cas_count_over_thresh;
logic         farb_rd_cas_won,farb_wr_cas_won;
logic    early_skip_rd_exit_en , early_skip_wr_exit_en;
/////////
logic  [`TXNQ_ARB_TIMER_WIDTH-1:0]      rd_starved_timer_nxt;  
logic  [`TXNQ_ARB_TIMER_WIDTH-1:0]      rd_starved_timer_ff;  
logic  [`TXNQ_ARB_TIMER_WIDTH-1:0]      wr_rd_pri_timer_nxt;  
logic  [`TXNQ_ARB_TIMER_WIDTH-1:0]      wr_rd_pri_timer_ff;  
logic  [`TXNQ_ARB_TIMER_WIDTH-1:0]      wr_top_timer_nxt;  
logic  [`TXNQ_ARB_TIMER_WIDTH-1:0]      wr_top_timer_ff;   

logic				       rd_priority_nxt;
logic				       rd_priority_ff;
logic				       wr_priority_nxt;
logic				       wr_priority_ff;
logic				       wr_rd_priority_nxt;
logic				       wr_rd_priority_ff;
logic				       wr_top_nxt;
logic				       wr_top_ff;
logic				       starved_priority_nxt;
logic				       starved_priority_ff;
logic              rd_starved_timer_expired;
logic              wr_rd_pri_timer_expired;
logic              wr_top_timer_expired;
logic              farb_wr_priority_nxt;
logic              farb_rd_priority_nxt;
logic              farb_wr_priority_ff;
logic              farb_rd_priority_ff;
logic [`TXNQ_ARB_TIMER_WIDTH-1:0] txnq_rd_starved_timer;
logic [`TXNQ_ARB_TIMER_WIDTH-1:0] txnq_wr_rd_pri_timer; 
logic [`TXNQ_ARB_TIMER_WIDTH-1:0] txnq_wr_top_timer ; 
logic all_cmd_arb_mode ;
logic rd_pri_arb_only_mode ;
logic rd_pri_and_starved_arb_only_mode ; 
logic rd_pri_wr_pri_arb_only_mode ;
logic txnq_starved_mode ;
logic wr_cas_count_over_high_th;
logic wr_cas_count_below_low_th;
logic wr_cas_count_over_low_th;

//function new;

//endfunction
//logic txnq_skip_arb_mode_nxt;
//wire  txnq_normal_arb_mode = | txnq_arb_fsm_ff[`TXNQ_ARB_FSM_WIDTH-1:1];

//command arb FSM
//State1 TXNQ_ARB_FSM_RD_PRIORITY: default priority, read page miss can close write page hit
//State2 TXNQ_ARB_FSM_RD_STARVED: select read starved entry only 
//State3 TXNQ_ARB_FSM_WR_RD_PRIORITY: write over read priority, read page miss cannot close write page hit
//State4 TXNQ_ARB_FSM_WR_TOP: from rd_starved state to this state. select write command only
//State5 TXNQ_ARB_FSM_WR_PRIORITY: from wr_rd_priority state to this state. select write command only
function automatic void txnq_determine_state(input bit mc_rst);
if(mc_rst) begin
txnq_arb_fsm_nxt = 0;
rd_priority_nxt  = 0;
wr_priority_nxt  = 0;
wr_top_nxt       = 0;
starved_priority_nxt = 0;
farb_rd_priority_nxt = 0;
farb_wr_priority_nxt = 0;
  end 
  else begin
	//state
	  txnq_arb_fsm_nxt = txnq_arb_fsm_ff;
	//output txnq
	  rd_priority_nxt = rd_priority_ff;
	  wr_priority_nxt = wr_priority_ff;
	  wr_rd_priority_nxt = wr_rd_priority_ff;
	  wr_top_nxt = wr_top_ff;
	  starved_priority_nxt = starved_priority_ff;
        //ooutput farb
    /*
    if (~txnq_skip_arb_mode_nxt) begin  //If FSM is in SKIP mode, farb prio is determined by SKIP mode only
	    farb_rd_priority_nxt = farb_rd_priority_ff;
	    farb_wr_priority_nxt = farb_wr_priority_ff;
    end
    */
        //timer
	  rd_starved_timer_nxt = rd_starved_timer_ff;
	  wr_rd_pri_timer_nxt = wr_rd_pri_timer_ff;
	  wr_top_timer_nxt = wr_top_timer_ff;
    rd_starved_timer_expired = (rd_starved_timer_ff == `TXNQ_ARB_TIMER_WIDTH'd0);
    wr_rd_pri_timer_expired  = (wr_rd_pri_timer_ff == `TXNQ_ARB_TIMER_WIDTH'd0);
    wr_top_timer_expired     = (wr_top_timer_ff == `TXNQ_ARB_TIMER_WIDTH'd0);
  casez (txnq_arb_fsm_ff)
  `TXNQ_ARB_FSM_RD_PRIORITY:  //State 1
       begin

        //if (~txnq_skip_arb_mode_nxt & ~ignore_starved_read_only_ff & txnq_starved_mode_nxt & (all_cmd_arb_mode | rd_pri_and_starved_arb_only_mode)) begin
         //if (txnq_starved_mode & (all_cmd_arb_mode | rd_pri_and_starved_arb_only_mode)) begin
         if (~txnq_skip_arb_mode_nxt & txnq_starved_mode & (all_cmd_arb_mode | rd_pri_and_starved_arb_only_mode)) begin
	       //state transition
           txnq_arb_fsm_nxt = `TXNQ_ARB_FSM_RD_STARVED; //State 2
	       //output
	         rd_priority_nxt      = 1'b0;
	         wr_priority_nxt      = 1'b0;
	         wr_rd_priority_nxt   = 1'b0;
	         wr_top_nxt           = 1'b0;
	         starved_priority_nxt = 1'b1;

	         farb_rd_priority_nxt = 1'b1;
	         farb_wr_priority_nxt = 1'b0;
	       //timer
	         rd_starved_timer_nxt = txnq_rd_starved_timer;
         end 
	       //else if (~txnq_skip_arb_mode_nxt & wr_cas_count_over_high_th & (all_cmd_arb_mode | rd_pri_wr_pri_arb_only_mode)) begin
	       //else if (wr_cas_count_over_high_th & (all_cmd_arb_mode | rd_pri_wr_pri_arb_only_mode)) begin
	       else if (~txnq_skip_arb_mode_nxt & wr_cas_count_over_high_th & (all_cmd_arb_mode | rd_pri_wr_pri_arb_only_mode)) begin
	       //state transition
           txnq_arb_fsm_nxt = `TXNQ_ARB_FSM_WR_RD_PRIORITY;  //State 3
	       //output
	         rd_priority_nxt      = 1'b0;
	         wr_priority_nxt      = 1'b0;
	         wr_rd_priority_nxt   = 1'b1;
	         wr_top_nxt           = 1'b0;
	         starved_priority_nxt = 1'b0;

	         farb_rd_priority_nxt = 1'b0;
	         farb_wr_priority_nxt = 1'b1;
	       //timer
	         wr_rd_pri_timer_nxt = txnq_wr_rd_pri_timer;
         end
	       else if (~txnq_skip_arb_mode_nxt) begin
	       //state transition
           txnq_arb_fsm_nxt = `TXNQ_ARB_FSM_RD_PRIORITY;  //State 1
	       //output
	         rd_priority_nxt      = 1'b1;
	         wr_priority_nxt      = 1'b0;
	         wr_rd_priority_nxt   = 1'b0;
	         wr_top_nxt           = 1'b0;
	         starved_priority_nxt = 1'b0;
	         farb_rd_priority_nxt = 1'b1;
	         farb_wr_priority_nxt = 1'b0;  
        //timer
	         rd_starved_timer_nxt = txnq_rd_starved_timer;
	         wr_rd_pri_timer_nxt = txnq_wr_rd_pri_timer;
	         wr_top_timer_nxt = txnq_wr_top_timer;
         end
       end

      `TXNQ_ARB_FSM_RD_STARVED:  //State 2
       begin
        if (~txnq_starved_mode) begin
	      //state transition
          txnq_arb_fsm_nxt = `TXNQ_ARB_FSM_RD_PRIORITY;  //State 1
	     //output
	        rd_priority_nxt      = 1'b1;
	        wr_priority_nxt      = 1'b0;
	        wr_rd_priority_nxt   = 1'b0;
	        wr_top_nxt           = 1'b0;
	        starved_priority_nxt = 1'b0;

	        farb_rd_priority_nxt = 1'b1;
	        farb_wr_priority_nxt = 1'b0;
        //timer
	        rd_starved_timer_nxt = txnq_rd_starved_timer;
        end 
	      else if (wr_cas_count_over_high_th & rd_starved_timer_expired & all_cmd_arb_mode) begin
	      //state transition
          txnq_arb_fsm_nxt = `TXNQ_ARB_FSM_WR_TOP;  //State 4
	      //output
	        rd_priority_nxt      = 1'b0;
	        wr_priority_nxt      = 1'b0;
	        wr_rd_priority_nxt   = 1'b0;
	        wr_top_nxt           = 1'b1;
	        starved_priority_nxt = 1'b0;

	  farb_rd_priority_nxt = 1'b0;
	  farb_wr_priority_nxt = 1'b1;
        //timer
	        rd_starved_timer_nxt = txnq_rd_starved_timer;
        end
	      else begin
	      //state transition
          txnq_arb_fsm_nxt = `TXNQ_ARB_FSM_RD_STARVED;  //State 2
	//output
	  rd_priority_nxt      = 1'b0;
	  wr_priority_nxt      = 1'b0;
	  wr_rd_priority_nxt   = 1'b0;
	  wr_top_nxt           = 1'b0;
	  starved_priority_nxt = 1'b1;

	  farb_rd_priority_nxt = 1'b1;
	  farb_wr_priority_nxt = 1'b0;  
        //timer
    if (|rd_starved_timer_ff)
	    //rd_starved_timer_nxt = rd_starved_timer_ff - ONE[`TXNQ_ARB_TIMER_WIDTH-1:0];
	    rd_starved_timer_nxt = rd_starved_timer_ff - 1;
        end
       end

      `TXNQ_ARB_FSM_WR_RD_PRIORITY:  //State 3
       begin
        //if (~ignore_starved_read_only_ff & txnq_starved_mode_nxt & all_cmd_arb_mode) begin
        if (txnq_starved_mode & all_cmd_arb_mode) begin
	//state transition
          txnq_arb_fsm_nxt = `TXNQ_ARB_FSM_RD_STARVED;  //State 2
	//output                                                           
	  rd_priority_nxt      = 1'b0;
	  wr_priority_nxt      = 1'b0;
	  wr_rd_priority_nxt   = 1'b0;
	  wr_top_nxt           = 1'b0;
	  starved_priority_nxt = 1'b1;

	  farb_rd_priority_nxt = 1'b1;
	  farb_wr_priority_nxt = 1'b0;
	//timer
	  wr_rd_pri_timer_nxt = txnq_wr_rd_pri_timer;
        end 
	else if (wr_cas_count_over_low_th & wr_rd_pri_timer_expired) begin
	//state transition
          txnq_arb_fsm_nxt = `TXNQ_ARB_FSM_WR_PRIORITY;  //State 5
	//output
	  rd_priority_nxt      = 1'b0;
	  wr_priority_nxt      = 1'b1;
	  wr_rd_priority_nxt   = 1'b0;
	  wr_top_nxt           = 1'b0;
	  starved_priority_nxt = 1'b0;

	  farb_rd_priority_nxt = 1'b0;
	  farb_wr_priority_nxt = 1'b1;
	//timer
	  wr_rd_pri_timer_nxt = txnq_wr_rd_pri_timer;
        end
	else if (wr_cas_count_below_low_th) begin
	//state transition
          txnq_arb_fsm_nxt = `TXNQ_ARB_FSM_RD_PRIORITY;  //State 1
	//output
	  rd_priority_nxt      = 1'b1;
	  wr_priority_nxt      = 1'b0;
	  wr_rd_priority_nxt   = 1'b0;
	  wr_top_nxt           = 1'b0;
	  starved_priority_nxt = 1'b0;

	  farb_rd_priority_nxt = 1'b1;
	  farb_wr_priority_nxt = 1'b0;
	//timer
	  wr_rd_pri_timer_nxt = txnq_wr_rd_pri_timer;
        end
	else begin
	//state transition
          txnq_arb_fsm_nxt = `TXNQ_ARB_FSM_WR_RD_PRIORITY;  //State 3
	//output
	  rd_priority_nxt      = 1'b0;
	  wr_priority_nxt      = 1'b0;
	  wr_rd_priority_nxt   = 1'b1;
	  wr_top_nxt           = 1'b0;
	  starved_priority_nxt = 1'b0;

	  farb_rd_priority_nxt = 1'b0;
	  farb_wr_priority_nxt = 1'b1; 
        //timer
    if (|wr_rd_pri_timer_ff)
	    //wr_rd_pri_timer_nxt = wr_rd_pri_timer_ff - ONE[`TXNQ_ARB_TIMER_WIDTH-1:0]; 
	    wr_rd_pri_timer_nxt = wr_rd_pri_timer_ff - 1; 
        end
       end

      `TXNQ_ARB_FSM_WR_TOP:  //State 4
       begin
        //if (wr_cas_count_below_low_th | (~ignore_starved_read_only_ff &&  txnq_starved_mode_ff & wr_top_timer_expired)) begin
        if (wr_cas_count_below_low_th | (txnq_starved_mode & wr_top_timer_expired)) begin
	//state transition
          txnq_arb_fsm_nxt = `TXNQ_ARB_FSM_RD_STARVED;  //State 2
	//output
	  rd_priority_nxt      = 1'b0;
	  wr_priority_nxt      = 1'b0;
	  wr_rd_priority_nxt   = 1'b0;
	  wr_top_nxt           = 1'b0;
	  starved_priority_nxt = 1'b1;

	  farb_rd_priority_nxt = 1'b1;
	  farb_wr_priority_nxt = 1'b0;
	  wr_top_timer_nxt = txnq_wr_top_timer;
        end 
	else begin
	//state transition
          txnq_arb_fsm_nxt = `TXNQ_ARB_FSM_WR_TOP;  //State 4
	//output
	  rd_priority_nxt      = 1'b0;
	  wr_priority_nxt      = 1'b0;
	  wr_rd_priority_nxt   = 1'b0;
	  wr_top_nxt           = 1'b1;
	  starved_priority_nxt = 1'b0;

	  farb_rd_priority_nxt = 1'b0;
	  farb_wr_priority_nxt = 1'b1;  
        //timer
      if (|wr_top_timer_ff)
    	  //wr_top_timer_nxt = wr_top_timer_ff - ONE[`TXNQ_ARB_TIMER_WIDTH-1:0]; 
    	  wr_top_timer_nxt = wr_top_timer_ff - 1; 
        end
       end

      `TXNQ_ARB_FSM_WR_PRIORITY:  //State 5
       begin
        //if (~ignore_starved_read_only_ff & txnq_starved_mode_nxt & all_cmd_arb_mode) begin
        if (txnq_starved_mode & all_cmd_arb_mode) begin
	//state transition
          txnq_arb_fsm_nxt = `TXNQ_ARB_FSM_WR_TOP;  //State 4
	//output
	  rd_priority_nxt      = 1'b0;
	  wr_priority_nxt      = 1'b0;
	  wr_rd_priority_nxt   = 1'b0;
	  wr_top_nxt           = 1'b1;
	  starved_priority_nxt = 1'b0;

	  farb_rd_priority_nxt = 1'b0;
	  farb_wr_priority_nxt = 1'b1;
        end 
	else if (wr_cas_count_below_low_th) begin
	//state transition
          txnq_arb_fsm_nxt = `TXNQ_ARB_FSM_RD_PRIORITY;  //State 1
	//output
	  rd_priority_nxt      = 1'b1;
	  wr_priority_nxt      = 1'b0;
	  wr_rd_priority_nxt   = 1'b0;
	  wr_top_nxt           = 1'b0;
	  starved_priority_nxt = 1'b0;

	  farb_rd_priority_nxt = 1'b1;
	  farb_wr_priority_nxt = 1'b0;
        end
	else begin
	//state transition
          txnq_arb_fsm_nxt = `TXNQ_ARB_FSM_WR_PRIORITY;  //State 5
	//output
	  rd_priority_nxt      = 1'b0;
	  wr_priority_nxt      = 1'b1;
	  wr_rd_priority_nxt   = 1'b0;
	  wr_top_nxt           = 1'b0;
	  starved_priority_nxt = 1'b0;

	  farb_rd_priority_nxt = 1'b0;
	  farb_wr_priority_nxt = 1'b1;  
        end
       end

  endcase
end
endfunction

function automatic void skip_FSM_determine_state(input bit mc_rst);
  if(mc_rst) begin
    txnq_skip_fsm_nxt                       = `TXNQ_SKIP_FSM_IDLE;
    txnq_skip_fsm_read_only_nxt             = '0;
    txnq_skip_fsm_write_only_nxt            = '0;
    txnq_skip_arb_mode_nxt                  = 1'b1;
  end 
  else begin
    txnq_skip_fsm_nxt                         = txnq_skip_fsm_ff;
    txnq_skip_fsm_read_only_nxt               = '0;
    txnq_skip_fsm_write_only_nxt              = '0;
    txnq_skip_arb_mode_nxt                    = 1'b1;
        //ooutput farb
	  farb_rd_priority_nxt = farb_rd_priority_ff;
	  farb_wr_priority_nxt = farb_wr_priority_ff;

     casez ( txnq_skip_fsm_ff )
    // In the IDLE state the arbiter is in the normal mode where reads are slightly prefered over writes.
    // From this state we can transfer to a read-only or write-only state if there are no starved transactions.
    // If there are starved transactions, de-assert the txnq_skip_arb_mode_nxt signal to allow the normal arb to run.
    // If the normal arb is out of IDLE the skip fsm stays in idle.
    `TXNQ_SKIP_FSM_IDLE: begin
      txnq_skip_arb_mode_nxt = ~txnq_starved_mode & ( txnq_rd_priority_skip_count_en | txnq_wr_priority_skip_count_en );
      farb_rd_priority_nxt = 1;
      farb_wr_priority_nxt = 0;
      if ( ~txnq_normal_arb_mode & rd_pend_count_nz & wr_seq_cas_count_over_thresh & ~txnq_starved_mode ) begin
        txnq_skip_fsm_nxt = `TXNQ_SKIP_FSM_READ;
      end else if ( ~txnq_normal_arb_mode & wr_pend_count_nz & rd_seq_cas_count_over_thresh &  ~txnq_starved_mode ) begin
        txnq_skip_fsm_nxt = `TXNQ_SKIP_FSM_WRITE;
      end
    end

    // In the read-only state we block all writes. If there is starvation we transition back to the IDLE state.
    // If there is no starvation but we have pending writes and they have been skipped too many times we transition to the write-only state.
    `TXNQ_SKIP_FSM_READ: begin
      txnq_skip_fsm_read_only_nxt          = 1'b1;
       farb_rd_priority_nxt = 1'b1;
	     farb_wr_priority_nxt = 1'b0;

      if ( wr_pend_count_nz & rd_seq_cas_count_over_thresh &  ~txnq_starved_mode ) begin
        txnq_skip_fsm_nxt = `TXNQ_SKIP_FSM_WRITE;
      end else if ( ( farb_rd_cas_won & early_skip_rd_exit_en )  | rd_pend_count_z | txnq_starved_mode ) begin
        txnq_skip_fsm_nxt = `TXNQ_SKIP_FSM_IDLE;
      end
    end

    // In the write-only state we block all reads. If there is starvation we transition back to the IDLE state.
    // If there is no starvation but we have pending reads and they have been skipped too many times we transition to the read-only state.
    `TXNQ_SKIP_FSM_WRITE: begin
      txnq_skip_fsm_write_only_nxt         = 1'b1;
       farb_rd_priority_nxt = 1'b0;
	     farb_wr_priority_nxt = 1'b1;
      if ( rd_pend_count_nz & wr_seq_cas_count_over_thresh & ~txnq_starved_mode ) begin
        txnq_skip_fsm_nxt = `TXNQ_SKIP_FSM_READ;
      end else if ( ( farb_wr_cas_won & early_skip_wr_exit_en ) | wr_pend_count_z | txnq_starved_mode ) begin
        txnq_skip_fsm_nxt = `TXNQ_SKIP_FSM_IDLE;
      end
    end
  endcase
  end
endfunction

function automatic integer txnq_get_next_state(input bit mc_rst);
    if(mc_rst) begin
    //rd_priority_ff      = 0;
    rd_priority_ff      = 1; //CR-1085023 : reset sate is TXNQ_ARB_FSM_RD_PRIORITY, where the rd_priority_ff should be 1
    wr_priority_ff      = 0;
    wr_rd_priority_ff   = 0;
    wr_top_ff           = 0;
    starved_priority_ff = 0;
    rd_starved_timer_ff = 0;
    wr_rd_pri_timer_ff  = 0;
    wr_top_timer_ff     = 0;
    farb_rd_priority_ff = 1;
    farb_wr_priority_ff = 0;
    txnq_arb_fsm_ff     = `TXNQ_ARB_FSM_RD_PRIORITY;
    //SKIP-FSM details
    txnq_skip_fsm_ff                       = `TXNQ_SKIP_FSM_IDLE;
    txnq_skip_fsm_read_only_ff             = '0;
    txnq_skip_fsm_write_only_ff            = '0;
    txnq_skip_arb_mode_ff                  =  1'b1;
    end 
    else begin
   rd_priority_ff      = rd_priority_nxt  ;    
   wr_priority_ff      = wr_priority_nxt  ;    
   wr_rd_priority_ff   = wr_rd_priority_nxt;   
   wr_top_ff           = wr_top_nxt;           
   starved_priority_ff = starved_priority_nxt; 
   rd_starved_timer_ff = rd_starved_timer_nxt;
   wr_rd_pri_timer_ff  = wr_rd_pri_timer_nxt;
   wr_top_timer_ff     = wr_top_timer_nxt;
	 farb_rd_priority_ff = farb_rd_priority_nxt;
	 farb_wr_priority_ff = farb_wr_priority_nxt;
   txnq_arb_fsm_ff     = txnq_arb_fsm_nxt;
   
    //SKIP-FSM details
    txnq_skip_fsm_ff                       = txnq_skip_fsm_nxt;
    txnq_skip_fsm_read_only_ff             = txnq_skip_fsm_read_only_nxt;
    txnq_skip_fsm_write_only_ff            = txnq_skip_fsm_write_only_nxt;
    txnq_skip_arb_mode_ff                  = txnq_skip_arb_mode_nxt;
    txnq_normal_arb_mode                   = (txnq_arb_fsm_ff !=`TXNQ_ARB_FSM_RD_PRIORITY)  ;  //If normal Arb is out of idle (RD prio) state, this signal will raise and keeps skip arb in idle
   end
endfunction

function automatic void txnq_fsm_initialize(input bit mc_rst);
    $display("%m: called rst state @%t",$time);
  if(mc_rst) begin
    $display("%m: entered rst state @%t",$time);
    rd_priority_ff      = 0;
    wr_priority_ff      = 0;
    wr_rd_priority_ff   = 0;
    wr_top_ff           = 0;
    starved_priority_ff = 0;
    rd_starved_timer_ff = 0;
    wr_rd_pri_timer_ff  = 0;
    wr_top_timer_ff     = 0;
    farb_rd_priority_ff = 0;
    farb_wr_priority_ff = 0;
    txnq_arb_fsm_ff     = `TXNQ_ARB_FSM_RD_PRIORITY;  
  end
endfunction

endclass
`endif
