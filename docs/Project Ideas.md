# Explore Debris-Flow Direction
[[(2024) Efficient Debris-Flow Simulation for Steep Terrain Erosion|This paper]] explores debris flow based erosion. Once a debris flow has started they determine its flow direction using a randomly selected neighboring cell with the probability of any neighbor being selected based on the difference in elevation between it and the current cell. This results in  the flow, on average, following the steepest slope without axis aligned patterns. From what I have gathered this does not allow for diverging flow paths which could be a limitation.

**Project Idea: Try dispersing flow across a few, randomly selected, neighboring cells?**

## Relevant Math:
$$
𝑄_𝑤 (𝑖) = 𝑝 Δ𝑥^2 +\sum\limits_{𝑔∈𝐺(𝑖 )}(𝑤^{𝑔→𝑖}𝑄_𝑤(𝑔))
$$
Where $𝑤^{𝑔→𝑖}$ is the proportion of discharge moving from cell $g$ to cell $i$ and $\Delta{}x$ is the cell size  