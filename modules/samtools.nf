process SAMTOOLS_CVT{
    
        cpus 1
        memory '7 GB'
        publishDir "${params.outdir}/samtools/converted", mode: 'symlink'
        container "public.ecr.aws/biocontainers/samtools:1.19--h50ea8bc_0"

        input:
        tuple path(sam)

        output:
        tuple path("sorted_${sam.name}.bam"), path("sorted_${sam.name}.bam.bai")

        script:
        """
        samtools sort $sam | samtools view -b > sorted_${sam.name}.bam
        samtools index sorted_${sam.name}.bam
        """
}    



process SAMTOOLS_CVG{

        cpus 1
        memory '7 GB'
        publishDir "${params.outdir}/samtools/coverage", mode: 'symlink'
        container "public.ecr.aws/biocontainers/samtools:1.19--h50ea8bc_0"

        input:
        tuple path(bam)

        output:
        tuple path("coverage_${bam.name}.txt")

        script:
        """
        samtools coverage $bam > coverage_${bam.name}.txt
        """
}    



process SAMTOOLS_FLAG{

        cpus 1
        memory '7 GB'
        publishDir "${params.outdir}/samtools/flag", mode: 'symlink'
        container "public.ecr.aws/biocontainers/samtools:1.19--h50ea8bc_0"

        input:
        tuple path(bam)

        output:
        tuple path("flagstat_${bam.name}.txt")

        script:
        """
        samtools flagstat $bam > flagstat_${bam.name}.txt
        """
}    
