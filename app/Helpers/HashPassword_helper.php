<?php

function hashPassword($pass){
    return password_hash($pass, PASSWORD_BCRYPT);
}

function verifyPassword($pass, $hash){
    return password_verify($pass, $hash);
}

// verificar usuario registrado
/* if (!function_exists('verificar_usuario_registrado')) {
    function verificar_usuario_registrado()
    {
        
    }
}
 */