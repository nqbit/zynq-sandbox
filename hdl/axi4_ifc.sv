/* Copyright 2014 Brian Swetland <swetland@frotz.net>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

`timescale 1ns/1ps

interface axi4_ifc;

parameter AWIDTH = 32;
parameter DWIDTH = 32;
parameter IWIDTH = 1;

logic [IWIDTH-1:0] awid;
logic [AWIDTH-1:0] awaddr;
 logic [1:0]awburst;
 logic [3:0]awcache;
 logic [7:0]awlen;
 logic [2:0]awprot;
 logic [2:0]awsize;
 logic awlock;
logic awvalid;
logic awready;

logic [DWIDTH-1:0] wdata;
logic [3:0]wstrb;
logic wvalid;
logic wready;
 logic wlast;

logic [IWIDTH-1:0] bid;
logic [1:0] bresp;
logic bvalid;
logic bready;

logic [IWIDTH-1:0] arid;
logic [AWIDTH-1:0] araddr;
 logic [1:0]arburst;
 logic [3:0]arcache;
 logic [7:0]arlen;
 logic [2:0]arprot;
 logic [2:0]arsize;
 logic arlock;
logic arvalid;
logic arready;

logic [IWIDTH-1:0] rid;
logic [DWIDTH-1:0] rdata;
logic [1:0] rresp;
logic rvalid;
logic rready;
 logic rlast;

modport master (
	output awid, awaddr, awvalid, wdata, wstrb, wvalid, bready,
	output awburst, awcache, awlen, awprot, awsize, awlock, wlast,
	output arid, araddr, arvalid, rready,
	output arburst, arcache, arlen, arprot, arsize, arlock,
	input awready, wready, bid, bresp, bvalid,
	input arready, rid, rdata, rresp, rvalid, rlast
);

modport slave (
	input awid, awaddr, awvalid, wdata, wstrb, wvalid, bready,
	input awburst, awcache, awlen, awprot, awsize, awlock, wlast,
	input arid, araddr, arvalid, rready,
	input arburst, arcache, arlen, arprot, arsize, arlock,
	output awready, wready, bid, bresp, bvalid,
	output arready, rid, rdata, rresp, rvalid, rlast
);
	
endinterface

