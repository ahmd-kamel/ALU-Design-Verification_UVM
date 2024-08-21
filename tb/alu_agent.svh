class alu_agent extends uvm_agent;

    `uvm_component_utils(alu_agent)

    function (string name = "alu_agent", uvm_component parent = null);
        super.new(name, parent);
    endfunction
endclass 