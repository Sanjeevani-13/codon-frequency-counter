#!/usr/bin/perl
use strict;
use warnings;
use Bio::Seq;
use Bio::SeqIO;
use Bio::Tools::CodonTable;

# Check for input file argument
if (@ARGV != 1) {
    die "Usage: $0 <sequence_file.fasta>\n";
}

my $file = $ARGV[0];

# Read the sequence file
my $seqio = Bio::SeqIO->new(-file => $file, -format => "fasta");
my %codon_count;

# Create a standard codon table (you can change the table ID if needed)
my $codon_table = Bio::Tools::CodonTable->new(-id => 1);  # Standard table

while (my $seq_obj = $seqio->next_seq) {
    my $sequence = uc($seq_obj->seq);  # Convert to uppercase

    # Ensure sequence length is a multiple of 34
    my $len = length($sequence);
    if ($len % 3 != 0) {
        warn "Warning: Sequence length is not a multiple of 3..\n";
        $sequence = substr($sequence, 0, $len - ($len % 3));
    }

    # Codon counting
    for (my $i = 0; $i < length($sequence) - 2; $i += 3) {
        my $codon = substr($sequence, $i, 3);
        next if $codon =~ /[^ACGT]/;  # Skip ambiguous codons
        $codon_count{$codon}++;
    }
}

# Calculate total codons
my $total_codons = 0;
$total_codons += $_ for values %codon_count;

# Print codon frequencies with amino acids
print "Codon\tAminoAcid\tCount\tFrequency\n";
foreach my $codon (sort keys %codon_count) {
    my $aa = $codon_table->translate($codon);  # Translate codon to amino acid
    my $freq = $codon_count{$codon} / $total_codons;
    printf "%s\t%s\t\t%d\t%.4f\n", $codon, $aa, $codon_count{$codon}, $freq;
}
