# Small command to send GDB remote monitor commands.

import lldb

def __lldb_init_module(debugger, internal_dict):
    debugger.HandleCommand('command script add -f cli_gdb_monitor.monitor monitor -h "Sends a GDB monitor command to the gdb-remote."')

def monitor(debugger, args, exe_ctx, result, internal_dict):
    r = lldb.SBCommandReturnObject()
    debugger.GetCommandInterpreter().HandleCommand("process plugin packet monitor " + args, r)
    if r.Succeeded():
        hex = r.GetOutput().split("\n", 2)[1][11:]
        print >>result, str(bytearray.fromhex(hex).decode())
    else:
        result.SetError("Failed to send monitor command. Are you on a GDB remote?")
