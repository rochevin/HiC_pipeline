rule bwa_mem:
        input:
                expand(INDIR+"{{prefix}}{dataset}.fastq.gz",dataset=[R1,R2])
        output:
                mapped=temp(OUTDIR+"mapping/{prefix}.sam")
        params:
                index=GENOME+".fa"
        conda : "envs/bwa_mem.yaml"
	benchmark:
                OUTDIR+"benchmark/{prefix}/bwa_mem.txt"
        threads:THREADS
        shell:
                "bwa mem -5SPM -t {threads} {params.index} {input} > {output}"
