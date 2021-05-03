from P get 0 as p0, 1 as p1, 2 as p2, 3 as p3 &
from Q get 0 as q0, 1 as q1, 2 as q2, 3 as q3 =>
if (p3 == q3) then (
    let r0 = (isEmpty(q0)) ? p0 : q0 & 
    let r1 = (isEmpty(q1)) ? p1 : q1 & 
    let r2 = (isEmpty(q2)) ? p2 : q2 =>
    -> {r0, r1, r2, q3}
) else (
    -> {}
)
