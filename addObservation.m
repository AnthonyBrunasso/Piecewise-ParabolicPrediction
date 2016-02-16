function [obj, q] = addObservation(pp, observation)
  if !isfield(pp, 'q') || !isfield(pp, 'p') || !isfield(pp, 'n')
    error('Initialize pp with pp() function');
  end
  # Make sure observations are added one at a time (for now)
  if length(observation) > 1
    for o = observation
      obj = addObservation(pp, o);
    end
  end
  if pp.count < 5
    pp.q = [pp.q observation];
  end
  # Only sort observations once, when data gets to 5 observations
  pp.count += 1;
  if pp.count == 5
    pp.q = sort(pp.q);
  elseif pp.count > 5
    [pp, q] = updateEstimates(pp, observation);
  end
  obj = pp;
end