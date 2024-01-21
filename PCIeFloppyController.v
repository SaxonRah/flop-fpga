module PCIeFloppyController (
  input wire clk,
  input wire rst_n,
  input wire [63:0] pcie_data_in,
  output wire [63:0] pcie_data_out,
  output wire pcie_tx_valid,
  output wire pcie_rx_valid
);

  // Internal signals
  reg [15:0] sector_buffer [0:127]; // BRAM for storing flux data
  reg [6:0] sector_index;
  reg [1:0] state;

  // PCIe data registers
  reg [63:0] pcie_tx_data_reg;
  reg [63:0] pcie_rx_data_reg;

  // PCIe state machine
  always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
      state <= 2'b00; // Reset state
      sector_index <= 7'b0000000;
    end else begin
      case (state)
        2'b00: begin // Idle state
          if (pcie_rx_valid) begin
            // Process command received from PCIe
            // For example, handle read or write operations to floppy controller
            // Update sector_buffer and pcie_tx_data_reg accordingly
            state <= 2'b01; // Move to data state
          end
        end
        2'b01: begin // Data state
          if (pcie_rx_valid) begin
            // Store flux data in sector_buffer
            sector_buffer[sector_index] <= pcie_data_in[15:0];
            sector_index <= sector_index + 1;
            // Update pcie_tx_data_reg accordingly
            state <= 2'b00; // Return to idle state
          end
        end
      endcase
    end
  end

  // PCIe data output
  assign pcie_data_out = pcie_tx_data_reg;
  assign pcie_tx_valid = (state == 2'b10); // Set to 1 when ready to transmit data
  assign pcie_rx_valid = (state == 2'b00) | (state == 2'b01); // Set to 1 when ready to receive data

endmodule
