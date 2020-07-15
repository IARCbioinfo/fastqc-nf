# fastqc-nf
## Quality control of raw sequencing reads #

[![CircleCI](https://circleci.com/gh/IARCbioinfo/fastqc-nf.svg?style=svg)](https://circleci.com/gh/IARCbioinfo/fastqc-nf)
[![Docker Hub](https://img.shields.io/badge/docker-ready-blue.svg)](https://hub.docker.com/r/iarcbioinfo/fastqc-nf/)
[![https://www.singularity-hub.org/static/img/hosted-singularity--hub-%23e32929.svg](https://www.singularity-hub.org/static/img/hosted-singularity--hub-%23e32929.svg)](https://singularity-hub.org/collections/4559)

![fastqc-nf](https://github.com/IARCbioinfo/fastqc-nf/blob/master/fastqc-nf.png)

## Description ##

Perform quality control of Fasta files.

## Dependencies ##

1. This pipeline is based on [nextflow](https://www.nextflow.io). As we have several nextflow pipelines, we have centralized the common information in the [IARC-nf](https://github.com/IARCbioinfo/IARC-nf) repository. Please read it carefully as it contains essential information for the installation, basic usage and configuration of nextflow and our pipelines.
2. FastQC: see official installation [here](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/). You can avoid installing all the external software by only installing Docker (not available yet). See the [IARC-nf](https://github.com/IARCbioinfo/IARC-nf) repository for more information.)
3. Multiqc: see official installation [here](http://multiqc.info). You can avoid installing all the external software by only installing Docker (not available yet). See the [IARC-nf](https://github.com/IARCbioinfo/IARC-nf) repository for more information.)

### BAM input files
In order to process BAM files, we convert fastq files to bam files with:

4. [*samtools*](http://samtools.sourceforge.net/)

## Input ## 

**Name**        | **Description**
--------------- | -------------
--input_folder  |  Folder containing FASTQ files
--output_folder |  Path to output folder

## Parameters ##

### Optional ###

**Name**          | **Example value** | **Description**
------------------| ------------------| ------------------
--ext              | fastq.gz | Extension of files
--multiqc_config  |  none               |   config yaml file for multiqc
--cpu                |2 |              Number of cpu used by fastqc
--mem               | 10 | Size of memory used for mapping (in GB)

### Flags ###

Flags are special parameters without value.

**Name**      | **Description**
------------- | -------------
--help        | Display help


## Usage ##

`nextflow run IARCbioinfo/fastqc-nf -r v1.1 -profile singularity --input_folder input --output_folder results`

To run the pipeline without singularity just remove "-profile singularity"

## Output ##

| Type      | Description     |
|-----------|---------------|
| multiqc_fastqc_report.html  | multiQC report for fastQC |
| multiqc_fastqc_report_data  | data used for the multiQC report HTMLs    | 

## Contributions

  | Name      | Email | Description     |
  |-----------|---------------|-----------------| 
  | Nicolas Alcala*    | AlcalaN@fellows.iarc.fr    | Developer to contact for support |
  | Tiffany Delhomme    |    | Developer |

