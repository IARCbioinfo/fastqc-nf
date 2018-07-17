#!/usr/bin/env nextflow

// Copyright (C) 2017 IARC/WHO

// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.


params.help          		 = null
params.cpu            		= "12"
params.mem           		 = "2"


log.info ""
log.info "----------------------------------------------------------------"
log.info " fastqc-0.11.3/  : Quality control with FastQC  and MultiQC     "
log.info "----------------------------------------------------------------"
log.info "Copyright (C) IARC/WHO"
log.info "This program comes with ABSOLUTELY NO WARRANTY; for details see LICENSE"
log.info "This is free software, and you are welcome to redistribute it"
log.info "under certain conditions; see LICENSE for details."
log.info "--------------------------------------------------------"
if (params.help) {
    log.info "--------------------------------------------------------"
    log.info "                     USAGE                              "
    log.info "--------------------------------------------------------"
    log.info ""
    log.info "-------------------QC-------------------------------"
    log.info "" 
    log.info "nextflow run FastQC.nf   --input_folder path/to/fasta/ --fastqc path/to/fastqc/ --multiqc path/to/multiqc/  --output_folder /path/to/output"
    log.info ""
    log.info "Mandatory arguments:"
    log.info "--fastqc              PATH                FastQC installation dir"
    log.info "--multiqc              PATH               MultiQC installation dir"
    log.info "--input_folder         FOLDER               Folder containing fasta files"
    log.info "--output_folder        PATH                 Output directory for html and zip files (default=fastqc_ouptut)" 
    log.info ""
    log.info "Optional arguments:"
    log.info "--cpu                  INTEGER              Number of cpu to use (default=2)"
    log.info "--config               FILE                 Use custom configuration file"
    log.info ""
    log.info "Flags:"
    log.info "--help                                      Display this message"
    log.info ""
    exit 1
} 

fastas = Channel.fromPath( params.input_folder+'/*.fastq.gz' )
              .ifEmpty { error "Cannot find any fasta file in: ${params.input_folder}" }
              .map {  path -> [ path.name.replace(".fastq.gz",""), path ] }
              
              

process fastqc {
		cpus params.cpu

        input:
        file i from fastas
	
        output:
        publishDir '${params.output_folder}', mode: 'copy', pattern: '{*_fastqc.zip,*._fastqc.html}' 

	shell:
        '''
	${params.fastqc} -t ${task.cpus} ${i}.fastq.gz -o  ${params.output_folder}
	'''
}

process multiqc{
            cpus '1'
            
            
            input:
	    	 file(zipfile)  from !{params.output_folder}
	    	 
	    	 output :
	    	 publishDir '${params.output_folder}', mode: 'copy', pattern: '{*.html}' 

            shell:
            '''
	  ${params.multiqc} -d ${params.output_folder}/*_fastqc.zip 
            '''
}
