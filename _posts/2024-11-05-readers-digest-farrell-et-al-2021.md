---
layout: blog
title: "Testing out a new format: Reader's Digest of Econometrica Papers [Econometrics Paper]"
date: 2024-11-06
tags: [Research, AI, Econometrics, Readers Digest]
---

Ben Golub had the idea of [summarizing technical papers (such as in Econometrica) using AI to be more easily approached by non-technical economists.](https://bsky.app/profile/bengolub.bsky.social/post/3lacwdogwti2w)  These papers were selected from the list of the [most prominent recent papers in Econometrica by Google Scholar.](https://scholar.google.com/citations?hl=en&vq=bus_economics&view_op=list_hcore&venue=G0hmswRVzmAJ.2024) First, an econometrics paper. I will also post one for [a theory paper.](https://paulgp.github.io/2024/11/06/readers-digest-galeotti-et-al-2020.html)



## Deep Neural Networks for Estimation and Inference: A Reader's Digest
[*Farrell, Liang, and Misra (Econometrica, 2021)*](https://www.econometricsociety.org/publications/econometrica/2021/01/01/deep-neural-networks-estimation-and-inference)

**Key Takeaway**: This paper proves that deep learning can be safely used as a first step in modern econometric analysis. If you're using machine learning for things like propensity score matching or predicting treatment effects, you can now confidently use deep neural networks and still get valid statistical inference in your second stage analysis. This fills a crucial gap, as while deep learning has shown impressive empirical performance, economists have been hesitant to adopt it without theoretical guarantees.

### What Do The Researchers Do?

The authors provide formal mathematical proof that deep neural networks can be used as a valid first-step estimator in two-stage econometric procedures. In simpler terms:

1. They show that deep neural networks converge to the true function at a rate fast enough to allow valid inference in the second stage
2. They prove this for the most common type of neural network (multilayer perceptron with ReLU activation)
3. They demonstrate how this works in practice with a marketing application where they estimate individual treatment effects of catalog mailings

The results cover both standard regression problems and classification tasks like logistic regression, making them broadly applicable to common econometric settings.

### Why Does This Matter?

This paper matters for three key reasons:

1. **Bridging Theory and Practice**: Deep learning has shown remarkable empirical success, but economists have been reluctant to adopt it without theoretical foundations. This paper provides those foundations.

2. **Validation of Current Methods**: Many researchers are already using neural networks in applications. This paper proves that such applications can be theoretically valid, providing retroactive justification for existing work.

3. **Extension of Machine Learning Literature**: Previous work had established similar results for other methods (LASSO, random forests), but deep learning had remained a notable gap in the literature.

### Key Result: Theorem 1

The paper's most important result is Theorem 1, which shows that multilayer perceptron networks achieve a convergence rate of approximately n^(-β/(β+d))[^1], where:
- n is the sample size
- β measures how smooth the true function is
- d is the number of input variables

This rate is fast enough to ensure that when you use the neural network predictions in a second stage (e.g., for treatment effect estimation), your standard errors and confidence intervals will still be valid.

The authors demonstrate this in practice with a retail catalog mailing study, where they use deep learning to estimate individual treatment effects. The method performs as well as or better than traditional approaches, while maintaining valid statistical inference.

### Practical Implications

For applied researchers, this paper means you can:
- Use deep learning in your first-stage predictions
- Still get valid standard errors and confidence intervals in your second stage
- Not worry about neural network architecture details beyond basic setup
- Apply these results to both continuous outcomes (regression) and binary outcomes (classification)

The key constraint is that this only applies to two-stage procedures where the neural network is used in the first stage. The results don't automatically extend to using neural networks for direct causal inference.

## Further Discussion on "Deep Neural Networks for Estimation and Inference"

### Why Was This Hard?

The theoretical validation of deep neural networks for econometric inference faced several key challenges:

1. **Unbounded Parameters**: Traditional statistical theory typically requires bounded parameters, but modern deep learning works best when network weights are allowed to be unbounded. The authors developed new mathematical techniques to handle this reality of how neural networks are actually used.

2. **Non-Smooth Activation**: Modern neural networks use ReLU (Rectified Linear Unit) activation functions, which are not smooth - they have a "kink" at zero. Most classical statistical theory relies on smooth functions, requiring new theoretical approaches.

3. **Depth Complexity**: Each layer of a neural network transforms the data in non-linear ways, making it extremely difficult to track how errors propagate through the network. Previous work mostly focused on shallow networks (1-2 layers) because they were mathematically tractable.

4. **Multiple Sources of Error**: The analysis needed to account for both approximation error (how well can a neural network approximate the true function?) and estimation error (how well can we estimate the network parameters?), while ensuring both are controlled enough for valid second-stage inference.

### Where Would This Not Do Well?

The authors' results have important limitations:

1. **Small Sample Sizes**: The convergence rates require large samples to kick in. For small datasets (hundreds of observations), traditional methods might be more reliable.

2. **Very High Dimensional Settings**: When the number of features (d) is large relative to sample size, the convergence rate becomes very slow. In such cases, methods that impose more structure (like LASSO) might work better.

3. **Direct Causal Effects**: The results only cover using neural networks as a first-step estimator. They don't automatically extend to using neural networks for direct estimation of causal effects.

4. **When Interpretability is Crucial**: While the predictions can be used reliably, the internal workings of the neural network remain a "black box". In settings where you need to explain exactly how each variable affects the outcome, simpler models might be preferred.


### When to Cite this paper:
1. **Methodological Justification**: "We use deep neural networks for our first-stage estimates, following Farrell et al. (2021) who establish the theoretical validity of this approach for subsequent inference."

2. **Literature Context**: "Recent work has established theoretical guarantees for machine learning methods in econometrics, including LASSO (Belloni et al., 2014), random forests (Wager and Athey, 2018), and deep neural networks (Farrell et al., 2021)."

3. **Specific Applications**: "For propensity score estimation, we implement a deep neural network, which Farrell et al. (2021) show provides valid first-stage estimates for subsequent causal inference."

### When Not to Cite this paper:
- Don't cite this paper merely for using neural networks in economics
- Don't cite it for general machine learning applications without inference
- Don't cite it for direct causal effect estimation using neural networks

The paper is best positioned as part of the broader literature on valid inference after machine learning, specifically addressing the theoretical gaps for deep learning in econometric applications.


[^1] Understanding β (Beta) and d in Practice

## What These Numbers Mean

- **d**: Number of features/covariates in your data
- **β**: Smoothness parameter of the true function (roughly, how many continuous derivatives it has)

## Typical Values in Economic Applications

### For d (dimensions):
- **Small**: d = 4-10 
  - Example: Basic wage regression (age, education, experience, gender)
  - Traditional RCT with few controls

- **Medium**: d = 20-50
  - Example: Consumer choice models
  - Policy evaluation with demographic controls
  
- **Large**: d = 100-500
  - Example: The paper's retail catalog application (d ≈ 150)
  - Modern marketing applications with customer features

### For β (smoothness):
- **β = 1**: Function is continuous but can have sharp turns
  - Example: Simple threshold effects in policy
  
- **β = 2**: Function is continuously differentiable
  - Example: Most standard economic relationships
  - This is commonly assumed in practice
  
- **β = 4**: Function is very smooth
  - Example: Well-behaved utility functions
  - Often used in theoretical work

## What This Means in Practice

Let's look at convergence rate n^(-β/(β+d)) with some examples:

1. **Simple Case**: β = 2, d = 5
   - Rate ≈ n^(-2/7) ≈ n^(-0.29)
   - Pretty good! Usable with moderate sample sizes

2. **Marketing Application**: β = 2, d = 150
   - Rate ≈ n^(-2/152) ≈ n^(-0.013)
   - Much slower - needs very large samples
   - This is why big data applications work well

3. **Best Case**: β = 4, d = 3
   - Rate ≈ n^(-4/7) ≈ n^(-0.57)
   - Close to parametric rate of n^(-0.5)
   - Rare in practice

## Rule of Thumb
- If d < 20 and β ≥ 2, traditional sample sizes (n = 1000-5000) are often sufficient
- If d > 100, you typically need n > 100,000 for reliable results
- When d is large relative to n, consider dimension reduction or feature selection first

This illustrates why the method works well in the paper's retail application (large n, moderate d) but might struggle in settings with many features and smaller samples.