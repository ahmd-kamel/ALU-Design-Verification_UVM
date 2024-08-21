class alu_env extends uvm_env;
    `uvm_component_utils(alu_env)

    function (string name = "alu_env", uvm_component parent = null);
        super.new(name, parent);
    endfunction
endclass