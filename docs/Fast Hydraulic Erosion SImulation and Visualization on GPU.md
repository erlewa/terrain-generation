Xing Mei, Philippe Decaudin, Bao-Gang Hu

https://inria.hal.science/inria-00402079/document
___
- Uses Shallow Water Equations to for their Hydraulic model.
- Used 2D texture to represent height map of terrain. 
- Each cell is connected to its neighbors by a virtual pipe, see [this paper](Dynamic%20Simulation%20of%20Splashing%20Fluids)
	- Clamped outflow flux to 0 to allow GPU parallelization (Need to better understand argument for this simplification)
	- They acknowledge the need to scale flux consistently if you scale flux in one cell, they do implement that in this paper
- They use a simplified equation for sediment erosion/deposition described [here](Sediment%20Transport%20Capacity%20of%20Overland%20Flow)
- **Doesn't seem to account for bedrock, treats terrain at all depths the same, should try to figure out if someone has pursued bedrock simulation before**