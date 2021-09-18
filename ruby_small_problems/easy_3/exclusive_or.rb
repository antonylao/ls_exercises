def xor?(cond_a, cond_b)
  (!!cond_a && !cond_b) || (!cond_a && !!cond_b)
end

puts(xor?(5.even?, 4.even?) == true,
xor?(5.odd?, 4.odd?) == true,
xor?(5.odd?, 4.even?) == false,
xor?(5.even?, 4.odd?) == false,
xor?(5, 4.odd?) == true,
xor?(5.odd?, 4) == false,
xor?(5.even?, 4) == true,
xor?(4, 5.even?) == true
)