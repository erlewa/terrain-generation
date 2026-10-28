Peter Holmgren

https://onlinelibrary.wiley.com/doi/epdf/10.1002/hyp.3360080405?saml_referrer
___
- Using a grid based elevation model limits the number of flow directions out of a cell to eight, this paper seeks to provide a "computationally simple distribution function, where the converging nature can be altered" 
- Ways to store elevation data:
	- Grid Based models: You know the elevation at the center of each cell
	- Triangular Irregular Network (TIN): Irregular point data
	- Contour Models: Elevation Isolines at certain intervals
- Method refereed to by [[(2024) Efficient Debris-Flow Simulation for Steep Terrain Erosion|debris flow]] paper originated in [[(1991) The Prediction of Hillslope Flow Paths for Distributed Hydrological Modelling Using Digital Terrain Models|this paper]]
	- Flow distributed proportionally to the slope gradient in each direction
	- Paper states these methods seem to have been designed arbitrarily
	- **Paper concludes that his method results in a flow pattern that is too smoothed, advocates for a middle ground between single direction and all direction which is what I was leaning towards**