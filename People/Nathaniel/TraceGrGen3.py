from ImportedData2 import iMods, tMods, funcReqs, assumps, likelyChgs, unlikelyChgs, dataDefs, genDefs, AD, DDD, TMD, \
    GDD, IMD, FRD
import pygraphviz as pgv

TraceGr = pgv.AGraph(name="TraceGrGen3", strict=False, directed=True, newrank=True, rankdir="BT", splines="ortho")

# adding nodes for instance models
for im in iMods:
    TraceGr.add_node(im, color="black", shape="box", fillcolor="khaki1", style="filled", label=("IM: " + iMods[im]))

# adding nodes for theory models
for tm in tMods:
    TraceGr.add_node(tm, color="black", shape="box", fillcolor="green3", style="filled", label=("TM: " + tMods[tm]))

# adding nodes for functional requirements
for fr in funcReqs:
    TraceGr.add_node(fr, color="black", shape="box", fillcolor="gainsboro", style="filled", label=("FR: " +
                                                                                                   funcReqs[fr]))

# adding nodes for assumptions
    for a in assumps:
        TraceGr.add_node(a, color="black", shape="box", fillcolor="brown1", style="filled", label=("A: " + assumps[a]),
                         rank="same")

# adding nodes for likely changes
for lc in likelyChgs:
    TraceGr.add_node(lc, color="black", shape="box", fillcolor="burlywood3", style="filled", label=("LC: " +
                                                                                                    likelyChgs[lc]))

# adding nodes for unlikely changes
for uc in unlikelyChgs:
    TraceGr.add_node(uc, color="black", shape="box", fillcolor="aquamarine2", style="filled", label=("UC: " +
                                                                                                     unlikelyChgs[uc]))

# adding nodes for data definitions
for dd in dataDefs:
    TraceGr.add_node(dd, color="black", shape="box", fillcolor="paleturquoise1", style="filled", label=("DD: " +
                                                                                                        dataDefs[dd]))

# adding nodes for general definitions
for gd in genDefs:
    TraceGr.add_node(gd, color="black", shape="box", fillcolor="lightskyblue", style="filled", label=("GD: " +
                                                                                                      genDefs[gd]))

# AD, DDD, TMD, GDD, IMD, FRD

# defining dependency relationships between components (accomplish this in Haskell using map method)
for A in AD:
    for D in AD[A]:
        TraceGr.add_edge(A, D, splines="true")

for DD in DDD:
    for D in DDD[DD]:
        TraceGr.add_edge(DD, D, splines="true")

for T in TMD:
    for D in TMD[T]:
        TraceGr.add_edge(T, D, splines="true")

for GD in GDD:
    for D in GDD[GD]:
        TraceGr.add_edge(GD, D, splines="true")

for I in IMD:
    for D in IMD[I]:
        TraceGr.add_edge(I, D, splines="true")

for F in FRD:
    for D in FRD[F]:
        TraceGr.add_edge(F, D, splines="true")

TraceGr.write("TraceGrGen3.dot")
TraceGr.draw("TraceGrGen3.png", prog="dot")
