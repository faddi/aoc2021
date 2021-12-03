# read input
lines = readlines(stdin);

# split and parse lines
nums = collect(Iterators.map(x -> parse.(Int, split(x, "")), lines));

function red(n, index, pick)

    total_num_rows = size(n)[1]

    # return if only one row left
    if total_num_rows == 1
        return n[1]
    end

    # sum cols
    s = sum(n, dims = 1)

    # pick entry
    v = pick(s[1][index], total_num_rows) ? 1 : 0

    # pick only rows with relevant entries in the current column index
    o = filter(z -> z[index] == v, n)

    # recurse
    return red(o, index + 1, pick)
end


a = red(nums, 1, (total, num_rows) -> total >= (num_rows / 2))
b = red(nums, 1, (total, num_rows) -> total < (num_rows / 2))

# generate powers of 2
pows = reverse!(collect(Iterators.map(z -> UInt64(1) << (z[1] - 1), enumerate(a))))

# calc result
n1 = sum(a .* pows)
n2 = sum(b .* pows)

println(n1 * n2)
