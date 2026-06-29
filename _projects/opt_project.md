---
layout: page
title: Optimization Algorithms
description: Characterize and design and  convergent optimization algorithms over dynamical networks (time delays)
img:
importance: 1
tag: opt
category: active
---

Many problems in control, engineering, management, and machine learning can be cast as an optimization problem: find a point that minimizes an objective function subject to constraints. An optimization algorithm is an iterative procedure that returns a sequence of candidate points. The algorithm is convergent if this sequence converges to a local optimum when starting at any possible initial configuration. 


Optimization algorithms can be understood through a system-theoretic lens as the interconnection of a linear system and a set of memoryless nonlinearities (algodynamics/system theory of algorithms). The linear system governs the memory and stepsize rules used by the algorithm, and the nonlinearities are the gradient/subgradient/operator oracles defining the optimization problem. 

<div class="row">
	<div class="col-sm mt-2 mt-md-0">
        {% include figure.html path="assets/img/inverter_diagram.png" title="inverter diagram" class="img-fluid rounded z-depth-1" %}
    </div>
	<div class="col-sm mt-2 mt-md-0">
        {% include figure.html path="assets/img/abb-acs5000-dc-drives_crop.png" title="flow safe" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
   Left: Gradient Descent algorithm. Right: Douglas-Rachford Splitting
</div>

Algorithms may operate in dynamic environments, in which the oracles are not immediately accessible by the optimizer. Dynamical network effects include time-delays, cross-talk, channel memory, switching, and noise corruption. Desired algorithmic structures can also be modeled as components of a network (algo-dynamics), such as in primal-dual updates arising in distributed optimization. The introduction of these dynamical components can degrade or even break  nominally convergent algorithms.

<div class="row">
	<div class="col-sm mt-2 mt-md-0">
        {% include figure.html path="assets/img/inverter_diagram.png" title="inverter diagram" class="img-fluid rounded z-depth-1" %}
    </div>
	<div class="col-sm mt-2 mt-md-0">
        {% include figure.html path="assets/img/abb-acs5000-dc-drives_crop.png" title="flow safe" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
   Left: Douglas-Rachford with time delays in image memory access.   
   Right: Image denoising by Douglas Rachford, rows are #steps of the algorithm, columns are number of delays.
</div>


Our investigation targets the following questions:
1. When does on optimization algorithm converge under dynamical network effects?
2. What is an upper-bound of the convergence rate of a given algorithm?
3. How can we principally design optimization algorithms without requiring hand-tuning?



<h2> Structure </h2>
We first provide conditions for an optimization algorithm to converge,  by forming a link from convergence to the control-theoretic concepts of Regulation Theory and the Internal Model Principle. A subset of all optimization problems consistent with the oracles is the class of problems admitting unique optimal solution and unique subgradient/inclusion vectors. As an example, this uniqueness holds if there is a strongly convex composite optimization problem with a  single nonsmooth function (e.g. Elastic Net Regularization for denoising). 

Any well-posed algorithm that converges for problems in this restricted class must satisfy fundamental properties. The first condition is Robust Stability: if the optimal solution and subgradient vectors at optimality are all 0, then the state should converge to 0 regardless of the initial condition. The second condition is the satisfaction of a Regulator Equation: consensus between oracles will be asymptotically achieved even if the state converges to a nonzero quantity. We show that the Regulator Equation depends only on the network, and is independent of the precise oracles being used. In the language of control, these conditions are a structured robust regulation result using arguments from nominal regulation. The Robust Stability and Regulator Equation requirements are necessary and sufficient for algorithm convergence with linear-time-invariant algorithms (e.g. gradient descent with fixed stepsizes), and are sufficient for switched systems.


Satisfaction of Robust Stability and Regulator Equation implies that convergent algorithms must follow an Internal Model Principle: there exists a factorization of the algorithm into a  Model system that depends only on the network and a Core subsystem that carries the algorithm parameters. For algorithms with no network dynamics, the model is dependent only on the number of oracles and the dimension of each oracle.


<div class="row">
	<div class="col-sm mt-2 mt-md-0">
        {% include figure.html path="assets/img/inverter_diagram.png" title="inverter diagram" class="img-fluid rounded z-depth-1" %}
    </div>
	<div class="col-sm mt-2 mt-md-0">
        {% include figure.html path="assets/img/abb-acs5000-dc-drives_crop.png" title="flow safe" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
   Left: Chambolle-Pock Algorithm. Right: Davis-Yin Splitting
</div>


<h2> Analysis and Synthesis </h2>

The system theoretic model of allows for the analysis and synthesis of optimization algorithms by using methods from robust control. 

The oracles can be abstracted into uncertainties constrained by known properties. Example properties include convexity/strong convexity/smoothness for functions and mere monotonicity/ monotonicity/cocoercivity/Lipschitzness for operators. 
Input-output sequences arising from the operators satisfy a family of Integral Quadratic Constraints/dissipation relations. These relations cover the operator sequences: a linear system  that is convergent with respect to any possible uncertainty satisfying these relations is therefore convergent when interconnected with the operators. 

The analysis problem involves first checking the Regulator Equation, and then finding relations satisfied by the operator sequences such that the interconnection has minimal exponential convergence rate. 
The synthesis problem additionally finds a controller such that the interconnection of the controller and the network forms an convergent optimization algorithm. Synthesis is performed by alternating between searching for the controller and the relations. An internal model is supplied to ensure that the Regulator Equation is satisfied for any controller. The analysis and individual synthesis tasks are all convex programs that are posed in terms of Linear Matrix Inequalities. Feasibility of the Regulator Equation and Robust Stability properties ensures that the designed algorithm is will be convergent.




<div class="publications">
	<h1>Relevant Publications:</h1>
	{% bibliography -f papers -q @*[tag=opt]* %}
  </div>
