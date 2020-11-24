module Drasil.Truss.Concepts where

import Language.Drasil
import Data.Drasil.IdeaDicts (physics)

truss :: CI
truss = commonIdeaWithDict "truss" (pn "Truss") "Truss" [physics]

compression, forceEquilibrium, joint, methodofJoint, moment, momentEquilibrium, pinSupport, reactionForce, rollerSupport, tension :: ConceptChunk
compression       = dcc "compression" (nounPhraseSP "compression") "the force that squeezes materials together"
forceEquilibrium  = dcc "forceEquilibrium" (nounPhraseSP "forceEquilibrium") "a body is in force equilibrium if the sum of all the forces acting on the body is zero"
joint             = dcc "joint" (nounPhraseSP "joint") "a place where two trusses are connected"
methodofJoint     = dcc "methodofJoint" (nounPhraseSP "methodofJoint") "a way to find unknown forces in a truss structure. The principle behind this method is that all forces acting on a joint must add to zero"
moment            = dcc "moment" (nounPhraseSP "moment") "moment of a force, also called torque, is the tendency to cause a body to rotate about a specific point or axis"
momentEquilibrium = dcc "momentEquilibrium" (nounPhraseSP "momentEquilibrium") "a body is in moment equilibrium if the sum of all the moments of all the forces acting on the body is zero"
pinSupport        = dcc "pinSupport" (nounPhraseSP "pinSupport") "a kind of structural support can have both a horizontal x direction force and a vertical y direction force"
reactionForce     = dcc "reactionForce"     (nounPhraseSP "reactionForce") "an external force on a body which is contributed by its supports or connections"
rollerSupport     = dcc "rollerSupport"   (nounPhraseSP "rollerSupport")  "a kind of structural support can only have a vertical y direction force"
tension           = dcc "tension" (nounPhraseSP "tension") "the force that pulls materials apart"