#!/bin/bash

echo "#!/bin/bash" > st-$1.sh

#./MakeGaussianInp.sh $1 3-21G "3-21G"

#./MakeGaussianInp.sh $1 6-31G "6-31G"
#./MakeGaussianInp.sh $1 6-31G_d "6-31G(d)"
./MakeGaussianInp.sh $1 6-31G_dp "6-31G(d,p)"

#./MakeGaussianInp.sh $1 6-311G "6-311G"
#./MakeGaussianInp.sh $1 6-311G_d "6-311G(d)"
#./MakeGaussianInp.sh $1 6-311G_dp "6-311G(d,p)"

##./MakeGaussianInp.sh $1 aug-cc-pVDZ "aug-cc-pVDZ"
#./MakeGaussianInp.sh $1 aug-cc-pVTZ "aug-cc-pVTZ"
#./MakeGaussianInp.sh $1 aug-cc-pVQZ "aug-cc-pVQZ"
