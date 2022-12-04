---
layout: page
title: Data-Driven Control
description: Find controllers for all plants that are consistent with the observed data.
img:
importance: 2 
tag: ddc
category: active
---

Data-Driven Control (DDC) is a methodology that formulates controllers directly from observations without requiring a system identification step. My work in {% cite miller2022lpvqmi %} extended the Quadratic Matrix Inequality (QMI) framework towards data-driven gain-scheduled control
of Linear Parameter-Varying (LPV) systems. 

<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.html path="assets/img/param_seq_box2_horz.png" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    Stabilizing control of an LPV system given data observations. The left side highlights stabilization of the ground-truth in red, and the blue trajectories are other systems in the data consistency set. The right side samples additional parameter sequences and demonstrates stabilization.
</div>

The introduction of input and measurement noise is called the Error-in-Variables (EIV) setting, and adds a bilinearity that results in NP-hard system identification and control problems .  I helped develop a polynomial-optimization based framework to perform stabilizing and robust control of all consistent plants in the EIV setting when all noise processes are L-infinity norm bounded {% cite miller2022eiv %}. The moment-Sum-of-Squares (SOS) hierarchy is used to find a superstabilizing or quadratically stabilizing controller, where each nonnegativity constraint is posed over the set of unknown plants and unknown noise processes. A theorem of alternatives is used to eliminate the unknown noise variables and improve computational scalability. This SOS-based framework may be extended towards the control of autoregressive models with input-output data {% cite miller2022eivarx %}. 


Data-Driven techniques may also be applied to peak estimation. The data-consistency set in {% cite miller2021facial %} is modeled as a parameter-affine differential inclusion for a polytope-bounded uncertainty process. 

<div class="row">
    <div class="col-sm mt-2 mt-md-0">
        {% include figure.html path="assets/img/poly_3_observed.png" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
    <div class="col-sm mt-2 mt-md-0">
        {% include figure.html path="assets/img/poly_3_cubic_corrected.png" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    The left plot charts 100 noisy derivative observations of a 3-state cubic polynomial dynamical system. The right plots a series of trajectories (cyan) compatible with data-consistent systems, as well as an upper bound (red) on the maximal vertical coordinate that any of these systems will obtain.
</div>



<div class="publications">
	<h1>Relevant Publications:</h1>
	{% bibliography -f papers -q @*[tag=ddc || tag=peakddc]* %}
  </div>
