set_global_assignment -entity "Sopc_Cap" -library "lib_Sopc_Cap" -name IP_TOOL_NAME "Qsys"
set_global_assignment -entity "Sopc_Cap" -library "lib_Sopc_Cap" -name IP_TOOL_VERSION "18.0"
set_global_assignment -entity "Sopc_Cap" -library "lib_Sopc_Cap" -name IP_TOOL_ENV "Qsys"
set_global_assignment -library "lib_Sopc_Cap" -name SPD_FILE [file join $::quartus(sip_path) "../Sopc_Cap.spd"]
set_global_assignment -library "lib_Sopc_Cap" -name MISC_FILE [file join $::quartus(sip_path) "../../Sopc_Cap.qsys"]

set_global_assignment -library "lib_Sopc_Cap" -name MISC_FILE [file join $::quartus(sip_path) "Sopc_Cap.v"]
