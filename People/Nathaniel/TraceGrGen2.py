# import the following lists of components from respective Drasil.SWHS modules (lists)
from ImportedData import iMods, tMods, funcReqs, assumptions, likelyChgs, unlikelyChgs, dataDefs, genDefs, ASD, RIMD, \
    TGDDIM
import pygraphviz as pgv

TraceGr = pgv.AGraph(name="TraceGrGen2", strict=False, directed=True)

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
for a in assumptions:
    TraceGr.add_node(a, color="black", shape="box", fillcolor="brown1", style="filled", label=("A: " + assumptions[a]))

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

# defining dependency relationships between components (accomplish this in Haskell using map method)
for A in ASD:
    for D in ASD[A]:
        TraceGr.add_edge(A, D, splines="tru")

for R in RIMD:
    for D in RIMD[R]:
        TraceGr.add_edge(R, D, splines="true")

for T in TGDDIM:
    for D in TGDDIM[T]:
        TraceGr.add_edge(T, D, splines="true")

TraceGr.write("TraceGrGen2.dot")
TraceGr.draw("TraceGrGen2.png", prog="dot")

# add arrow from a to b
# TraceGr.add_node('a', color="red", shape="box")
# TraceGr.add_edge('a', 'b', dir="back")  # use this to reverse direction; bottom to top
