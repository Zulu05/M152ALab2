# M152ALab2
MSB = signed bit
0th bit = LSB
we're taking a 12 bit int 2's complement (if negative) -> 8 bit FP representation
V = (-1)^s * F * 2^E

if #s negative we immediately do 2's complement, if not we keep as is 
takes input, negates it, adds 1
-422 111001011010
~111001011010 = 000110100101
+1 = 000110100110

FP sign bit = 11th bit of input
how do we get exponent?
E = 8 - leading 0s
000110100110 has 3 leading 0s -> exponent = 5 (101)
8 or greater leading zeros -> exponent = 0

significand
4 bits immediately after the leading zeros
000110100110 -> 1101 (we can get this more easily by shifting << # leading 0s)
-> 110100110000 -> then get first 4 bits to get significand (11-8 bits)
shifted = magnitude[11:8] = F
<< shifting divides input by 2^(#shifted) (fills in with 0s)
>> denotes multiplication

Rounding
based on fifth bit immediately following leading 0 (bit right after significand)
if 5th bit is 0 = truncating = do nothing -> F = 1101
5h bit is 1 (11011) = add 1 to significand -> F = 1101 + 1 = 1110 = F -> FP = [0 101 1110]

Caveat
F = 1111 and 5th bit is a 1 -> 1111 + 1 = 10000 (then we right shift) >> 1 = 1000
then we add 1 to exponent to account for overflow -> FP = 0 110 1000

Caveat 2
only happens in 1 instance: 011111111111 = 2047 (largest positive int with 12 bits)
LZ = 0 -> E = 8
Significand: 1111
5th bit = 1 -> Significand = 1000 -> E+1 overflows -> to account for double overflow we cap E to 7 and F to 15
E capped at 111 and F capped at 1111
FP = 0 111 1111

Ex 1) 0 00000000 110
S = 0
E = 000
F = 1100

