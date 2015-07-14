Set up
  $ . $TESTDIR/setup.sh

Test blasr on ecoli.
Test blasr with -sam

# The following job takes a very long time to finish, let us use a subset of reads instead
#See $STDOUT/ecoli_v1.4.sam for 1.4 output.
# $STDOUT/ecoli_2014_03_28.sam for bug before mapQV for affineAlign/align without QV is fixed.
  $ rm -rf $OUTDIR/ecoli_subset.sam
  $ $EXEC $DATDIR/ecoli_subset.fasta $DATDIR/ecoli_reference.fasta -sam -out $OUTDIR/ecoli_subset.sam -nproc 15
  [INFO]* (glob)
  [INFO]* (glob)

  $ sed -n '5,$ p' $OUTDIR/ecoli_subset.sam | sort | cut -f 1-11 > $TMP1
  $ sed -n '5,$ p' $STDDIR/ecoli_subset_2015_04_09.sam | sort | cut -f 1-11 > $TMP2
  $ diff $TMP1 $TMP2
  $ rm $TMP1 $TMP2
# 2015_03_08 --> changelist 148101, 148080 updated read group id; 148100 updated TLEN
# 2015_04_09 --> changelist 148796, updated read group id
