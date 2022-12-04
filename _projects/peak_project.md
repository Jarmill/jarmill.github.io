---
layout: page
title: Peak Estimation
description: Bound extreme values of state functions using occupation measure techniques
img:
importance: 1
category: active
---

Peak estimation is the practice of finding the maximum value of a state function over trajectories of a dynamical system. Instances of peak estimation include finding the  speed of a car, height of an aircraft, voltage in a power line, etc. Peak estimation may be used to quantify the safety of trajectories. This project extends the occupation measure framework developed for optimal control and peak estimation. The moment-Sum-of-Squares hierarchy is employed to obtain convergent bounds to the true peak value when all system data is polynomial.

My first step to perform this quantification involved measuring the constraint violation using maximin optimization, yielding a safety margin (with safety verified if this margin is negative) {% cite miller2020recovery %}. Peak estimation may also occur for dynamics with compact-valued time-dependent or time-independent uncertainty (including switching) {% cite miller2021uncertain %}.
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

<div class="publications">
	<h1>Relevant Publications</h1>
	{% bibliography -f papers -q @*[tag=peak || tag=peakddc]* %}
  </div>