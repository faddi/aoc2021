import sys

l = []
counter = 0

for line in sys.stdin:

    l.append(int(line))

    if len(l) < 4:
        continue

    if sum(l[-4:-1]) < sum(l[-3:]):
        counter += 1

print(f"result: {counter}")
