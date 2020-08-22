# Automated-mini-detection
Script designed to count the number of minis in traces derived from rat hippocampal neurons in culture

Script is meant to be used with data acquired from z-stacks generated in FIJI. Data can be imported into MATLAB from a table with the raw trace values as a numeric matrix.

Since the data will be non-normalized and still showing the effects of bleaching the first thing the script will do is correct for both. Normalization will be accomplished
by using the formula: (fluorescence - med(fluorescence))/med(fluorescence) to acquire a dF/F for each trace. Traces are then linearized by subtraction of a fitted linear model,
fitted to quadratic data. All signals are also shifted up from this value such that the lowest value in any trace is zero.

A threshold is defined per trace for detection of minis. This threshold is defined by signals that are 60% greater than that of the median fluorescence of that trace. Peaks are
then counted and a variable 'totMinis' is returned for all peaks that are detected above this threshold.
