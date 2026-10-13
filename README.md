# M152ALab2
MSB = signed bit
0th bit = LSB
we're taking a 12 bit int 2's complement -> 8 bit FP representation

if #s negative we immediately do 2's complement, if not we keep as is 
takes input, negates it, adds 1
-422 111001011010
~111001011010 = 000110100101
+1 = 000110100110

FP sign bit = 11th bit of input
how do we get exponent?
E = 8 - leading 0s
000110100110 has 3 leading 0s -> exponent = 5
8 or greater leading zeros -> exponent = 0

significand
4 bits immediately after the leading zeros
000110100110 -> 1101 (we can get this more easily by shifting << # leading 0s)
-> 110100110000 -> then get first 4 bits to get significand (11-8 bits)
shifted = magnitude[11:8] = F

