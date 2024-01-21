module FloppyController (
  input wire clk,
  input wire rst_n,
  input wire [15:0] sector_data_in,
  output wire [15:0] sector_data_out,
  output wire read_done,
  output wire write_done,
  output wire index_pulse
);

  // Internal signals
  reg [15:0] sector_buffer [0:127];
  reg [6:0] sector_index;
  reg [2:0] state;
  reg motor_on;

  // Floppy drive signals
  reg read_gate, write_gate, head_load, direction;
  wire index_pulse = ...; // Assume an external signal for index pulse detection

  // Floppy drive control state machine
  always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
      state <= 3'b000; // Reset state
      sector_index <= 7'b0000000;
      motor_on <= 1'b0;
    end else begin
      case (state)
        3'b000: begin // Idle state
          // Wait for commands from PCIe controller
          if (read_gate) begin
            state <= 3'b001; // Move to read state
          end else if (write_gate) begin
            state <= 3'b010; // Move to write state
          end
        end
        3'b001: begin // Read state
          // Read data from floppy drive and update sector_buffer
          // Update read_done signal accordingly
          state <= 3'b000; // Return to idle state
        end
        3'b010: begin // Write state
          // Write data to floppy drive from sector_buffer
          // Update write_done signal accordingly
          state <= 3'b000; // Return to idle state
        end
      endcase
    end
  end

  // Interface with sector data
  always @(posedge clk) begin
    if (state == 3'b001) begin
      // Provide data from sector_buffer during read
      sector_data_out <= sector_buffer[sector_index];
    end else begin
      sector_data_out <= 16'b0;
    end
  end

  // Motor control logic
  always @(posedge clk) begin
    if (state != 3'b000) begin
      motor_on <= 1'b1; // Turn on motor during read or write operations
    end else begin
      motor_on <= 1'b0;
    end
  end

  // Additional control signals
  assign read_gate = (state == 3'b001);
  assign write_gate = (state == 3'b010);

endmodule
