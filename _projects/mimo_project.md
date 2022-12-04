---
layout: page
title: MIMO Identification
description: System identification of multi-input multi-output (MIMO) linear system through the use of active set methods
img:
importance: 3
category: inactive
---

This project performed multi-input multi-output (MIMO) system identification using randomized active-set methods. The system fidelity term may incorporate time-domain and frequency-domain data. A MIMO-aware regularizer was developed by an L1/Linfinity group-lasso strategy (over pole coefficients), and optimization occured using Fully Corrective Frank-Wolfe (FCFW). The full-correction steps allowed poles to be added and dropped as necessary while maintaining a monotonically decreasing objective error, whereas the (Forward) Frank-Wolfe scheme never drops poles and results in a high-order system. 
<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.html path="assets/img/ring_active_set_fw_compare.png" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    Comparison of system order and objective convergence for Forward vs. Fully Corrective Frank-Wolfe for MIMO sysid.
</div>

The algorithm has two phases: Randomize and Reweight. The Randomize phase picks out poles at random and performs FCFW steps over this active set. After sufficiently many iterations (user-specified), the Reweight phase sparsifies the set of poles while retaining monotonicity in objective by adjusting the weights of the regularizer. 


<div class="row">
    <div class="col-sm mt-2 mt-md-0">
        {% include figure.html path="assets/img/reweight_ring-1.png" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
	<div class="col-sm mt-2 mt-md-0">
        {% include figure.html path="assets/img/ring_randomize_reweight-1.png" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    Both the cost and the number of active poles decrease after reweighting.
</div>



<div class="publications">
	<h1>Relevant Publications:</h1>
	{% bibliography -f papers -q @*[tag=mimo]* %}
  </div>