---
layout: page
title: Power Electronics
description: Safely control electric motor systems by suppressing undesirable harmonics
img:
importance: 2
tag: pe
category: active
---

<h2>Electric Drive Systems</h2>

Electric drives systems convert electrical energy into mechanical motion, or harvest electrical energy from motion. 
These systems are one of the main keys to the renewable energy transition.


<div class="row">
	<div class="col-sm mt-3 mt-md-0">
        {% include figure.html path="assets/img/electric-car.jpg" title="electric car" class="img-fluid rounded z-depth-1" %}
    </div>
    <div class="col-sm mt-3 mt-md-0">
	{% include figure.html path="assets/img/wind_turbine.jpg" title="wind turbine" class="img-fluid rounded z-depth-1" %}        
    </div>
	<div class="col-sm mt-3 mt-md-0">
        {% include figure.html path="assets/img/metallic-factory-machine-small.jpg" title="factory" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
   Electric drives are found in the wheels of electric vehicles, wind turbines, and milling machines.
</div>



Possible control objectives in the motor include speed, angle, magnetic flux, and torque. Failure to properly control the motor could cause heating in the motor, low power quality, undesirable harmonics, and possibly mechanical breakage.


A common component in electrical drive systems is an inverter. An inverter is a power electronic device that converts between DC and AC power. The inverter is controlled by toggling electrical or electromechanical switches. The voltage output on the AC side can therefore take on a finite number of levels. 


<div class="row">
	<div class="col-sm mt-2 mt-md-0">
        {% include figure.html path="assets/img/inverter_diagram.png" title="inverter diagram" class="img-fluid rounded z-depth-1" %}
    </div>
	<div class="col-sm mt-2 mt-md-0">
        {% include figure.html path="assets/img/abb-acs5000-dc-drives_crop.png" title="flow safe" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
   A circuit diagram of a 3-level inverter. Right: The ABB ACS5000 DC medium voltage drive.
</div>


The task of inverter control is to choose a switching sequence such that the motor current/flux/angle trajectory closely tracks a desired trajectory. As an example, a sinusoidal current reference must be tracked using a nonsmooth and finite-level switched voltage input. Exactly following this reference will yield a smooth and predictable rotational motion.
Methods to choose switching sequences include comparator-based  modulation (e.g. carrier, space vector), optimal pulse patterns, and selective harmonics elimination. 

<div class="row">
	<div class="col-sm mt-1 mt-md-0">
        {% include figure.html path="assets/img/increasing_seq" title="better switching frequency" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
   Raising the switching frequency yields better fidelity to a reference sinusoidal current (k: number of allowed pulses per period).
</div>

Choosing a specific pulse pattern occurs as part of a nested control loop, whose components could involve trajectory generation and model predictive control. 


<h2>Optimal Pulse Patterns</h2>

Optimal Pulse Patterns solve an optimization problem to choose a pulse pattern.
Constraints imposed on this optimization problem include harmonics specifications, power losses, bounded number of switches, and symmetry considerations. The optimization problem is highly nonconvex, featuring binary switching and nonlinear harmonics constraints. This research provides lower-bounds on the Total Demand Distortion obtained by any pulse pattern that is feasible for the constraints. A lower Total Demand Distortion is associated with closer fidelity to the desired sinusoidal reference, and increased efficiency because less energy is lost to wasted heat in undesired harmonics. Existing patterns (upper bounds) can then be checked against the computed lower-bounds to gauge for optimality.


We model the Optimal Pulse Pattern problem as a path-planning optimal control problem in a hybrid system (continuous and discrete dynamics).
the continuous dynamics are the electrical dynamics of the circuit elements (e.g. motor resistance and inductance, grid-side filters).
 The discrete jumps are the toggling of switches, in which the output voltage level in the inverter changes. The control problem is to choose a periodic path in a transition graph (levels), and the times to execute these jumps (switching angles).


<div class="row">
	<div class="col-sm mt-3 mt-md-0">
        {% include figure.html path="assets/img/pulse_anatomy" title="flow barrier" class="img-fluid rounded z-depth-1" %}
    </div>
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.html path="assets/img/traversed_4" title="flow safe" class="img-fluid rounded z-depth-1" %}
    </div>
	<div class="col-sm mt-3 mt-md-0">
        {% include figure.html path="assets/img/dwell_4" title="flow safe" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
   Left: A pulse pattern with 4 switching angles. Center: A transition graph, with the black path highlighting the voltage sequence used. Right: an occupancy table storing the time spent in each mode.
</div>

We lower-bound the optimal control cost of the hybrid system optimal control problem by using existing convex relaxation methods in control theory (value functions/moment-sum-of-squares). By increasing the computational requirements (larger and larger semidefinite programs), tighter and tighter lower-bounds to the true minimal Total Demand Distortion are obtained. 

   The below figure plots a pattern with 24 pulses/period, quarter-wave symmetry, and a voltage sine fundamental  harmonic of 0.8.    The TDD of the synthesized pattern is 2.65%, and has a suboptimality at most 2.2799 &times; 10 <sup>-4</sup>  above the minimal TDD pattern. 
   

<div class="row">
	<div class="col-sm mt-1 mt-md-0">
        {% include figure.html path="assets/img/kappa_08_05_k24_fixed" title="5 level" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">

   
   Top: voltage reference (black) and synthesized pattern (blue). Middle: the current in the resistive-inductive motor with R/L ratio 0.5, red dots highlight the switching angles. Bottom: difference between the reference load current and the motor load current as driven by the pattern.
   

   
</div>

A pattern can be approximately recovered from the semidefinite program solutions if the matrices satisfy low-rank properties. The numerically recovered pattern may be infeasible for the harmonics constraints, and can then be fed into a local optimizer to generate a feasible pulse pattern.

<div class="publications">
	<h1>Relevant Publications:</h1>
	{% bibliography -f papers -q @*[tag=pe]* %}
  </div>
