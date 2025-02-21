process MINIMAP {
    
        cpus 8
        memory '15 GB'
        publishDir "${params.outdir}/minimap", mode: 'symlink'
        container "public.ecr.aws/biocontainers/minimap2:2.26--he4a0461_2"

        input:
        tuple path(fastq)
        val(ref) 

        output:
        tuple path("alignement_${fastq.name}.sam")

        script: 

        """
        minimap2 \ 
            -a $ref $fastq \
            > alignement_${fastq.name}.sam
        """
}