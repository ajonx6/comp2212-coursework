from F get 0 as f0, 1 as f1, 2 as f2, [1,2] as f12 &
from G get 0 as g0, 1 as g1, 2 as g2, [0,1] as g01 =>
if (notEmpty(f1)) then (
	if (notEmpty(f2)) then (
		if (g01 == f12) then (
			-> {f0, g2}
		)
		else (-> {})
	)
	else (-> {})
)
else (-> {})