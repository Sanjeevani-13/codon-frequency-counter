# Codon Frequency Counter (BioPerl)

This project provides a simple BioPerl script that calculates codon usage frequency from DNA sequences in FASTA format. The script reads a FASTA file, extracts the DNA sequence, counts how many times each codon (a triplet of nucleotides) occurs, and then calculates the relative frequency of each codon. The results are displayed in a clear, tabular format.


## Features

* Reads DNA sequences directly from FASTA files
* Ensures sequence length is adjusted to a multiple of three (truncating extra bases if necessary)
* Counts occurrences of all 64 codons
* Calculates codon frequencies relative to the total codon count
* Produces an easy-to-read output table


## Requirements

* Perl (version 5.10 or later recommended)
* BioPerl library

If BioPerl is not installed, it can be added via CPAN:

```bash
cpan Bio::Perl
```


## Usage

1. Clone this repository:

   ```bash
   git clone https://github.com/<your-username>/codon-frequency-counter.git
   cd codon-frequency-counter
   ```

2. Run the script with a FASTA file as input:

   ```bash
   perl codon_counter.pl sequence.fasta
   ```


## Example Input

A sample FASTA file might look like this:

```fasta
>Example_Sequence
ATGCGATAACGCTAGCGCTAGCTAAGCTAGCTAG
```


## Example Output

The script will generate a table of codons, their counts, and their relative frequencies:

```
Codon   Count   Frequency
AAG     1       0.0667
AAC     1       0.0667
AAT     1       0.0667
ATG     1       0.0667
...
```

## Workflow

1. The script reads the FASTA file using BioPerl.
2. It extracts the DNA sequence and converts it to uppercase.
3. If the sequence length is not a multiple of three, extra bases are removed from the end.
4. Codons are counted by scanning the sequence three bases at a time.
5. Relative frequencies are calculated as codon count divided by total codons.
6. The output is displayed as a table.


## Applications

This tool can be used in:

* Codon usage analysis in molecular biology
* Comparative genomics
* Synthetic biology (for codon optimization)
* Educational purposes in bioinformatics

