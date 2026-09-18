"""
Profile which generates user-specified number of nodes, to be used 
in testing.
"""

import geni.portal as portal
import geni.rspec.pg as pg


portal.context.defineParameter("n", "Number of nodes", portal.ParameterType.INTEGER, 1)

params = portal.context.bindParameters()

request = portal.context.makeRequestRSpec()

if params.n < 1 or params.n > 8:
    portal.context.reportError(portal.ParameterError(
        "Bad number of nodes; please choose between 1 and 8", 
        ["n"]))

portal.context.verifyParameters()

for i in range(params.n):
    node = request.RawPC("node" + str(i))
    node.addService(pg.Install(url="https://mise.run", path="/local"))
    node.addService(pg.Execute(shell="bash", command="/local/repository/setup.sh"))

#link = request.LAN("lan")

portal.context.printRequestRSpec()
