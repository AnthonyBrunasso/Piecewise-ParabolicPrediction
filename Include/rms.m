function e = rms(x, y)
  e = sqrt((2 * sse(x, y)) / length(x));
end