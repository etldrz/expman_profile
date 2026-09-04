"""
Profile which generates user-specified number of nodes, to be used 
in testing.
"""

import geni.portal as portal
import geni.rspec.pg as rspec

portal.context.defineParameter("n", "Number of VMs", 
                               portal.ParameterType.Interger, 1)

params = portal.context.bindParameters()

request = portal.cntext.makeRequestRSpec()

if params.n < 1 or params.n > 8:
    portal.context.reportError(
            portal.ParameterError(
                "Bad number of VMs; please choose between 1 and 8", ["n"]))


portal.context.verifyParameters()

for i in range(params.n):
    node = request.XenVM("node" + str(i))
    node.addService(rspec.Execute(
        shell="bash", 
        command="/local/repository/setup.sh"))

portal.context.printRequestRSPec()
