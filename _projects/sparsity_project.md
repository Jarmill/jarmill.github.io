---
layout: page
title: Sparsity
description: Leverage sparse structure in order to render large-scale semidefinite programs tractable
img: 
importance: 2
category: inactive
---


Interior-point methods for Semidefinite Programming (SDP) scale in a polynomial manner with the size of the largest Positive Semidefinite (PSD) block and the number of affine constraints (when solving up to epsilon-optimality). This complexity may be reduced if the problem instance contains structure, such as symmetry or sparsity.

### Decomposed Structured Subsets

Structured subset approximations are cones that inner/outer approximate the PSD cone to generate upper/lower bounds on the SDP optimum. An example of a structured subset for a minimization objective is the cone of diagonally dominant matrices (inner/upper bound) or its dual (outer/lower bound). Our observation in [] is twofold: imposition of a structured subset destroys sparse structure in an SDP, and requiring clique-submatrices are in a structured subset yields a broader set of solutions (more accurate bounds) as compared to requiring the original matrix is in thr subset. 


[images]

This scheme allows for mixing cones: intractably large blocks can be approximated while small PSD blocks remain PSD. 

[cone mix image] 

Multiple kinds of structure can be combined together. For a system with simultaneous symmetry and sparsity properties, applying the symmetric then sparse decomposition before approximating yields the tightest bounds to the SDP. 

[symmetry image]

### Rank Minimization

Our work in {% cite miller2019rank %} aimed to solve SDP that contained rank-constraints. Rank-constraints and rank-minimization problems are NP-hard, but there exist convex heuristics that attempt to approximate the optimal solution. On their own, rank-constrained SDPs scale in an exponential manner with the size of the largest rank-constrained PSD block. After utilizing a minimum-rank completion, the complexity now scales in an exponential manner with the size of the largest rank-constrained clique. This phenomenon may be used to construct regularizers (reweighted trace heuristic) based on the sum of clique matrices. An application of this method is in Subspace Clustering, which is a highly sparse polynomial optimization problem that classifies noisy points into subspaces. We developed a more efficient chordal extension to reduce the complexity of subspace clustering, and applied it to solve clustering and system identification problems.

<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.html path="assets/img/SSC_successful-1.png" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.html path="assets/img/SSC-sparsity.png" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    Left: An instance of Subspace Clustering. Right: Chordal extensions associated with the Subspace Clustering problem. Our scheme scales exponentially with dimension and jointly linearly with the number of points and clusters.
</div>


<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.html path="assets/img/SSC_rank-1.png" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    All rank-relevant submatrices must be rank-1 in order to have a valid subspace clustering (rank-1-ness = ratio of largest eigenvalue to sum of eigenvalues).
</div>




In progress (default text below)

Every project has a beautiful feature showcase page.
It's easy to include images in a flexible 3-column grid format.
Make your photos 1/3, 2/3, or full width.

To give your project a background in the portfolio page, just add the img tag to the front matter like so:

    ---
    layout: page
    title: project
    description: a project with a background image
    img: /assets/img/12.jpg
    ---

<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.html path="assets/img/1.jpg" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.html path="assets/img/3.jpg" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.html path="assets/img/5.jpg" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    Caption photos easily. On the left, a road goes through a tunnel. Middle, leaves artistically fall in a hipster photoshoot. Right, in another hipster photoshoot, a lumberjack grasps a handful of pine needles.
</div>
<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.html path="assets/img/5.jpg" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    This image can also have a caption. It's like magic.
</div>

You can also put regular text between your rows of images.
Say you wanted to write a little bit about your project before you posted the rest of the images.
You describe how you toiled, sweated, *bled* for your project, and then... you reveal it's glory in the next row of images.


<div class="row justify-content-sm-center">
    <div class="col-sm-8 mt-3 mt-md-0">
        {% include figure.html path="assets/img/6.jpg" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
    <div class="col-sm-4 mt-3 mt-md-0">
        {% include figure.html path="assets/img/11.jpg" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    You can also have artistically styled 2/3 + 1/3 images, like these.
</div>


The code is simple.
Just wrap your images with `<div class="col-sm">` and place them inside `<div class="row">` (read more about the <a href="https://getbootstrap.com/docs/4.4/layout/grid/">Bootstrap Grid</a> system).
To make images responsive, add `img-fluid` class to each; for rounded corners and shadows use `rounded` and `z-depth-1` classes.
Here's the code for the last row of images above:

{% raw %}
```html
<div class="row justify-content-sm-center">
    <div class="col-sm-8 mt-3 mt-md-0">
        {% include figure.html path="assets/img/6.jpg" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
    <div class="col-sm-4 mt-3 mt-md-0">
        {% include figure.html path="assets/img/11.jpg" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
```
{% endraw %}

<div class="publications">
	<h1>Relevant Publications:</h1>
	{% bibliography -f papers -q @*[tag=sparsity]* %}
  </div>