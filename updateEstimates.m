function [obj, q] = updateEstimates(pp, obs)
  if !isfield(pp, 'q') || !isfield(pp, 'p') || !isfield(pp, 'n')
    error('Initialize pp with pp() function');
  end
  f = find(pp.q > obs);
  if length(f) == 0
    k = 4;
    pp.q(5) = obs;
  elseif f(1) == 1
    k = 1;
    pp.q(1) = obs;
  else
    k = f(1) - 1;
  end
  disp(k);
  # Increment positions of markers k+1 through 5
  pp.n(k + 1:5) += 1;
  # Update desired position for all markers
  pp.np += pp.dn;
  # Adjust heights of markers 2-4 if necessary
  for i = 2:4
    d = pp.np(i) - pp.n(i);
    if (d >= 1 && pp.n(i + 1) - pp.n(i) > 1) || ...
       (d <= -1 && pp.n(i - 1) - pp.n(i) < -1)
      d = sign(d);
      # Adjust qi using P^2 formula:
      h = parabolicHeight(pp, i, d);
      if pp.q(i - 1) < h && h < pp.q(i + 1)
        pp.q(i) = h;
      else
        pp.q(i) = linearHeight(pp, i, d);
      end
      pp.n(i) = pp.n(i) + d;
    end
  end
  obj = pp;
  q = pp.q(3);
end
