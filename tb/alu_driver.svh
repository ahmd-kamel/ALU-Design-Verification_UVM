class alu_driver extends uvm_driver #(alu_sequence_item);

    `uvm_component_utils(alu_driver)
    function (string name = "alu_driver", uvm_component parent = null);
        super.new(name, parent);
    endfunction 
endclass