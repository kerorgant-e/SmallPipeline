
params.outdir ="/home/blanche/SmallPipeline/results"
params.reads = "/home/blanche/SmallPipeline/data/long_reads/*.fastq.gz"
params.ref = "/home/blanche/SmallPipeline/data/ref_genome/NR49281.fna"

// processes 
 
 

// // QC

include { NANOPLOT } from "./modules/nanoplot.nf" 
include { MINIMAP } from "./modules/minimap.nf"
include { SAMTOOLS_CVT } from "./modules/samtools.nf"
include { SAMTOOLS_CVG } from "./modules/samtools.nf"
include { SAMTOOLS_FLAG } from "./modules/samtools.nf"
 
workflow { 

    reads_ch = Channel.fromPath(params.reads)
    ref_ch = Channel.value(params.ref)

    NANOPLOT (reads_ch)

    MINIMAP (reads_ch, ref_ch)

    SAMTOOLS_CVT( MINIMAP.out )
    SAMTOOLS_CVG( SAMTOOLS_CVT.out )
    SAMTOOLS_FLAG( SAMTOOLS_CVT.out )

    
}


