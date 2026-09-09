"""
Profile which generates user-specified number of nodes, to be used 
in testing.
"""

import geni.portal as portal
import geni.rspec.pg as pg

pc = portal.Context()

pc.defineParameter("n", "Number of nodes", 
                   portal.ParameterType.INTEGER, 1)

params = pc.bindParameters()

request = pc.makeRequestRSpec()

if params.n < 1 or params.n > 8:
    pc.reportError(portal.ParameterError(
        "Bad number of nodes; please choose between 1 and 8", 
        ["n"]))

pc.verifyParameters()

for i in range(params.n):
    node = request.RawPC("node" + str(i))
    node.addService(
            pg.Execute(shell="sh", 
                       command="/local/repository/setup.sh"))

#link = request.LAN("lan")

pc.printRequestRSpec(request)
