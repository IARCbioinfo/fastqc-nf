
# Quality control of aligned reads #

![Imane FastQC](https://github.com/ImaneLboukili/WGS_analysis/blob/master/FastQC/FastQC-nf.png)

## Description ##

Perform quality control of Fasta files.

## Dependencies ##

1. This pipeline is based on [nextflow](https://www.nextflow.io). As we have several nextflow pipelines, we have centralized the common information in the [IARC-nf](https://github.com/IARCbioinfo/IARC-nf) repository. Please read it carefully as it contains essential information for the installation, basic usage and configuration of nextflow and our pipelines.
2. FastQC: see official installation [here](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/). You can avoid installing all the external software by only installing Docker (not available yet). See the [IARC-nf](https://github.com/IARCbioinfo/IARC-nf) repository for more information.)
3. Multiqc: see official installation [here](http://multiqc.info). You can avoid installing all the external software by only installing Docker (not available yet). See the [IARC-nf](https://github.com/IARCbioinfo/IARC-nf) repository for more information.)

## Input ## 

**Name**        | **Description**
--------------- | -------------
--input_folder  |  Folder containing BAM files
--output_folder |  Path to output folder

## Parameters ##

### Optional ###

**Name**          | **Example value** | **Description**
------------------| ------------------| ------------------
--fastqc          | /usr/bin/fastqc   | Path to FastQC installation directory
--multiqc         | /usr/bin/multiqc  | Path to MutliQC installation directory
--cpu             | INTEGER           | Number of cpus to be used

### Flags ###

Flags are special parameters without value.

**Name**      | **Description**
------------- | -------------
--help        | Display help

## Download test data set ##

`git clone blablabla`

## Usage ##

`nextflow run FastQC.nf   --input_folder path/to/fasta/ --fastqc path/to/fastqc/ --multiqc path/to/multiqc/  --output_folder /path/to/output`

## Output ##

**Name**        | **Description**
--------------- | -------------
HTMLs           | An html file for each analysed Fasta file, and one containing the aggregated results


