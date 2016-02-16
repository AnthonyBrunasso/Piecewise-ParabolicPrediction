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