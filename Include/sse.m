function e = sse(x, y)
  if size(x) != size(y)
    error('Dimension of x and y must agree')
  end
  e = (1 / 2) * sum((x - y) .^ 2);
endx 