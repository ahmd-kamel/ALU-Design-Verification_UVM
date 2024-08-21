class alu_monitor extends uvm_monitor;

    `uvm_component_utils(alu_monitor)

    function new(string name = "alu_monitor", uvm_component parent = null);
        super.new(name, parent);
    endfunction
endclass 