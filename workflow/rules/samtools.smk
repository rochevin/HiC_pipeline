rule samtools_sam_to_bam:
        input:
                OUTDIR+"mapping/{prefix}.sam"
        output:
                OUTDIR+"mapping/{prefix}.bam"
        benchmark:
                OUTDIR+"benchmark/{prefix}/samtools_sam_to_bam.txt"
	conda : "envs/samtools.yaml"
        threads:THREADS
        shell:
                "samtools view -@ {threads} -Shb {input} > {output}"
