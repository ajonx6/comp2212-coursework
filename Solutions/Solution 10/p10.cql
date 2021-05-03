from S get 0 as s0, 1 as s1, 2 as s2 &
from T get 0 as t0, 1 as t1, 2 as t2 =>
if (s0 == s1) then (
	if (t1 == t2) then (
		-> {s2,t0}
	) else (-> {})
) else (-> {})