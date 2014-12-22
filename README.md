Test of Proportions for random artifacts during polygraph testing
========================================================
author: Raymond Nelson
date: December 21, 2014

Polygraph testing
========================================================
Polygraph examinations are used for diagnostic purposes such as when testing criminal suspects when there is a known incident or known allegation and reason to suspect the involvment of a particular individual or individuals. 

Polygraph examinations are also used for screening purposes, to search for possible problem in the absence of any known incident or known allegegation such as when testing police officers for involvement with illegal drug cartels, testing government employees for unauthorized disclosure of sensitive or secret information or other indications of corruption (e.g., customs agents who accept gratuities in exchange for non-enforcement of import documentation and require taxes), or when monitoring convicted sex offenders who are sentenced by the court to community-based treatment programs under probabtion or parole supervision. 

Polygraph theory
===
Polygraph examinations are scored by partioning the sources of response variance into variance that is attributed to the target stimuli and variance that is attributed to other comparison stimuli. Differences in response variance are compared to statistical reference distributions for guilty and innocent persons, using a Gaussian-Gaussian signal discrimination model.

Most polygraph examinations in the United States and latin amercian are conducted with a family of testing techniques known as comparison questions techniques. Among the most widely used techniques worldwide is the Directed Lie Screening Technique, a generalization of the Test for Espionage and Sabotage developed by the U.S. Deparment of Defense. This technique is desirable due to its effectivness and the fact that the conduct of the test is transparent and does not depend on manipulation or trickery.

What does the polygraph measure?
===
Polygraph testing measures the probability of error associated with a categorical conclusion that the test data were obtained from a member of the population represented by the normative sampling distributions for deception or truth-telling. Recorded data are psychophysiological proxies that are correlated at statistically significant levels with differences in response to different test stimuli that occur as a function of deception or truth-telling. The level of significance of a test result can be described in various ways, including as a p-value, confidence level, conditional probability, odds ratio, or other probability metric. Scientific test results are said to be “statistically significant” - supporting a categorical conclusion of deception or truth-telling - if the test result satisfies a stated alpha level that describes a requirement for precision or tolerance for error. Although the polygraph does not measure lies per se, the term “lie detector” has been used as a term of convenience. 

Polygraph artifacts
===
Polygraph data can be disrupted by either random artifacts or intentional efforts to distort the data. Random artifacts are a normal occurence. 

Artifacts can also occur during polygraph testing as a result of faking attempts - such as when a test subject attempts to either systematically disrupt responses to investigation target questions, or when a test subject attempts to augment responses to other comparison test stimuli. These attempts will often result in artifacts that are observable to trainined polygraph examiners. 

Polygraph examiners who observe artifcacts during testing may be tempted to believe intuitively that a test subject is attmepting to engage in faking. 

Test subjects may experience consequences for suspected faking.

Test of Proportions for random artifacts
===
Use of a simple statistic can inform examiners regarding the probability that observed artifacts have occured due to random chance - or are within range expected if they have occurred due to random chance and non-systematic factors.

The test of proportions will provide an examiner with a statistical probability that the number and location of observed artifacts is significantly different than what would be expected if the artifacts have occurred due to random uncontrolled factors.

When the probability is sufficiently low that pattern of observed artifacts conforms to what is expected for random artificts, an examiner may have a more reasonable basis for a conclusion that an examinee has attempted to fake a test result. 

Example
===

```{r,echo=FALSE}
testOfProportions <- function(nCQ = 9, nRQ = 9, aCQ = 4, aRQ = 2, alpha = .05) {
        # step 1 proportion of CQ artifacts
        CQprop <- aCQ / nCQ
        # step 2 proportion of RQ artifacts
        RQprop <- aRQ / nRQ
        # step 3 proportion of total artifacts
        totProp <-  (aCQ + aRQ) / (nCQ + nRQ)
        # step 4 
        prop <- (1-totProp) * totProp
        # step 5 prop / nCQ
        propCQ <- prop / nCQ
        # step 6 prop / nRQ
        propRQ <- prop / nRQ
        # step 7 calculate the denominator
        denom <- sqrt(abs(propCQ + propRQ))
        # step 8 calculate the numerator
        numer <- CQprop - RQprop
        # step 9 calculate the z value
        z <- numer / denom
        # step 10 compute the quantile
        pval <- pnorm(abs(z), lower.tail = FALSE)
        # result
        result <- ifelse(pval <= alpha, "Artifacts differ significantly from random.", "Artifacts are not signficantly different from random.")
        return(pval)
}

resultStatement <- function(pval = pval, alpha = .05) {
result <- ifelse(pval <= alpha, 
                         "Artifacts differ significantly from random.", 
                         "Artifacts are not signficantly different from random.")
        return(result)
}
```

````{r}
pval <- testOfProportions(nCQ = 9, nRQ = 9, aCQ = 4, aRQ = 2, alpha = .05)
print(pval)

resultStatement(pval = pval, alpha = .05)
```
