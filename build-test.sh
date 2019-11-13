#!/bin/bash
source env-fenics.sh

function write_to_sbatch(){
  echo $1 >> $2
}

function create_sbatch(){
  > test_$1proc.sbatch
  write_to_sbatch "#!/bin/bash" "test_$1proc.sbatch"
  write_to_sbatch "#SBATCH --nodes=1" "test_$1proc.sbatch"
  write_to_sbatch "#SBATCH --ntasks=$1" "test_$1proc.sbatch"
  write_to_sbatch "#SBATCH --time=00:30:00" "test_$1proc.sbatch"
  write_to_sbatch "#SBATCH --qos=testing" "test_$1proc.sbatch"
  write_to_sbatch "#SBATCH --partition=shas-testing" "test_$1proc.sbatch"
  write_to_sbatch "#SBATCH --output=p$1.out" "test_$1proc.sbatch"
  write_to_sbatch "echo \" Launching job with $1 processes\" " "test_$1proc.sbatch"
  write_to_sbatch "module purge" "test_$1proc.sbatch"
  write_to_sbatch "source ${PREFIX}/run-env-fenics.sh" "test_$1proc.sbatch"
  write_to_sbatch "mpirun -np $1 python3 poi.py" "test_$1proc.sbatch"
  write_to_sbatch "echo \"============= $1 proc done ============= \" " "test_$1proc.sbatch"
  write_to_sbatch "echo \"============================================  \" " "test_$1proc.sbatch"
  mv test_$1proc.sbatch test/
}

create_sbatch "1"
create_sbatch "6"
create_sbatch "12"
