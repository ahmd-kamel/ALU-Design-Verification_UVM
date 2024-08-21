class alu_subscriber extends uvm_subscriber;

    `uvm_component_utils(alu_subscriber)

    function new(string name = "alu_subscriber", uvm_component parent = null);
        super.new(name, parent);
    endfunction
endclass