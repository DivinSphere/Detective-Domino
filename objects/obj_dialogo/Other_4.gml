if (variable_struct_exists(global.dialogos_vistos, id)) {
    instance_destroy();
    exit;
}
else{
var _meu_id = string(id);
struct_set(global.dialogos_vistos, _meu_id, true);
}