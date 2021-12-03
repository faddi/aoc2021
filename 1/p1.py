import sys

prev = None
counter = 0

for line in sys.stdin:

    current = int(line)

    if prev is not None and prev < current:
        counter += 1

    prev = current

print(f"result: {counter}")
