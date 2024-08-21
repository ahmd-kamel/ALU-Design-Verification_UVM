class alu_sequence extends uvm_sequence;

    `uvm_object_utils(alu_sequence)

    function new(string name = "alu_sequence");
        super.new(name);
    endfunction
endclass