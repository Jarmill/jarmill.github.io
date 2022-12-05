---
layout: page
title: Sparsity
description: Leverage sparse structure in order to render large-scale semidefinite programs tractable
img: 
importance: 2
category: inactive
---


Interior-point methods for Semidefinite Programming (SDP) scale in a polynomial manner with the size of the largest Positive Semidefinite (PSD) block and the number of affine constraints (when solving up to epsilon-optimality). This complexity may be reduced if the problem instance contains structure, such as symmetry or sparsity. The cost and all constraints of an SDP with symmetry are invariant under group actions. An SDP has sparse structure if there exist elements which are not active in the cost nor any constraint matrix: their only function is to ensure that the matrix is PSD.

### Decomposed Structured Subsets

Structured subset approximations are cones that inner/outer approximate the PSD cone to generate upper/lower bounds on the SDP optimum. An example of a structured subset for a minimization objective is the cone of diagonally dominant (DD) matrices (inner/upper bound) or its dual (outer/lower bound). Our observation in {% cite miller2021decomposed %} is twofold: imposition of a structured subset destroys sparse structure in an SDP, and requiring clique-submatrices are in a structured subset yields a broader set of solutions (more accurate bounds) as compared to requiring the original matrix is in the subset. 


The below figures visualize an affine slice of a spectahedron involving a PSD-completable matrix constraint of size 4x4, with cliques of size 2x2 and 3x3. The black region is the slice of the PSD set. Imposing that the 4x4 PSD-completable matrix is in a structured subset (resp. DD or scaled DD) is stricter than forcing its cliques to be in the same structured subset.
<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.html path="assets/img/clean_dd_cdd.png" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.html path="assets/img/clean_sdd_csdd.png" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    Left: The red feasible set has the 4x4 block DD. The blue superset forces the 2x2 and 3x3 cliques to be DD. Right: The yellow set is 4x4 scaled DD, and the brown superset has its cliques scaled DD.
</div>

This scheme allows for mixing cones: intractably large blocks can be approximated while small PSD blocks remain PSD.

<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.html path="assets/img/clean_dd_psd.png" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.html path="assets/img/clean_psd_dd.png" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    Left: The green set has the 2x2 clique PSD while the 3x3 clique is DD. Right: The orange set has the 2x2 clique DD while the 3x3 clique is PSD.
</div>

Multiple kinds of structure can be combined together. For a system with simultaneous symmetry and sparsity properties, applying the symmetric then sparse decomposition before approximating yields the tightest bounds to the SDP. 

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


<div class="publications">
	<h1>Relevant Publications:</h1>
	{% bibliography -f papers -q @*[tag=sparsity]* %}
  </div>