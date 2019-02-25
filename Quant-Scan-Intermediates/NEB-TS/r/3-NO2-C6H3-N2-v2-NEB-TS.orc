! B3LYP/G aug-cc-pVDZ TightSCF Grid7 NEB-TS
%scf MaxIter 1000 end
%geom MaxIter 1000 TolE 1e-8 TolRMSG 5e-7 TolMaxG 1e-6 Convergence tight end
%neb
  Nimages 12
  neb_end_xyzfile "3-NO2-C6H3-N2-v2-final.xyz"
end
* xyzfile 0 1 3-NO2-C6H3-N2-v2-source.xyz
%pal nprocs 42 end
