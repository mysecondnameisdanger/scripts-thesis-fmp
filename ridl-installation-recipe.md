# README

From the ridl [documentation](https://github.com/GarmanGroup/RIDL).

## Dependencies

The scripts require the following to run:

- *Python 2.7* (main testing performed on 2.7.10)

- The *CCP4 suite* downloaded (version non-specific, but tested on 6.4.0, 6.5, and some minor testing on version 7.0)

- The ```seaborn``` python plotting library (use `pip install seaborn` to gain access to this plotting library).

- A list of calculated doses for the series should be calculated for radiation damage analysis. Visit www.raddo.se for full details on how to download the current version of *RADDOSE-3D*.

- The python module ```numexpr``` appears to not be included on some basic python distributions, and may need installing separately.

In order to check whether the RIDL dependencies are accessible to RIDL, use:

```python runRIDL.py --dependencies```


If you have difficulties manually installing individual python packages, consider using a custom python environment below.


## Python environments for running RIDL

If you have an Anaconda distribution of python installed (https://www.anaconda.com/download/#macos) then you can set up a custom python environment including all python packages required for running RIDL. 

To set up a new environment from the command line, run:

```conda env create -f environment-RIDL-2.7.yml -n <new_env_name>```

for a *python 2.7* environment, or:

```conda env create -f environment-RIDL-3.6.yml -n <new_env_name>```

for a *python 3.6* environment.

where ```<new_env_name>``` should be changed to whatever you would like to call your new environment. To then activate this particular environment, call:

```source activate <new_env_name>```

More information on how to handle python environments can he found here: https://conda.io/docs/user-guide/tasks/manage-environments.html


## Ridl installation up-to-date 
Using `conda` from <https://conda-forge.org/>
```sh
source miniforge3/bin/activate # to activate the conda base environment
conda create -y -n ridl python=2.7.13 # create env. using latest python2 available
conda activate ridl # activate the new `ridl` environment
python /home/murphy/Repos/ridl/runRIDL.py --dependencies # to check ridl dependencies
```
                                      
As stated in the documentation, `pip install package` will not work, because `pip` [no longer works with `python2`](https://pip.pypa.io/en/latest/development/release-process/#python-2-support). So, the installation of the python packages that `ridl` requires must be done with `conda`.
```sh
conda install -y numpy matplotlib scipy pandas seaborn numexpr future
```

Checking the dependencies again 

```sh
python /home/murphy/Repos/ridl/runRIDL.py --dependencies
```
 
should give something like: "All dependencies have been successfully located"

