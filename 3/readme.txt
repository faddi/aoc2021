cat input.txt | docker run -i --rm -v "$PWD":/usr/myapp -w /usr/myapp julia julia script.jl
cat input.txt | docker run -i --rm -v "$PWD":/usr/myapp -w /usr/myapp julia julia script2.jl
