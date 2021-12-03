# read input
lines = readlines(stdin);

# split and parse lines
nums = collect(Iterators.map(x -> parse.(Int, split(x, "")), lines));

# sum cols
s = sum(nums, dims = 1)

# map to bool array with true where sum > 500
q = collect(Iterators.map(x -> x > 500, s[1]))

# generate powers of 2
pows = reverse!(collect(Iterators.map(z -> UInt64(1) << (z[1] - 1), enumerate(q))))

# calculate results

n1 = sum(q .* pows)
n2 = sum(.!q .* pows)

println(n1 * n2)
