#!/bin/bash

echo "#!/bin/bash" > st-$1.sh

#./MakeGaussianInp.sh $1 3-21G "3-21G"

#./MakeOrcInp.sh $1 6-31G "6-31G"
#./MakeOrcInp.sh $1 6-31G_d "6-31G(d)"
#./MakeOrcInp.sh $1 6-31G_dp "6-31G(d,p)"

#./MakeOrcInp.sh $1 6-311G "6-311G"
#./MakeOrcInp.sh $1 6-311G_d "6-311G(d)"
#./MakeOrcInp.sh $1 6-311G_dp "6-311G(d,p)"

./MakeGaussianInp.sh $1 aug-cc-pVDZ "aug-cc-pVDZ"
#./MakeOrcInp.sh $1 aug-cc-pVTZ "aug-cc-pVTZ"
#./MakeOrcInp.sh $1 aug-cc-pVQZ "aug-cc-pVQZ"

#./MakeGaussianInp.sh $1 6-31G_dp "6-31G(d,p)"
