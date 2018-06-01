def spaces():
    """Separate characters with spaces."""
    import sys
    for line in sys.stdin:
        sys.stdout.write(' '.join(line))

def spark_lines():
    """Find the lines of shakespeare last in the alphabet.

    Run within pyspark.

    Uncomment extra lines to run with spark-submit.

    E.g., cat shakespeare.txt | sort -r | head -n2
    """
    # from pyspark import SparkContext
    # sc = SparkContext(appName="LastLines")

    lines = sc.textFile('shakespeare.txt')
    a, b = lines.sortBy(lambda s: s, False).take(2)
    print(a)
    print(b)

def vowels(line):
    """Yield (vowel, count) pairs."""
    for v in 'aeiou':
        if v in line:
            yield (v, line.count(v))

def count(f='shakespeare.txt'):
    """Count vowels in a text file.
    
    Run "top" to compare with count_with_spark.
    """
    from collections import Counter
    c = Counter()
    lines = open(f).readlines()
    for counts in map(vowels, lines):
        for v, n in counts:
            c[v] += n
    print(c)

def count_with_spark(f='shakespeare.txt'):
    """Count vowels in a text file.
    
    Run with spark-submit.
    """
    from pyspark import SparkContext
    sc = SparkContext(appName="VowelCount")
    from operator import add

    lines = sc.textFile(f)
    counts = lines.flatMap(vowels).reduceByKey(add).sortByKey().collect()
    print(counts)
