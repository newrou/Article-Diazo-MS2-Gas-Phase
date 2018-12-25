#!/bin/bash

echo "#!/bin/bash" > st-$1.sh

#./MakeGaussianInp.sh $1 3-21G "3-21G"

./MakeGaussianInp.sh $1 aug-cc-pVDZ "aug-cc-pVDZ"

#./MakeGaussianInp.sh $1 6-31G_dp "6-31G(d,p)"
