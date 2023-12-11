# simulation cycles
$total_time     = 0

# paths of directories
$tc_dir         = <testcase_data_directory>
$matlab_dir     = <matlab_working_directory>
$sim_dir        = <modelsim_working_directory>


# matlab script & modelsim do script
$matlab_script  = <matlab_script_name>
$do_file        = $sim_dir + "sim.do"

# record files
$err_file       = $tc_dir + "err_info.txt"
$sim_time_file  = $tc_dir + "sim_time.txt"
$vsim_log       = $sim_dir + "vsim_log.txt"
$matlab_log     = $sim_dir + "matlab_log.txt"

# auto simulation variables
$err_num_pre    = 0
$err_num_cur    = 0

for ($i = 0; $i -le $total_time; $i++) {

    Write-Host "Cycle $i / $total_time`: "

    $exe_t = Measure-Command{
        $matlab_cmd = "cd " + $matlab_dir + "; " + $matlab_script + "; exit;"

        matlab -automation -wait `
            -r $matlab_cmd `
            -logfile $matlab_log
    }
    $sim_time = Get-Content -Path $sim_time_file
    Write-Host "Matalb execution $sim_time finished, $($exe_t.TotalSeconds) s elapsed."

    $exe_t = Measure-Command{
        vsim -batch -nostdout -nosyncio `
            -logfile $vsim_log -do $do_file
    }

    Write-Host "ModelSim execution $sim_time finished, $($exe_t.TotalSeconds) s elapsed."

    # save testcase when error occurs
    $err_exist = Test-Path -Path $err_file
    if ($err_exist) {
        $err_num_cur = Get-Content -Path $err_file
        $err_num_cur = [int]$err_num_cur

        if ($err_num_cur -ne $err_num_pre) {
            Write-Host "Error occurs $err_num_cur times in total."

            $new_dir_path = $dir_path + "err_cases\" + $err_num_cur
            New-Path $new_dir_path -ItemType Directory -Force

            Copy-Item -Path (-join ($dir_path, "*.txt")) -Destination $new_dir_path
            Copy-Item -Path $vsim_log -Destination $new_dir_path
        }
        $err_num_pre = $err_num_cur
    }
    Write-Host ""
}

if (!$err_exist) {
    Write-Host "No error detected."
}


