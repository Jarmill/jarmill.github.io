---
layout: page
title: ACV Modeling
description: Describe and control the up-and-down (heave) motion of a bagged air cushioned vehicle.
img:
importance: 4
category: inactive
---

This project involved modeling the heave motion of an air cushioned vehicle (ACV), and analyzing its stability with respect to track-height disturbances. It was performed as part of the <a href="https://ece.northeastern.edu/fac-ece/dimarzio/capstone/CapstoneDesignCompetitionDecember_2017.pdf"> 2017 ECE Capstone Competition</a> at Northeastern University, and was done in partnership with <a href="https://paradigmhyperloop.com/">Paradigm Hyperloop</a> (Northeastern and Memorial University of Newfoundland collaboration).

<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.html path="assets/img/Skates_crop.png" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    The pod has four bagged air-skates (red fabric components)
</div>


There exists gaps between the track plates, and the plates them selves drift in height.

<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.html path="assets/img/track_height_60mph.png" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    Track profile when the pod moves at 60 mph
</div>

<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.html path="assets/img/track_height_400mph.png" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    Track profile when the pod moves at 400 mph
</div>

We developed a nonlinear model based on a Forchheimer porosity approximation for the heave motion of the bagged ACV. The model matches experimental findings of the pod dynamics: the pod is stable at atmospheric pressure and tends to oscillate (approaching instability) at tube (near-vacuum) pressure. We developed a control strategy and certified stability using a sum-of-squares verified Lyapunov function. The controlled pod rejects the track height disturbance and results in a smooth ride.


<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.html path="assets/img/disturbance_400_mph-1.png" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    Heave, speed, and bag pressure as the pod moves at 400 mph.
</div>

<div class="publications">
	<h1>Relevant Publications:</h1>
	{% bibliography -f papers -q @*[tag=acv]* %}
  </div>
