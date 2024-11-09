---
layout: blog
title: "Reader's Digest of Optimal Monetary Policy in Production Networks"
date: 2024-11-06
tags: [Research, AI, Econometrics, Readers Digest]
---

*Editors Note: This summmary was created using Claude AI. Please send me any comments or corrections.*

[*La'O and Tahbaz-Salehi (Econometrica, 2022)*](https://www.econometricsociety.org/publications/econometrica/2022/05/01/optimal-monetary-policy-production-networks)


**Key Takeaway**: When industries buy and sell from each other in a production network, central banks need to consider not just how sticky prices are in each industry, but also where industries sit in the supply chain. The optimal monetary policy puts more weight on stabilizing prices in industries that are upstream (early in production chains), have sticky prices themselves, and sell to other industries with sticky prices.

## What the Paper Does

La'O and Tahbaz-Salehi examine how central banks should conduct monetary policy when the economy has multiple industries that trade inputs with each other. They start with a model where firms in different industries:
- Buy inputs from other industries 
- Set prices under incomplete information about economic conditions
- Have different degrees of price stickiness
- Are connected in a production network

The authors derive what price index the central bank should target to maximize welfare. Unlike standard one-sector models where price stability is optimal, they show that with production networks, the central bank generally cannot achieve the ideal (flexible price) outcome.

## Why This Matters for the Literature

This paper bridges two important streams of research:

1. The New Keynesian literature on optimal monetary policy, which typically uses single-sector models where price stability is optimal
2. The growing literature on production networks, which shows how industry linkages matter for how shocks propagate

The key contribution is showing that production networks fundamentally change optimal monetary policy. The central bank needs to consider:
- An industry's position in the production chain
- How price stickiness in one industry affects other industries through input-output relationships
- The trade-off between stabilizing prices within industries vs. between industries

## Key Result: The Optimal Price Index

The paper's core theoretical result (Theorem 2) shows that the optimal policy targets a price index where each industry's weight depends on:

1. Size - larger industries (measured by sales) get more weight
2. Price stickiness - industries with stickier prices get more weight  
3. Position in network:
   - More upstream industries get more weight
   - Industries with flexible-price suppliers but sticky-price customers get more weight

Applied to U.S. data, the authors find significant welfare gains from targeting their optimal price index versus a consumption-weighted index like CPI. However, they find that simply putting more weight on sticky-price industries approximately achieves the gains of the fully optimal policy.

This means central bankers should pay special attention to price movements in:
- Large upstream industries (like raw materials)
- Industries that are both sticky-priced and important input suppliers
- Service sectors that are both sticky-priced and widely used as inputs

The paper's findings help explain why central banks often focus on "core" price measures that put more weight on sticky-price sectors, while suggesting refinements based on production network position.


## Why Was This Hard?

The technical challenge was combining two complex frameworks:

1. **Network Equilibrium**: Production networks create intricate strategic interactions - when one firm changes prices, it affects costs for all downstream firms. With n industries, you need to track n² possible interactions.

2. **Nominal Rigidities**: Price stickiness creates a role for monetary policy. But with networks, each firm's optimal price depends on their expectations about:
   - Their own costs
   - Their customers' demand
   - Their suppliers' prices
   
The authors solve this by recasting the problem as a "beauty contest" game over networks, where firms must coordinate prices while facing different information sets.

## Limitations and Where It Might Not Apply

1. **Static Framework**: The model is static, so it can't address dynamics like inflation persistence or interest rate policy. It's best for understanding long-run targeting, not quarter-to-quarter decisions.

2. **Efficiency Assumption**: The model assumes the flexible-price equilibrium is efficient. In reality, markup variations and other distortions might create additional trade-offs for monetary policy.

3. **Information Structure**: The model uses incomplete information to generate price stickiness. While this captures similar effects to menu costs or Calvo pricing, the specific mechanism matters for some results.

4. **Measurement Challenges**: Implementing the optimal policy requires measuring:
   - Industry-level price stickiness
   - The full input-output structure
   - Position of industries in production chains
   These can be hard to measure precisely in practice.

## How to Cite and Use This Paper

This paper is useful for researchers working on:

1. **Monetary Policy Design**: Cite when arguing that central banks should consider production structure, not just price stickiness, in designing target indices.

2. **Network Effects**: Use as evidence that nominal rigidities interact with production networks to amplify shocks - sticky prices upstream matter more than downstream.

3. **Price Setting**: Reference for how strategic complementarities in price setting work through input-output linkages.

Key empirical predictions to test:
- Price changes should propagate more strongly downstream than upstream
- Industries with sticky-price customers should have more stable prices
- Monetary shocks should have larger effects on industries that are further downstream

The authors' decomposition of welfare losses into within-industry, across-industry, and output gap components provides a framework for quantifying the costs of different monetary policies in networked economies.


## Model Sketch: Optimal Monetary Policy in Production Networks

### Basic Structure

The economy has $n$ industries indexed by $i$. Each industry has:
- A unit mass of monopolistically competitive firms (indexed by $k \in [0,1]$)
- A competitive aggregator that combines firms' output into the industry good

### Production

Each firm $k$ in industry $i$ has technology:
$$y_{ik} = z_i F_i(l_{ik}, x_{i1k}, ..., x_{ink})$$

where:
- $y_{ik}$ is output
- $z_i$ is industry-specific productivity
- $l_{ik}$ is labor input
- $x_{ijk}$ is input from industry $j$
- $F_i$ is constant returns to scale

### Nominal Rigidities

Key friction: Firms set prices under incomplete information about productivity shocks.

Each firm $k$ in industry $i$:
- Observes signal $\omega_{ik}$ about the economy's state
- Sets nominal price $p_{ik}(\omega_{ik})$ based on this signal
- Cannot condition price on full state $s = (z,\omega)$

### Policy Tools

The government has two tools:
1. Industry-specific taxes $\tau_i$ (non-state-contingent)
2. Nominal aggregate demand $m(s)$ (can vary with state)

### Key Special Case

For explicit solutions, paper focuses on:
- Cobb-Douglas technologies: $F_i(l,x) = z_i l^{\alpha_i} \prod_j x_{ij}^{a_{ij}}$
- Log-normal productivity: $\log z_i \sim N(0,\delta^2\sigma^2_z)$
- Firm signals: $\omega_{ijk} = \log z_j + \epsilon_{ijk}$, $\epsilon_{ijk} \sim N(0,\delta^2\sigma^2_{ik})$

### Optimal Policy

The optimal policy targets a price index:
$$\sum_{i=1}^n \psi_i^* \log p_i = 0$$

where weights $\psi_i^*$ depend on:
- Industry's sales share ($\lambda_i$)
- Price flexibility ($\phi_i$)
- Position in network (via Leontief inverse)
- Upstream/downstream relationships

This provides a tractable framework for analyzing how network structure and nominal rigidities jointly determine optimal monetary policy.