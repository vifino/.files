# Load all scripts in this dir.
stype = "cli"

import lldb
import os

def __lldb_init_module(debugger, internal_dict):
    fp = os.path.realpath(__file__)
    dirp = os.path.dirname(fp)
    selfn = os.path.basename(__file__)

    for file in os.listdir(dirp):
        if (not (file.startswith(stype + "_") or file.startswith("all_"))) or file.startswith("loadscripts_" + stype):
            continue

        subcmd = ""
        if file.endswith('.py'):
            subcmd = "script import "
        elif file.endswith('.lldb'):
            subcmd = "source -s true -e true "
        else:
            continue

        lldb.debugger.HandleCommand("command " + subcmd + dirp + "/" + file)
