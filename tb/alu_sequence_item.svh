class alu_sequence_item extends uvm_sequence_item;

    `uvm_object_utils(alu_sequence_item)

    function new(string name = "alu_sequence_item");
        super.new(name);
    endfunction
endclass