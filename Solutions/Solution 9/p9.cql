from R get 0 as r10, 1 as r11 &
from R get 0 as r20, 1 as r21 &
from R get 0 as r30, 1 as r31 &
from R get 0 as r40, 1 as r41 =>
if (r11 == r20) then (
	if (r21 == r30) then (
		if (r31 == r40) then (
			-> {r10, r31}
		) else (-> {})
	) else (-> {})
) else (-> {})