# TestMtr Version #0.6, Release date 2/6/12
# mtr/testmtr -p 2 ./mtr/test.groups
N=0x1cad010  C=0x1cad0d0  Y=0x0        E=0x0        P=0x0        F=0 L=0 S=0
N=0x1cad0d0  C=0x0        Y=0x1cad110  E=0x0        P=0x1cad010  F=3 L=0 S=0
N=0x1cad110  C=0x0        Y=0x1cad050  E=0x1cad0d0  P=0x1cad010  F=4 L=0 S=0
N=0x1cad050  C=0x0        Y=0x1cad090  E=0x1cad110  P=0x1cad010  F=1 L=0 S=0
N=0x1cad090  C=0x0        Y=0x0        E=0x1cad050  P=0x1cad010  F=2 L=0 S=0
#------------------------
N=0x1cad010  C=0x0        Y=0x0        E=0x0        P=0x0        F=0 L=0 S=12
#  (0,11)

N=0x1cad010  C=0x1cad0d0  Y=0x0        E=0x0        P=0x0        F=0 L=0 S=12
N=0x1cad0d0  C=0x0        Y=0x1cad110  E=0x0        P=0x1cad010  F=0 L=0 S=6
N=0x1cad110  C=0x0        Y=0x0        E=0x1cad0d0  P=0x1cad010  F=0 L=6 S=6
#  (0(0,5)(6,11)11)

N=0x1cad010  C=0x1cad190  Y=0x0        E=0x0        P=0x0        F=0 L=0 S=12
N=0x1cad190  C=0x1cad0d0  Y=0x0        E=0x0        P=0x1cad010  F=4 L=0 S=12
N=0x1cad0d0  C=0x1cad050  Y=0x1cad110  E=0x0        P=0x1cad190  F=0 L=0 S=6
N=0x1cad050  C=0x0        Y=0x1cad090  E=0x0        P=0x1cad0d0  F=0 L=0 S=2
N=0x1cad090  C=0x0        Y=0x1cad150  E=0x1cad050  P=0x1cad0d0  F=0 L=2 S=2
N=0x1cad150  C=0x0        Y=0x0        E=0x1cad090  P=0x1cad0d0  F=0 L=4 S=2
N=0x1cad110  C=0x0        Y=0x0        E=0x1cad0d0  P=0x1cad190  F=0 L=6 S=6
#  (0(0(0(0,1)(2,3)(4,5)5)(6,11)11|F)11)

#  (0(0(0,1)(2,3)(4,5)5)(6,11)11|F)
N=0x1cad010  C=0x1cad190  Y=0x0        E=0x0        P=0x0        F=0 L=0 S=12
N=0x1cad190  C=0x1cad050  Y=0x0        E=0x0        P=0x1cad010  F=4 L=0 S=12
N=0x1cad050  C=0x0        Y=0x1cad090  E=0x0        P=0x1cad190  F=0 L=0 S=2
N=0x1cad090  C=0x0        Y=0x1cad150  E=0x1cad050  P=0x1cad190  F=0 L=2 S=2
N=0x1cad150  C=0x0        Y=0x1cad110  E=0x1cad090  P=0x1cad190  F=0 L=4 S=2
N=0x1cad110  C=0x0        Y=0x0        E=0x1cad150  P=0x1cad190  F=0 L=6 S=6
#  (0(0(0,1)(2,3)(4,5)(6,11)11|F)11)

N=0x1cad010  C=0x1cad190  Y=0x0        E=0x0        P=0x0        F=0 L=0 S=12
N=0x1cad190  C=0x1cad050  Y=0x0        E=0x0        P=0x1cad010  F=4 L=0 S=12
N=0x1cad050  C=0x0        Y=0x1cad090  E=0x0        P=0x1cad190  F=0 L=0 S=2
N=0x1cad090  C=0x0        Y=0x1cad110  E=0x1cad050  P=0x1cad190  F=0 L=2 S=2
N=0x1cad110  C=0x0        Y=0x1cad150  E=0x1cad090  P=0x1cad190  F=0 L=4 S=6
N=0x1cad150  C=0x0        Y=0x0        E=0x1cad110  P=0x1cad190  F=0 L=10 S=2
#  (0(0(0,1)(2,3)(4,9)(10,11)11|F)11)
#------------------------
N=0x1cad010  C=0x0        Y=0x0        E=0x0        P=0x0        F=0 L=0 S=4
#  (0,3)

N=0x1cad010  C=0x1cad190  Y=0x0        E=0x0        P=0x0        F=0 L=0 S=4
N=0x1cad190  C=0x0        Y=0x1cad050  E=0x0        P=0x1cad010  F=4 L=0 S=2
N=0x1cad050  C=0x0        Y=0x0        E=0x1cad190  P=0x1cad010  F=4 L=2 S=2
#  (0(0,1|F)(2,3|F)3)

#------------------------
N=0x1cad010  C=0x1cad190  Y=0x0        E=0x0        P=0x0        F=0 L=0 S=12
N=0x1cad190  C=0x1cad090  Y=0x1cad050  E=0x0        P=0x1cad010  F=0 L=0 S=6
N=0x1cad090  C=0x0        Y=0x1cad110  E=0x0        P=0x1cad190  F=0 L=0 S=2
N=0x1cad110  C=0x0        Y=0x1cad150  E=0x1cad090  P=0x1cad190  F=0 L=2 S=2
N=0x1cad150  C=0x0        Y=0x0        E=0x1cad110  P=0x1cad190  F=0 L=4 S=2
N=0x1cad050  C=0x0        Y=0x0        E=0x1cad190  P=0x1cad010  F=4 L=6 S=6
#  (0(0(0,1)(2,3)(4,5)5)(6,11|F)11)

