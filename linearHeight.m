function h = linearHeight(pp, i, d)
  h = pp.q(i) + d * (pp.q(i + d) - pp.q(i)) / (pp.n(i + d) - pp.n(i));
end