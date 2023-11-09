//===============================================================================
//                            COPYRIGHT NOTICE
//  Copyright 2000-2019 (c) Lattice Semiconductor Corporation
//  ALL RIGHTS RESERVED
//  This confidential and proprietary software may be used only as authorised by
//  a licensing agreement from Lattice Semiconductor Corporation.
//  The entire notice above must be reproduced on all authorized copies and
//  copies may only be made to the extent permitted by a licensing agreement from
//  Lattice Semiconductor Corporation.
//
//  Lattice Semiconductor Corporation        TEL : 1-800-Lattice (USA and Canada)
//  5555 NE Moore Court                      408-826-6000 (other locations)
//  Hillsboro, OR 97124                      web  : http://www.latticesemi.com/
//  U.S.A                                    email: techsupport@latticesemi.com
//===============================================================================
//
//  Project          :
//  File             :
//  Version          :
//  Title            :
//  
//  Description      :
//                     
//  Addt'l info      : 
//  Version history  :
//
//===============================================================================

`timescale 1ns/100ps

module testbench_name;

//-----------------------
//  PARAMETER DEFINITIONS
//-----------------------

parameter   CLK_PERIOD = 10;

//----------------------
//  VARIABLE DEFINITIONS
//----------------------

reg                 clk;
reg                 rst_n;

//  display enable
reg                 disp_en = 1'b1;

//----------------------
//  MODULE INSTANTIATION
//----------------------



//----------------
//  INPUT TESTCASE
//----------------

//  clock generator
initial begin:  clk_sim
    # 10
    clk = 1'b1;
    forever begin:  clock_gen_dead_loop
        #(CLK_PERIOD / 2) clk = ~clk; 
    end
end

initial begin:  init_stimulus
    # 10;
    rst_n   = 1'b0;
    
    # ({$random} % 100)
    //  stimulus editing
    rst_n   = 1'b1;
end

//--------------
//  OUTPUT CHECK
//--------------



//-----------------
//  TASK DEFINITION
//-----------------

endmodule

