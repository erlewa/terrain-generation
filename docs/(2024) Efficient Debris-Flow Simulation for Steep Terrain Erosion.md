Aryamaan Jain, Bedrich Benes, Guillaume Cordonnier

https://www-sop.inria.fr/reves/Basilic/2024/JBC24/2024_Siggraph_Debris_Flow_Author_Version.pdf
___
**CODE:** https://gitlab.inria.fr/landscapes/debrisflow
**Simulating rock/mud slide erosion on steep slopes provides more realistic ridge lines**
- Leads to the creation of erosion scars, sharp ridge lines, and fluvial deposition shapes at the base of the mountains
- Similar work was done in (1) and (2) but generated smooth and uniform terrain when applied at small scale, ie. few valleys of up to 10 km
- **Paper 7 discusses the approach I was considering**, this article argues that it limits the time scale to that of water dynamics making it more appropriate to river bed erosion than large-scale terrains
	- When considering generation of mountain ranges you need to consider tectonic uplift

- This paper builds on the work discussed [[(2023) Forming Terrains by Glacial Erosion |here]]
	- Existing approach for fluvial errosion failed to accuratley erode the steep cliffs left after glaciers receded
	- Original paper proposed first empirical approximation for debris flow simulation, this paper proposes method based on geomorphology
	- **Maybe my project could be combining the work of these two papers?**

- Uplift, U, is used to account for effects of tectonics on mountain formation
	- Directly increases elevation of bedrock layer
$$
\begin{aligned}
\frac{𝜕𝑏}{𝜕𝑡} &= U ; \\
\\
\frac{𝜕𝑠}{𝜕𝑡} &= F^+ + H^+ \\
\\
\frac{𝜕𝑑}{𝜕𝑡} &= D^+
\end{aligned}
$$
- Paper proposes model to handle debris flow and fluvial errosion together
- **Debris Flow:**
	- Use a Coulomb criterion to determine when a debris flow occurs
	- Once a debris flow is triggered treat it as a fluid and handle errosion over surfaces that it flows over
	- Determine deposition based off the slope, once you get to 0 stop depositing
	- Direction is semi random but probability of neighbouring cell being selected to recive debris is based on the difference in elevation between it and the current cell leading the flow to generally follow the steepest slope without axis aligned patterns, **Project Idea: try dispersing flow across a few neighboring cells with amount based on some kind of weight?**


## Similar Papers
(1) [[(2016) Large Scale Terrain Generation from Tectonic Uplift and Fluvial Erosion]]
(2) [[(2023) Large-scale Terrain Authoring through Interactive Erosion Simulation]]


(3) [[(1997) The Physics of Debris Flows]]
(4) [[(2023) Sediment controls on the transition from debris flow to fluvial channels in steep mountain ranges]]

(5) [[(2019) A Review of Digital Terrain Modeling]]
(6) [[(2007) Animating Corrosion and Erosion]]

(7) [[(1993) Landscapes Synthesis Achieved through Erosion and Deposition Process Simulation]]
(8) [[(2022) Steady-state forms of channel profiles shaped by debris flow and fluvial processes]]

(9) [[(2001) Layered Data Representation for Visual Simulation of Terrain Erosion]]
