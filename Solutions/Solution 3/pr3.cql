from P get 0 as p0, 1 as p1, 2 as p2, 3 as p3 &
from Q get 0 as q0, 1 as q1, 2 as q2, 3 as q3 =>
if (p0 == q0) then (
    let r1 = (isEmpty(p1)) ? q1 : p1 & 
    let r2 = (isEmpty(p2)) ? q2 : p2 & 
    let r3 = (isEmpty(p3)) ? q3 : p3 =>
    -> {p0, r1, r2, r3}
) else (
    -> {}
)