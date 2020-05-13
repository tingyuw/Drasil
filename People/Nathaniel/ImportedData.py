# import the following lists of components from respective Drasil.SWHS modules (lists)

iMods = {"im1": "eBalanceOnWtr", "im2": "eBalanceOnPCM", "im3": "heatEInWtr", "im4": "heatEInPCM"}  # instance models
tMods = {"tm1": "consThermE", "tm2": "senseHtE", "tm3": "latentHtE", "tm4": "nwtnCooling"}  # theory models
funcReqs = {"fr1": "inputQuantities", "fr2": "findMass", "fr3": "checkWithPhysConsts", "fr4": "outputInputDerivVals",
            "fr5": "calcTempWtrOverTime", "fr6": "calcTempPCMOverTime", "fr7": "calcChgHeatEnergyWtrOverTime",
            "fr8": "calcChgHeatEnergyPCMOverTime", "fr9": "verifyEnergyOutput", "fr10": "calcPCMMeltBegin",
            "fr11": "calcPCMMeltEnd"}  # functional requirements
assumptions = {"as1": "assumptTEO", "as2": "assumpHTCC", "as3": "assumpCWTAT", "as4": "assumpTPCAV",
               "as5": "assumpDWPCoV", "as6": "assumpSHECoV", "as7": "assumpLCCCW", "as8": "assumpTHCCoT",
               "as9": "assumpTHCCoL", "as10": "assumpLCCWP", "as11": "assumpCTNOD", "as12": "assumpSITWP",
               "as13": "assumpPIS", "as14": "assumpWAL", "as15": "assumpPIT", "as16": "assumpNIHGBWP",
               "as17": "assumpVCMPN", "as18": "assumpNGSP", "as19": "assumpAPT", "as20": "assumpVCN"}  # assumptions
likelyChgs = {"lc1": "likeChgUTP", "lc2": "likeChgTCVOD", "lc3": "likeChgTCVOL", "lc4": "likeChgDT",
              "lc5": "likeChgDITPW", "lc6": "likeChgTLH"}  # likely changes
unlikelyChgs = {"uc1": "unlikeChgWPFS", "uc2": "unlikeChgNIHG", "uc3": "unlikeChgNGS"}  # unlikely changes

# FIXME cross-reference definitions with SWHS SRS, ensuring they are correct
dataDefs = {"dd1": "balanceDecayRate", "dd2": "balanceDecayTime", "dd3": "balanceSolidPCM", "dd4": "balanceLiquidPCM",
            "dd5": "ddHtFusion", "dd6": "ddMeltFrac", "dd7": "aspRat"}  # data definitions
genDefs = {"gd1": "rocTempSimp", "gd2": "htFluxWaterFromCoil", "gd3": "htFluxPCMFromWater"}  # general definitions

# dependents' dictionaries (maps) format: "CompName": [Dependents]
# assumptions dependents
ASD = {"as1": ["tm1"], "as2": ["tm4"], "as3": ["gd1", "im1", "im2"], "as4": ["gd1", "im1", "im2", "lc1"],
       "as5": ["gd1"], "as6": ["gd1"], "as7": ["gd2"], "as8": ["gd2", "lc2"], "as9": ["im1", "lc3"], "as10": ["gd3"],
       "as11": ["im1", "lc4"], "as12": ["im1", "im2", "lc5"], "as13": ["im2", "im4"], "as14": ["im1", "im3", "uc1"],
       "as15": ["im1", "lc6"], "as16": ["im1", "im2", "uc2"], "as17": ["im2"], "as18": ["im2", "im4", "uc1", "uc3"],
       "as19": ["im1", "im3"], "as20": ["fr2"]}
# requirements/instance model dependents
RIMD = {"im1": ["im2", "fr4", "fr5"], "im2": ["im1", "im4", "fr4", "fr6", "fr10", "fr11"], "im3": ["fr7", "fr9"],
        "im4": ["im2", "fr8", "fr9"], "fr1": ["im1", "im2", "im3", "im4", "fr2", "fr4"], "fr2": ["im1", "im2", "im3",
                                                                                                 "im4", "fr4"]}
# theory/general and data definitions/instance models dependents
TGDDIM = {"tm1": ["gd1"], "tm2": ["im3", "im4"], "tm3": ["tm2", "im4"], "tm4": ["dd1", "dd2"], "gd1": ["im1", "im2"],
          "gd2": ["tm4"], "gd3": ["tm4"], "dd1": ["im1"], "dd2": ["im1", "im2", "im4"], "dd7": ["dd8", "im4"],
          "dd8": ["im2", "im4"]}
