function r = fcmp(v1, v2, epsilon)
  r = abs(v1 - v2) < epsilon;
end