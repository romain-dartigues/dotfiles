#!/usr/bin/env python
import os
import sys
import time

from timeit import timeit;timeit
from pprint import pprint;pprint
try:
	import readline
except ImportError:
	pass
else:
	import rlcompleter
	readline.parse_and_bind("tab: complete")





sys.dont_write_bytecode = True


def binary_prefix(value, binary=True):
	'''Return a tuple with a scaled down version of value and it's binary prefix

	Parameters:
	- `value`: numeric type to trim down
	- `binary`: use binary (ICE) or decimal (SI) prefix

	Usage::
	>>> ['%.2f %sB' % binary_prefix(nbr) for nbr in (12, 1023, 1028, 4096, 1<<16, 1<<32, 1<<128)]
	['12.00 B', '1023.00 B', '1.00 KiB', '4.00 KiB', '64.00 KiB', '4.00 GiB', '274877906944.00 YiB']
	>>> [k % binary_prefix(v, False) for k,v in {'modem %u %s':56000, 'SATA %u %sb/s':3*10**9, 'Ethernet %u%sb/s': 10**7, 'income %.1f %s EUR':-7**8}.iteritems()]
	['income -5.8 M EUR', 'modem 56 k', 'SATA 3 Gb/s', 'Ethernet 10Mb/s']
	'''
	SI = 'kMGTPEZY'
	unit = (1000.,1024.)[binary]
	for i in range(-1, len(SI)):
		if abs(value) < unit:
			break
		value/= unit
	return value, (SI[i:i+1], SI[i:i+1].upper() + 'i')[binary]
