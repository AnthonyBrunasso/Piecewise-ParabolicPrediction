function obj = pp(p, obs)
  obj.p = p;
  obj.q = [];
  obj.np = [1, 1 + 2 * p, 1 + 4 * p, 3 + 2 * p, 5];
  obj.dn = [0, p / 2, p, (1 + p) / 2, 1];
  obj.n = 1:5;
  obj.count = 0;
  if nargin == 2
    for o = obs
     obj = addObservation(obj, o);
    end
  end
end

%!test
%! addpath('include');
%! x = 1:100;
%! p = pp(0.5, x);
%! assert(fcmp(p.q(3), quantile(x, 0.5), 1.0));
%!test
%! x = 1:1000;
%! p = pp(0.5, x);
%! assert(fcmp(p.q(3), quantile(x, 0.5), 1.0));
%!test
%! x = 1:1000;
%! p = pp(0.25, x);
%! assert(fcmp(p.q(3), quantile(x, 0.25), 1.0));
%!test
%! # TODO: This blows up the stack if it's not transposed, that's dumb
%! x = rand(10)(:)';
%! p = pp(0.5, x);
%! assert(fcmp(p.q(3), quantile(x, 0.5), 0.1));

