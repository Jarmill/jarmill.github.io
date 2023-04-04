---
layout: page
title: Peak Estimation
description: Quantify the safety of trajectories using occupation measure techniques
img:
importance: 1
category: active
---

Peak estimation is the practice of finding the maximum value of a state function over trajectories of a dynamical system. Instances of peak estimation include finding the  speed of a car, the height of an aircraft, the voltage in a power line, etc. Peak estimation can be applied towards safety quantification, such as by measuring the safety of a trajectory by its distance of closest approach to an unsafe set. This project extends the occupation measure framework developed for optimal control and peak estimation. The Moment-Sum-of-Squares hierarchy is employed to obtain convergent bounds to the true peak value when all system data is polynomial.

This thesis was defended on April 3, 2023. Information is available at <a href="/assets/pdf/Thesis_Final.pdf">[Thesis]</a>, <a href="/assets/pdf/Thesis_Presentation.pdf">[Slides]</a>, <a href="/assets/pdf/Thesis_Bonus.pdf">[Bonus Slides]</a>, <a href="/assets/pdf/Safety_Poster__PhD_Expo.pdf">[Poster]</a>.

Our first step to perform this quantification involved measuring the constraint violation using maximin optimization, yielding a safety margin (with safety verified if this margin is negative) {% cite miller2020recovery %}. Peak estimation may also occur for dynamics with compact-valued time-dependent or time-independent uncertainty (including switching) {% cite miller2021uncertain %}.
An extension of this includes quantifying the safety of trajectories by finding the distance of closest approach to an unsafe set {% cite miller2021distance %}.

<div class="row">
	<div class="col-sm mt-3 mt-md-0">
        {% include figure.html path="assets/img/flow_barrier.png" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.html path="assets/img/flow_safe_verify.png" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
	<div class="col-sm mt-3 mt-md-0">
        {% include figure.html path="assets/img/distance_flow_clean.png" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    All plots certify safety of trajectories with respect to the red half-circle unsafe set. Left plot: a barrier certificate of safety, in which the green curve is the 0-level set. Center-plot: a safety margin, along with the optimizing-trajectory in dark blue. Right-plot: the trajectory that achieves a distance of closest approach, along with the contour of all similarly-close points.
</div>


Extensions of the peak/distance estimation framework include adding (bounded) uncertainty into dynamics, allowing for piecewise distance functions (e.g. L1 or L-infinity normed distances), and ensuring the safety of all points on a moving shape with respect to the unsafe set.

<div class="row">
	<div class="col-sm mt-3 mt-md-0">
        {% include figure.html path="assets/img/flow_noise_b_5.png" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.html path="assets/img/flow_l1_distance_bound_v2.png" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
	<div class="col-sm mt-3 mt-md-0">
        {% include figure.html path="assets/img/flow_shape_peak_init.png" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    Left plot: a distance estimate under an uncertainty process. Center plot: the closest approach with respect to L1 distance. Right plot: closest approach betwen a point on the translating shape (pink square) and the unsafe set.
</div>

Peak estimation can be used in a data-driven framework to formulate safety quantification of unknown systems. When the dynamics are input-affine and the corruption is semidefinite-representable (e.g., box-bounded), infinite-dimensional robust counterparts may be applied to drastically reduce the size of PSD matrices {% cite miller2023robustcounterpart %}. This robust counterpart framework can be applied to peak estimation, reachable set estimation, distance estimation, and to the peak-minimizing control problem that finds minimum possible data corruption needed to crash into the unsafe set  {% cite miller2023crash %}.

<div class="row">
	<div class="col-sm mt-3 mt-md-0">
        {% include figure.html path="assets/img/flow_observations.png" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.html path="assets/img/dist_data_driven_eps_half.png" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
	<div class="col-sm mt-3 mt-md-0">
        {% include figure.html path="assets/img/crash_flow_casadi_state_data_driven.png" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    Left plot: 40 observations of the Flow dynamical system, with perfect knowledge of the horizontal coordinate and 0.5-bounded-noise in the vertical coordinate. Center plot: Distance estimate for all systems with cubic polynomial dynamics in the vertical coordinate consistent with the data. Right plot: Increasing the data corruption from 0.5 to 0.5499 will allow for a controlled trajectory starting at the initial point to crash into the unsafe set.
</div>


Peak and Distance Estimation may be applied to dynamical systems that do not follow Ordinary Differential Equations. Peak estimation may be applied to hybrid systems by modifying hybrid Optimal Control Programs {% cite miller2023hybrid %}. Stochastic Differential Equations (SDEs) can also be analyzed by finding the peak Value-at-Risk (epsilon-quantile) of the state function {% cite miller2023chancepeak %}.


<div class="row">
	<div class="col-sm mt-2 mt-md-0">
        {% include figure.html path="assets/img/distance_estimate_sde.png" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
    <div class="col-sm mt-2 mt-md-0">
        {% include figure.html path="assets/img/rl_distance.png" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    Left plot: Hybrid system with Left&rarr;Top and Right&rarr;Bottom transitions. Right plot: sample paths of an SDE, with 50% (dashed) and 85% (solid) probability bounds for the Value-at-Risk of the Distance.
</div>

Peak estimation problems can be posed over Time-Delay systems, in which the trajectory dynamics depend on past and present functions of state {% cite miller2023delay %}.

<div class="row">
	<div class="col-sm mt-1 mt-md-0">
        {% include figure.html path="assets/img/time_var_3d_hist_circ.png" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    Histories (gray) are constrained to be inside the cylinder spanned by the two black circles. The histories have no assumption of continuity. The red plane upper-bounds the maximum extent of the horizontal coordinate x1 over the course of system execution.
</div>

<div class="publications">
	<h1>Relevant Publications</h1>
	{% bibliography -f papers -q @*[tag=peak || tag=peakddc]* %}
  </div>