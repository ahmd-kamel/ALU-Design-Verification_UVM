class alu_scoreboard extends uvm_scoreboard;

    `uvm_component_utils(alu_scoreboard)

    function new(string name = "alu_scoreboard", uvm_component parent = null);
        super.new(name, parent);
    endfunction
endclass