Xing Mei, Philippe Decaudin, Bao-Gang Hu

https://inria.hal.science/inria-00402079/document
___
- Uses Shallow Water Equations to for their Hydraulic model.
- Used 2D texture to represent height map of terrain. 
- Each cell is connected to its neighbors by a virtual pipe, see [[(1995) Dynamic Simulation of Splashing Fluids.md|this paper]]
	- Clamped outflow flux to 0 to allow GPU parallelization (Need to better understand argument for this simplification)
	- They acknowledge the need to scale flux consistently if you scale flux in one cell, they do implement that in this paper
- They use a simplified equation for sediment erosion/deposition described [[(1985) Sediment Transport Capacity of Overland Flow.md|here]]
- **Doesn't seem to account for bedrock, treats terrain at all depths the same, should try to figure out if someone has pursued bedrock simulation before**
