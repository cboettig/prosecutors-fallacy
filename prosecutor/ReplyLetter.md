

Reply to the associate Editor, Dr Minus van Baalen
--------------------------------------------------

> I like the ms as does one of the referees. The other referee (who signed
his review) has provided an extensive review with numerous suggestions
for improving the ms as well as one criticism that should be addressed:
how dependent are the results of being close to an Allee threshold? From
my limited experience in this domain many interesting phenomena only
arise when Allee mechanisms are operating, but it would be nice to see
this made explicit.


We provide a detailed response to concerns of Reviewer 1 below.
In addition, to address the concern about whether these phenomena arise
only when Allee effects are operating, we have added a second example using 
simulations from a system that does not experience an Allee effect
(i.e. a bistable system with a strictly positive lower stable state,
adapted from May 1977).  These results are now presented in Figure 3.  


Reply to Reviewer 1, Peter Ditlevsen 
------------------------------------

> My major concern is the following: This result must be a consequence
of the realizations chosen to close to the actual jump (with the last
endpoint at the Allee threshold), that there will be an increase in
variance and autocorrelation just because of that. If instead the sample
of realizations prior to a jump were chosen such that the endpoint was,
say, last down-crossing through the steady state of the model (minimum
of potential), I expect the bias to be completely gone. "

This is an important point which deserves to be clarified.  It is true
that the bias arises from the transient branch of the trajectory that
crosses the threshold, and true that if the system were truncated at
the minimum of the potential that the effect would not appear.

However, in the application of such approaches, the precise location of
the minimum of the potential is unknown.  Moreover, under the hypothesis
that the system is approaching a critical transition, the location of the
minimum potential moves, as clearly indicated in our Figure 1c  (formerly
Figure 1b) (notably the stable point moves in the direction of the
transition).  Because the location is neither known nor stationary, we do
not believe it is practical or desirable to suggest that historical time
series can be used by following a simple truncation rule that avoids this
branch.  Exactly where a study will choose to truncate such a trajectory
will necessarily be arbitrary without an underlying model of the process.
Frequently this is done by removing the very steep, monotonic branch of
the trajectory expected once the system crosses the unstable threshold.
Such an approach corresponds with our choice of termination.

The examples of Figure 1, though only single replicates, may be useful in
illustrating these issues.  Figure 1c, top panel shows a sample trajectory
of a system with a parameter shift, while 1b shows a trajectory without
a shift.  Both trajectories become more highly autocorrelated and higher
variance near the end of the time series (time increases on the y axis in
Figure 1).  The part of the time series following the critical transition
shows a fast and monotonic trajectory to the unstable trajectory,
and would usually be excluded by an analysis for warning signals in
advance of the transition.  No such clear pattern exists prior to the
transition in Figure 1b.   A proposal to terminate the trajectory in
panel B earlier would also risk decreasing the signal seen in panel C,
and would be inconsistent with the application of warning signals in
the forecasting context, where there would be no such truncation.

We have added a new section (3.2) to the Discussion to address these
important issues.



> P2: Footnote on page 2 should be incorporated into the main text
and expanded.

Done, with additional explanation added.

> It is not relevant to show the master equation here.

Agreed.  We offer a more concise description as Poisson-event birth-death
process.  It is true that for adequate system size (total number
of individuals) this can be well-approximated as a Gaussian process
and represented by a stochastic differential equation, but this adds
unnecessary complication to explain, and potentially misleading since we
simulate the Poisson process, instead of the SDE.  The suggested dn/dt =
b_n - d_n + noise is a bit imprecise (For instance, does this represent
an Ito or Statonvich integral, and what is the source of the noise).
Of course the results do not depend on this detail anyhow.  We hope the
new text is more clear.

> The e in equation (3) is redundant

Yup, removed.

> The appendix is not really relevant

The appendix provides complete code to replicate the results by copying
and pasting the commands given into an R terminal, a practice recommended
by Peng (2012) in Science and many others.  Readers not interested in
this kind of thing are free to ignore this material; since as the reviewer
notes all relevant details are already described in the main text.

> suggest to show a figure of b_n, d_n, and state the parameter values
used.  Also the stated parameters do not match those shown in figure 1.

Such a figure has been added, now Figure 1a.  Parameter values are
now provided in the figure caption. The potential now shows the curves
matching these parameters, in agreement with the reviewer's own figures.

> p5, L119 Is the Allee threshold equal to h?

No.  The Allee threshold is the unstable critical point indicated by
the central crossing of the birth and death curves and hence depends on
the parameters of each, whereas h corresponds to the inflection point
in the birth function.  The new Figure 1 indicates the Allee threshold
to clarify this.

> p5, L124 it would be helpful to define Kendall's tau

The definition has been added at the first mention.

> Figure 2: It is surprising that the distribution of tau is bimodal. Is
this due to small sample size?

Yes. This is now been clarified in the figure caption.  (The
individual-based simulations are rather computationally intensive --
extra simulations have been included in the null distribution of the
May model we have introduced as a second example, and the bimodality
does not appear.)

> p6, L 133 the reference to "m" from Boettiger & Hastings 2012 needs
to be expanded.

The relevant equation is now provided in the text.


> p6 Sec3.1 (L152-4) Unclear what kind of warning signal is referred to:
Being (by chance) close to a threshold does give an increased probability
of crossing

We have attempted to clarify this section.  While it is true that any
time a fluctuation takes the system closer to the threshold, the chance
of crossing is slightly higher, such a difference is very negligible
since the return force is also proportionally stronger.

> so there is the possibility of (short time) warning.  But this is a
different type of early warning

It is not clear what is meant by (short time) warning. The point of this
paragraph is simply to observe that it would be incorrect to conclude
from our example that early-warning methods successfully detect chance
transitions as well as bifurcations, because the chance the observed
stable system collapses is quite small.

> p6, L156: Misleading: probability of the random step is always equal.

Our apologies for the confusing terminology, we have clarified the meaning
(removing the term 'random').

(The reviewer interprets a "random" step in the sense that the dynamics
can be separated into an expected or deterministic part (i.e. "drift")
and a random step drawn from a symmetric distribution (i.e. diffusion).
Of course not all Markov processes can be separated so cleanly (ours
is only approximated by such an equation), and we meant random in the
sense of the Markov process as a whole, not just the diffusion term in
its approximation.)


We would like to thank Peter Ditlevsen for his thorough and signed
review and have added his name to the closing Acknowledgements.
Professor Ditlevsen should indicate if he would prefer to be anonymous
in the printed acknowledgement.



Reply to Reviewer 2 
-------------------

> I had a hard time following figure 1.

Both the caption and the layout of Figure 1 have been modified in hopes
that the new format is more easily interpreted.

> Some of the text (particularly the Discussion) could be simplified in
order to reach a broader, non-specialist, audience.  As it stands, much
of the text is likely to be relatively inaccessible to a broader audience.

The text has been simplified in several places, with an eye to avoiding
or clearly defining jargon in more accessible terms.  We hope the reviewer
finds the revised discussion improved.

> Line 133: insert the word “by” between described and Boettiger.

Corrected, thanks for noting this.

