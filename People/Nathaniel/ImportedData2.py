# import the following lists of components from respective Drasil.SWHS modules (dictionaries/maps)

# instance models
iMods = {"im1": "eBalanceOnWtr", "im2": "eBalanceOnPCM", "im3": "heatEInWtr", "im4": "heatEInPCM"}
# theory models
tMods = {"tm1": "consThermE", "tm2": "senseHtE", "tm3": "latentHtE", "tm4": "nwtnCooling"}
# functional requirements
funcReqs = {"fr1": "inputVals", "fr2": "findMass", "fr3": "chkInputPhysConstr", "fr4": "outputInputDerivedVals",
            "fr5": "calcTempWtrOverTime", "fr6": "calcTempPCMOverTime", "fr7": "calcChgHtEWtrOverTime",
            "fr8": "calcChgHtEPCMOverTime", "fr9": "verifyEOutputConsE", "fr10": "calcPCMMeltBeginTime",
            "fr11": "calcPCMMeltEndTime"}
# assumptions
assumps = {"a1": "thermEOnly", "a2": "heatTransCoeffsConst", "a3": "constWtrTempAcrossTank",
           "a4": "tempPCMConstAcrossVol", "a5": "densityWtrPCMConstOverVol", "a6": "specHeatEConstOverVol",
           "a7": "nwtnLawConvCoolCoilWtr", "a8": "tempHeatCoilConstOverTime", "a9": "tempHeatCoilConstOverLength",
           "a10": "lawConvCoolWtrPCM", "a11": "chrgingTankNoTempDischrg", "a12": "sameInitialTempWtrPCM",
           "a13": "PCMInitiallySolid", "a14": "wtrAlwaysLiquid", "a15": "perfectInsulationTank",
           "a16": "noInternalHeatGenByWtrPCM", "a17": "volChgMeltingPCMNegligible", "a18": "noGaseousStatePCM",
           "a19": "atmosPressureTank", "a20": "volCoilNegligible"}
# likely changes
likelyChgs = {"lc1": "uniformTempPCM", "lc2": "tempCoilVarOverDay", "lc3": "tempCoilVarOverLength",
              "lc4": "dischrgingTank", "lc5": "diffInitialTempsPCMWater", "lc6": "tankLoseHeat"}
# unlikely changes
unlikelyChgs = {"uc1": "wtrPCMFixedStates", "uc2": "noInternalHeatGen", "uc3": "noGaseousState"}
# data definitions
dataDefs = {"dd1": "balanceDecayRate", "dd2": "balanceDecayTime", "dd3": "balanceSolidPCM", "dd4": "balanceLiquidPCM",
            "dd5": "htFusion", "dd6": "meltFrac", "dd7": "aspectRatio"}
# generation definitions
genDefs = {"gd1": "rocTempSimp", "gd2": "htFluxWaterFromCoil", "gd3": "htFluxPCMFromWater"}

# dependents' dictionaries (maps) format: "CompName": [Dependents]
# assumptions dependents
AD = {"a1": ["tm1"], "a2": ["tm4"], "a3": ["gd1", "im1", "im2"], "a4": ["gd1", "im1", "im2", "lc1"], "a5": ["gd1"],
      "a6": ["gd1"], "a7": ["gd2"], "a8": ["gd2", "lc2"], "a9": ["im1", "lc3"], "a10": ["gd3"], "a11": ["im1", "lc4"],
      "a12": ["a11", "im1", "im2", "lc5"], "a13": ["im2", "im4"], "a14": ["im1", "im3", "uc1"], "a15": ["im1", "lc6"],
      "a16": ["im1", "im2", "uc2"], "a17": ["im2"], "a18": ["im2", "im4", "uc1", "uc3"], "a19": ["im1", "im3"],
      "a20": ["fr2"]}
# data definitions dependents
DDD = {"dd1": ["im1", "fr4"], "dd2": ["im1", "fr4"], "dd3": ["im2", "fr4"], "dd4": ["im2", "fr4"],
       "dd5": ["dd6", "im4"], "dd6": ["tm3", "im2"], "dd7": []}
# theory models dependents
TMD = {"tm1": ["gd1"], "tm2": ["im3", "im4"], "tm3": ["tm2", "im4"], "tm4": ["gd2", "gd3"]}
# general definitions dependents
GDD = {"gd1": ["gd1", "im1", "im2"], "gd2": ["im1"], "gd3": ["im1", "im2"]}
# instance models dependents
IMD = {"im1": ["a16", "uc2", "im1", "im2", "fr2", "fr5"], "im2": ["a16", "a18", "uc2", "uc3", "im1", "fr2", "fr6",
       "fr10", "fr11"], "im3": ["fr2", "fr7"], "im4": ["a18", "uc3", "im2", "fr2", "fr8"]}
# functional requirements dependents
FRD = {"fr1": ["fr2", "fr4"], "fr2": ["fr4"]}

# subgraph data chunks
# subgraph 1
SG1 = {}
