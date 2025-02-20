process NANOPLOT {

    publishDir "${params.outdir}/nanoplot", mode: 'symlink'
    container "public.ecr.aws/biocontainers/nanoplot:1.38.0--pyhdfd78af_0"

    input:
    path fastq

    output:
    path "nanoplot_out_${fastq.name}"  

    script:
    """
    NanoPlot \
        --fastq $fastq \
        -o ./nanoplot_out_${fastq.name}  
    """
}